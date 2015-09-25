var util = require('util');
var express = require('express');
var reload = require('reload');
var q = require('q');
var sprintf = require('sprintf').sprintf;
var common = require('../module/common');
var products = require('../module/products');
var app = express.Router();

app.post('/save', function (req, res) {
    common.checkLogin(req, res, 0);
    $arr.error = '';
    var attach = require('../module/attach');
    attach.save('product', req, res);
    q.all(products.save(req, config.mysql, q)).then(function (results) {
        //console.log(333);
        customerio = require('../module/customerio');
        customerio.uid = req.session.userid;
        customerio.inits();

        customerio.createCustomer({
            email: req.session.email,
            user: {firstName: req.session.first_name, lastName: req.session.last_name}
        });

        customerio.sendEmail({
            event: 'project_posted',
            content: {
                user: req.session.first_name + ' ' + req.session.last_name,
                name: req.body.title,
                url: config.url + '/product/view/' + results[0].insertId
            }
        });
        res.writeHead(302, {
            'Location': '/product/my'
        });
        res.end();
        return false;
    });
});
app.get('/post', function (req, res) {
    $arr.externalcss = ['datePicker'];
    $arr.externaljs = ['jquery.datePicker'];
    common.checkLogin(req, res, 0);
    $arr.error = '';
    products.post(req, res, $arr);
});

app.get(['/my/', '/my/:page'], function (req, res) {
    res.writeHead(302, {
        'Location': '/dashboard'
    });
    res.end();
    return false;
    $arr.error = '';
    common.checkLogin(req, res, 0);
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([products.myproducts(req, config.mysql, q, 0), products.myproducts(req, config.mysql, q, 1)]).then(function (results) {
        //console.log(results[0]);
        // console.log(2);
        $arr['projects'] = products.shortDescribe(results[0][0]);
        $arr['pagination'] = products.shortDescribe(results[1][0]).length;
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/product/my',
            current: req.body.page,
            rowsPerPage: 15,
            totalResult: $arr['pagination']
        });

        $arr['pagination_html'] = paginator.render();
        common.tplFile('myprojects.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);

    });
});


app.get(['/view/', '/view/:id', '/bid/:pid', '/buynow/:sid'], function (req, res) {
    $arr.error = '';
    req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
    req.body.id = (typeof(req.param('pid')) !== 'undefined') ? req.param('pid') : req.body.id;
    req.body.id = (typeof(req.param('sid')) !== 'undefined') ? req.param('sid') : req.body.id;
    $arr['externaljs'] = ['owl.carousel'];
    $arr['externalcss'] = ['owl.carousel', 'owl.theme'];
    $arr['bidshow'] = (typeof(req.param('pid')) !== 'undefined');
    $arr['buyshow'] = (typeof(req.param('sid')) !== 'undefined');

    seated = require('../module/seated_auction.js');
    q.all([products.productDetail(req, config.mysql, q), seated.checkuserSeated(req, config.mysql, q), seated.checkSeatedCount(req, config.mysql, q)]).then(function (results) {
        //console.log(results[0]);
        if (req.body.id > 0 && results[0][0].length == 0)
            res.redirect('/');

        bids = require('../module/bid');
        var dateFormat = require('dateformat');
        var date = require('date-utils');
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        prdt = results[0][0][0];
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        //console.log(Date.compare(closeddate,datenow)+'as');
        if ((Date.compare(closeddate, datenow) <= 0) && prdt['market_status'] == 'open') {
            res.writeHead(302, {
                'Location': '/product/close/' + req.body.id
            });
            res.end();
            return false;
        }
        $arr['bid_credits'] = 0;
        q.all([bids.bidHistory(req, config.mysql, q, 0), bids.bidHistory(req, config.mysql, q, 1), products.bidWinner(req, config.mysql, q), products.auctionSold(req, config.mysql, q), products.productImage(req, config.mysql, q), bids.getBidsCredits(req, config.mysql, q), bids.checkbidPlaced(req, config.mysql, q)]).then(function (results2) {
            //console.log(results2[1][0][0]['bid']);
            // console.log(results2[5][0][0]); return 0;
            if (results2[5][0].length > 0)
                $arr['bid_credits'] = results2[5][0][0]['paid'];
            $arr['bids'] = results2[0][0];
            $arr['bcnt'] = results2[1][0][0]['bid'];
            $arr['winbid'] = $arr['highbid'] = $arr['soldhim'] = $arr['placedbid'] = false;
            $arr['placedbidamount'] = 0;
            if (results2[0][0].length > 0 && typeof(req.session) !== 'undefined') {
                if ((results2[0][0][0]['user_id'] == req.session.userid) && (results2[0][0][0]['user_id'] == results[0][0][0]['user_id'])) {
                    $arr['winbid'] = true;
                }
            }
            if (results2[3][0].length > 0) {
                $arr['soldhim'] = true;
            }
            if (results2[0][0].length > 0 && typeof(req.session) !== 'undefined' && results2[2][0].length == 0) {
                if (results2[0][0][0]['user_id'] == req.session.userid) {
                    $arr['highbid'] = true;
                }
            }
            if (typeof(req.session.placedbid) !== 'undefined') {

                $arr['placedbidamount'] = req.session.placedbidamount;
                delete req.session.placedbid;
                delete req.session.placedbidamount;
                $arr['placedbid'] = true;
            }
            $arr['project'] = products.shortDescribe(results[0][0]);
            $arr['images'] = results2[4][0];
            $arr['projects'] = $arr['project'][0];
            $arr['projects']['seatsLeft'] = results[0][0][0].seats - results[2][0][0].seatsBooked;
            $arr['projects']['user_has_bid'] = false;
            $arr['projects']['met_reserve_price'] = false;
            if (results2[6][0].length) {
                $arr['projects']['user_has_bid'] = (results2[6][0][0]['user_id'] > 0);
            }
            if (results2[0][0].length) {
                $arr['projects']['met_reserve_price'] = (results2[0][0][0]["proposed_amount"] >= results[0][0][0].rprice);
            }
            $arr['projects']['seatsbooked'] = results[1][0].length;

            common.tplFile('product.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        });
    });
});
/*app.get(['/bid/','/bid/:id'], function(req, res){
 $arr.error = '';
 config.perbid = global.general.bidincrement;
 q.all(products.productDetail(req,config.mysql,q)).then(function(results){
 var dateFormat = require('dateformat');
 var date = require('date-utils');
 datenow = dateFormat(new Date(),"yyyy-mm-dd HH:MM:ss");
 prdt = results[0][0];

 closeddate = dateFormat(new Date(prdt['date_closed']),"yyyy-mm-dd HH:MM:ss");

 if((Date.compare(closeddate,datenow) <= 0 ) && prdt['market_status'] == 'open')
 {
 res.writeHead(302, {
 'Location': '/product/close/'+req.param('id')
 });
 res.end();return false;
 }
 //console.log(results[0]);
 $arr['project'] = products.shortDescribe(results[0]);
 $arr['projects'] = $arr['project'][0];

 $arr['projects']['wsprice'] = parseFloat(parseFloat($arr['projects']['wprice'])+parseFloat(config.perbid)).toFixed(2);
 //console.log($arr['projects']);

 common.tplFile('bid.tpl');
 common.headerSet(1);
 common.loadTemplateHeader(req,res,$arr);

 });
 });*/
app.get('/closeall', function (req, res) {

    var bids = require('../module/bid');
    var dateFormat = require('dateformat');
    var date = require('date-utils');
    datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var addTasksToProject = function (pid, cb) { // called once for each project row
        var prdt = pid;
        //console.log(pid);
        //console.log(2);
        req.params.id = pid.id;
        //console.log(req.params.id);
        var bids = require('../module/bid');

        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        //console.log(datenow);
        //console.log(closeddate);
        //console.log(Date.compare(closeddate,datenow));
        //console.log(prdt['market_status']);
        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {

            // console.log(req.param('id'));
            //req.params.id =  pid.id;
            //console.log(req.param('id'));

            q.all([bids.selectAwardBid(req, config.mysql, q)]).then(function (results1) {
                //console.log(1);
                //console.log(results1[0][0].length);
                var bid = results1[0][0][0];


                if (results1[0][0].length > 0) {
                    // console.log(req.params.id);
                    //console.log(bid);
                    status = 'sold';

                    products.closeProjects(req, config.mysql, q, status, pid.id);
                    payments = require('../module/payment');
                    bids.makeAwardBid(req, config.mysql, q, bid['id']);
                    bids.releaseAmount(req, config.mysql, q, bid, pid);
                    payments.transactionid = 0;
                    payments.gateway = 'account';
                    payments.sessionsdata = [];
                    payments.sessionsdata.title = pid.title;
                    payments.sessionsdata.email = bid.email;
                    payments.sessionsdata.url = config.url + '/product/view/' + pid.id;
                    payments.sessionsdata.userid = bid.user_id;
                    payments.sessionsdata.first_name = bid.first_name;
                    payments.sessionsdata.last_name = bid.last_name;
                    payments.payid = pid.id;
                    payments.type = 'winner';
                    payments.name = prdt.title;
                    payments.amount = bid.proposed_amount + pid.shipping_price;
                    payments.insertInvoice();

                    payments = require('../module/payment');
                    //console.log(3);
                    payments.sessionsdata = [];
                    payments.sessionsdata.title = pid.title;
                    payments.sessionsdata.url = config.url + '/product/view/' + pid.id;
                    payments.sessionsdata.userid = pid.user_id;
                    //console.log(4);
                    payments.sessionsdata.email = (pid.email == '') ? 'test@software.com' : pid.email;
                    payments.sessionsdata.first_name = (pid.first_name == '') ? 'test@software.com' : pid.first_name;
                    payments.sessionsdata.last_name = (pid.last_name == '') ? 'test@software.com' : pid.first_name;
                    payments.type = 'sold';
                    payments.payid = pid.id;
                    //console.log(5);
                    payments.insertInvoice();
                    //delete req.params.id;

                }
                else {
                    status = 'closed';
                    products.closeProjects(req, config.mysql, q, status, pid.id);
                }
                cb(null);
            });
        }
    };
    q.all([products.productDetails(req, config.mysql, q)]).then(function (results) {
        //console.log(results[0][0]);
        if (results[0][0].length > 0) {
            // console.log(2);
            var async = require('async');
            //console.log(addTasksToProject);
            async.each(results[0][0], addTasksToProject, function (err) {
                if (err) return console.error(err);
                res.send('200');
                // all project rows have been handled now
                //console.log(projects.rows);

            });
        }
        else {
            res.send('200');
            res.end();
        }
    });
});
app.get('/close/:id', function (req, res) {
    var bids = require('../module/bid');

    var dateFormat = require('dateformat');
    var date = require('date-utils');
    datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    q.all([bids.selectAwardBid(req, config.mysql, q), products.productDetail(req, config.mysql, q)]).then(function (results) {
        //console.log(results[0]);
        prdt = results[1][0][0];
        //console.log(prdt);
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");

        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {
            var bid = results[0][0][0];
            var pid = results[1][0][0];

            if (results[0][0].length > 0) {
                payments = require('../module/payment');
                bids.makeAwardBid(req, config.mysql, q, bid['id']);
                bids.releaseAmount(req, config.mysql, q, bid, pid);
                payments.transactionid = 0;
                payments.gateway = 'account';
                payments.sessionsdata = [];
                payments.sessionsdata.title = pid.title;
                payments.sessionsdata.email = bid.email;
                payments.sessionsdata.url = config.url + '/product/view/' + pid.id;
                payments.sessionsdata.userid = bid.user_id;
                payments.sessionsdata.first_name = bid.first_name;
                payments.sessionsdata.last_name = bid.last_name;
                payments.payid = req.param('id');
                payments.type = 'winner';
                payments.name = prdt.title;
                payments.amount = bid.proposed_amount + pid.shipping_price;
                payments.insertInvoice();
                payments.sessionsdata = [];
                payments.sessionsdata.title = pid.title;
                payments.sessionsdata.url = config.url + '/product/view/' + pid.id;
                payments.sessionsdata.userid = pid.user_id;
                payments.sessionsdata.email = (pid.email == '') ? 'test@software.com' : pid.email;
                payments.sessionsdata.first_name = (pid.first_name == '') ? 'test@software.com' : pid.first_name;
                payments.sessionsdata.last_name = (pid.last_name == '') ? 'test@software.com' : pid.first_name;
                payments.type = 'sold';
                payments.insertInvoice();
                status = 'sold'
            }
            else {
                status = 'closed';
            }
            products.closeProject(req, config.mysql, q, status);
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        //console.log($arr['projects']);
        else {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }

    });
});
app.post('/watchlist', function (req, res) {
    var log = common.checkLoginajax(req, res, 0);
    if (!log) {
        data = {access: false};
        common.ajaxjson(res, data);
    }
    else {
        q.all([products.isinWatchlist(req, config.mysql, q), products.productDetail(req, config.mysql, q)]).then(function (results) {
            if (results[0][0].length > 0) {
                data = {access: true, isadded: true}
                common.ajaxjson(res, data);

            }
            else {
                products.addWatchlist(req, config.mysql, q);
                customerio = require('../module/customerio');
                customerio.uid = req.session.userid;
                customerio.inits();

                customerio.createCustomer({
                    email: req.session.email,
                    user: {firstName: req.session.first_name, lastName: req.session.last_name}
                });

                customerio.sendEmail({
                    event: 'watchlist_added',
                    content: {user: req.session.first_name + ' ' + req.session.last_name, title: results[1][0][0].title}
                });

                data = {access: true, isadded: false}
                common.ajaxjson(res, data);

            }
        });
    }
});
app.get(['/buy/:id', '/buynow/:id/:ship'], function (req, res) {
    common.checkLogin(req, res, 0);
//console.log(req.param('ship'));

    bids = require('../module/bid');
    user = require('../module/user');
    req.body.id = req.param('id');

    var admin = require('../module/admin');

    if (req.param('ccode'))
        req.body.code = req.param('ccode');
    else
        req.body.code = '';

    q.all([bids.maxcheckbidPlaced(req, config.mysql, q), products.productDetail(req, config.mysql, q), user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount']), admin.checkcoupon(req, q, config.mysql), bids.getBidsCredits(req, config.mysql, q)]).then(function (results) {
        var bidcredits = "";
        if (results[4][0].length > 0)
            bidcredits = parseFloat(results[4][0][0].paid, 2);
        else
            bidcredits = 0;

        maxisthere = results[0][0].length;

        maxuid = 0;
        maxamt = 0;
        maxbid = [];
        if (maxisthere > 0) {
            maxbid = results[0][0][0];
            maxuid = maxbid.user_id;
            maxamt = maxbid.amt;
        }

        prdt = results[1][0][0];
        req.body.title = prdt.title;
        if (maxuid == req.session.userid) {
            results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
        }
        var dateFormat = require('dateformat');
        var date = require('date-utils');
        results[1][0][0]['wsprice'] = results[1][0][0]['wprice'] + config.perbid;
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ? maxamt : 0;
        req.body.placeamt = config.perbid;
        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {
            res.writeHead(302, {
                'Location': '/product/close/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if (prdt['market_status'] != 'open') {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if ((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount']) < results[1][0][0]['bprice'] + results[1][0][0]['shipping_price'] - bidcredits) {
            if (req.param('ccode'))
                req.session.page = config.url + '/product/buy/' + req.param('id') + '/' + req.param('ccode') + '/';
            else
                req.session.page = config.url + '/product/buynow/' + req.param('id') + '/ship';
            res.writeHead(302, {
                'Location': '/package'
            });
            res.end();
            return false;
        }

        else if (typeof req.param('ship') != 'undefined') {
            var dashboard = require('../module/dashboard');
            var admin = require('../module/admin');
            delete $arr['shipping'];
            delete $arr['product'];
            req.body.id = req.param('id');
            q.all([dashboard.getAddresses(req, config.mysql, q, 'shipping'), products.productDetail(req, config.mysql, q)]).then(function (results) {

                $arr['shipping'] = results[0][0][0];
                $arr['useremail'] = req.session.email;
                // $arr['project'] = products.shortDescribe(results[1][0][0]);
                $prdet = products.shortDescribe(results[1][0]);
                $arr['product'] = $prdet[0];
                $arr['product']['totalprice'] = parseFloat($prdet[0].bprice, 2) + parseFloat($prdet[0].shipping_price, 2);
                $arr['product']['bid_credits'] = bidcredits;

                common.tplFile('ship.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);

            });
        }
        else {
            if (maxuid > 0) {
                req.body.bid = maxbid.id;
                req.body.buid = maxbid.user_id;
                req.body.amt = maxbid.amt + results[1][0][0]['shipping_price'];
                bids.reduceReserve(req, config.mysql, q);
                bids.removeBidReserve(req, config.mysql, q);

            }
            //var bid = results[0][0][0];
            //  console.log(results[1][0][0]);
            //res.end();return false;
            var pid = results[1][0][0];

            payments = require('../module/payment');
            if ((req.param('ccode')) && req.param('ccode') != '') {
                var couponDet = results[3][0][0];
                //console.log(results[3][0][0]);
                if (couponDet.type == 'dollar') {
                    var discount = parseFloat(couponDet.amount, 2);
                    var afterDiscount = parseFloat(pid.bprice, 2) - discount;
                    //console.log(afterDiscount); return false;
                }
                else if (couponDet.type == 'percentage') {
                    var discount = (parseFloat(couponDet.amount, 2) * parseFloat(pid.bprice, 2) / 100);
                    var afterDiscount = parseFloat(pid.bprice, 2) - discount;
                    //console.log(afterDiscount); return false;
                }


                bids.makeBought(req, config.mysql, q, parseFloat(pid.bprice, 2) + parseFloat(results[1][0][0]['shipping_price'], 2), discount, parseFloat(afterDiscount, 2) + parseFloat(results[1][0][0]['shipping_price'], 2) - bidcredits, bidcredits);
                bids.reduceBalance(req, config.mysql, q, parseFloat(afterDiscount, 2) + parseFloat(results[1][0][0]['shipping_price'], 2) - bidcredits);
            }
            else {
                bids.makeBought(req, config.mysql, q, parseFloat(pid.bprice, 2) + parseFloat(results[1][0][0]['shipping_price'], 2), 0, parseFloat(pid.bprice, 2) + parseFloat(results[1][0][0]['shipping_price']) - bidcredits, bidcredits);
                bids.reduceBalance(req, config.mysql, q, parseFloat(pid.bprice, 2) + parseFloat(results[1][0][0]['shipping_price'], 2) - bidcredits);
            }


            payments.transactionid = 0;
            payments.gateway = 'account';
            payments.sessionsdata = [];
            payments.sessionsdata.title = pid.title;
            payments.sessionsdata.email = req.session.email;
            payments.sessionsdata.url = config.url + '/product/buy/' + pid.id;
            payments.sessionsdata.userid = req.session.userid;
            payments.sessionsdata.first_name = req.session.first_name;
            payments.sessionsdata.last_name = req.session.last_name;
            payments.payid = req.param('id');
            payments.type = 'bought';
            payments.name = prdt.title;
            payments.amount = pid.bprice + pid.shipping_price;
            payments.insertInvoice();
            payments.sessionsdata.userid = pid.user_id;
            payments.sessionsdata.email = pid.email;
            payments.sessionsdata.first_name = pid.first_name;
            payments.sessionsdata.last_name = pid.last_name;
            payments.type = 'sold';
            payments.insertInvoice();
            status = 'sold';
            products.closeProject(req, config.mysql, q, status);
            if (req.param('zipcode') && req.param('zipcode') != '')
                products.addShipping(req, config.mysql, q);
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;

        }
    });

});

app.post('/confirm/', function (req, res) {
    common.checkLogin(req, res, 0);
    config.perbid = global.general.bidincrement;
    bids = require('../module/bid');
    user = require('../module/user');
    q.all([bids.maxcheckbidPlaced(req, config.mysql, q), products.productDetail(req, config.mysql, q), user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount'])]).then(function (results) {
        maxisthere = results[0][0].length;

        maxuid = 0;
        maxamt = 0;
        maxbid = [];
        if (maxisthere > 0) {
            maxbid = results[0][0][0];
            maxuid = maxbid.user_id;
            maxamt = maxbid.amt;
        }

        prdt = results[1][0][0];
        req.body.title = prdt.title;
        req.body.wsprice = parseFloat(parseFloat(parseFloat(prdt.wprice) + parseFloat(config.perbid)).toFixed(2));
        if (maxuid == req.session.userid) {
            results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
        }
        var dateFormat = require('dateformat');
        var date = require('date-utils');
        results[1][0][0]['wsprice'] = results[1][0][0]['wprice'] + config.perbid;
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ? maxamt : 0;
        req.body.placeamt = config.perbid;
        //  console.log(prdt['market_status']+'asss');
        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {
            res.writeHead(302, {
                'Location': '/product/close/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if (prdt['market_status'] != 'open') {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if ((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'] - config.perbid) < parseFloat(results[1][0][0]['wsprice'], 2) + parseFloat(results[1][0][0]['shipping_price'], 2)) {
            req.session.page = config.url + '/product/confirm/' + req.param('id') + '/' + req.param('wsprice');
            res.writeHead(302, {
                'Location': '/package'
            });
            res.end();
            return false;
        }
        else if (results[1][0][0]['wprice'] <= req.body.wsprice) {
            update = 0;

            q.all(bids.placeBid(req, config.mysql, q, 1)).then(function (resbid) {
                //console.log(resbid[0]);
                req.body.placebid = resbid[0].insertId;
                if (maxuid > 0) {
                    req.body.bid = maxbid.id;
                    req.body.buid = maxbid.user_id;
                    req.body.amt = parseFloat(maxbid.amt, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                    //  console.log(req.body.amt);
                    bids.reduceReserve(req, config.mysql, q);
                    bids.removeBidReserve(req, config.mysql, q);
                }
                req.session.placedbid = true;
                req.session.placedbidamount = req.body.wsprice;
                // console.log(2);
                delete customerio;
                customerio = require('../module/customerio');
                customerio.uid = req.session.userid;
                customerio.inits();

                customerio.createCustomer({
                    email: req.session.email,
                    user: {firstName: req.session.first_name, lastName: req.session.last_name}
                });

                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: req.session.first_name + ' ' + req.session.last_name,
                        title: prdt.title,
                        amount: req.body.wsprice
                    }
                });
                req.body.wssprice = parseFloat(req.body.wsprice, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                // console.log(req.body.wssprice);
                bids.addReserve(req, config.mysql, q);
                bids.updateBid(req, config.mysql, q);
                bids.reducePoint(req, config.mysql, q);
                res.writeHead(302, {
                    'Location': '/product/view/' + req.param('id')
                });
                res.end();
                return false;
            });

        }
        else {
            q.all(bids.placeBid(req, config.mysql, q, 1)).then(function (resbid) {
                req.body.placebid = resbid[0].insertId;
                bids.reducePoint(req, config.mysql, q);
                delete customerio;
                customerio = require('../module/customerio');

                customerio.uid = req.session.userid;
                customerio.inits();
                req.session.placedbid = true;
                req.session.placedbidamount = req.body.wsprice;
                customerio.createCustomer({
                    email: req.session.email,
                    user: {firstName: req.session.first_name, lastName: req.session.last_name}
                });

                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: req.session.first_name + ' ' + req.session.last_name,
                        title: prdt.title,
                        amount: req.body.wsprice
                    }
                });

                res.writeHead(302, {
                    'Location': '/product/view/' + req.param('id')
                });
                res.end();
                return false;
            });
        }
    });
});
app.get('/confirm/:id/:wsprice', function (req, res) {
    config.perbid = global.general.bidincrement;
    $arr.error = '';
    common.checkLogin(req, res, 0);
    bids = require('../module/bid');
    user = require('../module/user');
    req.body.id = req.param('id');
    req.body.wsprice = req.param('wsprice');
    q.all([bids.maxcheckbidPlaced(req, config.mysql, q), products.productDetail(req, config.mysql, q), user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount'])]).then(function (results) {
        maxisthere = results[0][0].length;
        maxuid = 0;
        maxamt = 0;
        maxbid = [];
        if (maxisthere > 0) {
            maxbid = results[0][0][0];
            maxuid = maxbid.user_id;
            maxamt = maxbid.amt;
        }

        prdt = results[1][0][0];
        req.body.title = prdt.title;
        req.body.placeamt = config.perbid;
        req.body.wsprice = parseFloat(parseFloat(parseFloat(prdt.wprice) + parseFloat(config.perbid)).toFixed(2));

        if (maxuid == req.session.userid) {
            results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
        }
        var dateFormat = require('dateformat');
        var date = require('date-utils');
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        maxamnt = (maxuid > 0 && maxuid == req.session.user_id) ? maxamt : 0;
        results[1][0][0]['wsprice'] = results[1][0][0]['wprice'] + config.perbid;
        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {
            res.writeHead(302, {
                'Location': '/product/close/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if (prdt['market_status'] != 'open') {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if ((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'] - req.body.wsprice - config.perbid) < parseFloat(results[1][0][0]['wsprice'], 2) + parseFloat(results[1][0][0]['shipping_price'], 2)) {
            req.session.page = config.url + '/product/confirm/' + req.param('id') + '/' + req.param('wsprice');
            res.writeHead(302, {
                'Location': '/package'
            });
            res.end();
            return false;
        }
        else if (results[1][0][0]['wprice'] <= req.body.wsprice) {
            update = 0;

            q.all(bids.placeBid(req, config.mysql, q, 1)).then(function (resbid) {
                req.body.placebid = resbid[0].insertId;
                if (maxuid > 0) {
                    req.body.bid = maxbid.id;
                    req.body.buid = maxbid.user_id;
                    req.body.amt = parseFloat(maxbid.amt, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                    bids.reduceReserve(req, config.mysql, q);
                    bids.removeBidReserve(req, config.mysql, q);
                }
                req.body.wssprice = parseFloat(req.body.wsprice, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                bids.addReserve(req, config.mysql, q);
                bids.updateBid(req, config.mysql, q);
                bids.reducePoint(req, config.mysql, q);
                req.session.placedbid = true;
                req.session.placedbidamount = req.body.wsprice;
                //   console.log(2);
                delete customerio;
                customerio = require('../module/customerio');
                customerio.uid = req.session.userid;
                customerio.inits();

                customerio.createCustomer({
                    email: req.session.email,
                    user: {firstName: req.session.first_name, lastName: req.session.last_name}
                });

                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: req.session.first_name + ' ' + req.session.last_name,
                        title: prdt.title,
                        amount: req.body.wsprice
                    }
                });
                res.writeHead(302, {
                    'Location': '/product/my'
                });
                res.end();
                return false;
                res.writeHead(302, {
                    'Location': '/product/view/' + req.param('id')
                });
                res.end();
                return false;
            });
        }
        else {
            q.all(bids.placeBid(req, config.mysql, q, 1)).then(function (resbid) {
                req.body.placebid = resbid[0].insertId;
                bids.reducePoint(req, config.mysql, q);
                delete customerio;
                customerio = require('../module/customerio');
                customerio.uid = req.session.userid;
                customerio.inits();
                req.session.placedbid = true;
                req.session.placedbidamount = req.body.wsprice;
                customerio.createCustomer({
                    email: req.session.email,
                    user: {firstName: req.session.first_name, lastName: req.session.last_name}
                });

                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: req.session.first_name + ' ' + req.session.last_name,
                        title: prdt.title,
                        amount: req.body.wsprice
                    }
                });
                res.writeHead(302, {
                    'Location': '/product/view/' + req.param('id')
                });
                res.end();
                return false;
            });
        }
    });
});


app.get(['/remove/', '/remove/:id'], function (req, res) {
    $arr.error = '';
    common.checkLogin(req, res, 0);
    req.body.id = (typeof(req.param('id')) !== 'undefined') ? req.param('id') : 0;
    q.all(products.projectDetails(req, config.mysql, q, ['user_id'], req.body.id)).then(function (results) {

        // console.log(results[0][0]['user_id'])

        if (req.session.userid == results[0][0]['user_id']) {
            products.removeProject(req, config.mysql, q, req.body.id);
        }

        res.writeHead(302, {
            'Location': '/product/my'
        });

        res.end();
        return false;

    });
});


app.post(['/checkcoupon/'], function (req, res) {
    var admin = require('../module/admin');
//req.body.code = req.param('code');
    q.all([admin.checkcoupon(req, q, config.mysql)]).then(function (result) {
        //console.log(result[0][0]);
        if (result[0][0].length > 0) {
            res.json({success: 'true', 'type': result[0][0][0]['type'], 'amount': result[0][0][0]['amount']});
        }
        else {
            res.json({success: 'false'});
        }
    });
});
app.post('/getStates/', function (req, res) {
    console.log("Invoked");
    var geoLocation = require('../module/geoLocation');
    var countryName = (typeof req.param('countryCode') == 'undefined' ? "United states" : req.param('countryCode'));
    q.all(geoLocation.getStateOrProvince(countryName).then(function (stateData) {
        console.log(stateData);
        res.writeHead(200, {'Content-Type': 'application/json'});
        res.json({data : JSON.stringify(stateData[0][0])});
    }));
});

app.get(['/reserve/:id'], function (req, res) {
    common.checkLogin(req, res, 0);
//console.log(req.param('ship'));

    seated = require('../module/seated_auction.js');
    req.body.id = req.param('id');

    q.all([seated.checkuserSeated(req, config.mysql, q), products.productDetail(req, config.mysql, q), user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount']), seated.checkSeatedCount(req, config.mysql, q)]).then(function (results) {


        prdt = results[1][0][0];
        req.body.title = prdt.title;
        req.body.seatAmount = prdt.seatAmount;

        var dateFormat = require('dateformat');
        var date = require('date-utils');
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_added']), "yyyy-mm-dd HH:MM:ss");
        if (((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') || results[1][0][0].length == 0 || results[3][0][0].seatsBooked >= prdt.seats) {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if (prdt['market_status'] != 'open') {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if ((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount']) < prdt.seatAmount) {
            req.session.page = config.url + '/product/reserve/' + req.param('id');
            res.writeHead(302, {
                'Location': '/package'
            });
            res.end();
            return false;
        }

        //add seat booking process
        seated.bookSeat(req, config.mysql, q);
        seated.reduceSeatAmount(req, config.mysql, q);


        //customerio reserve email
        customerio = require('../module/customerio');
        customerio.uid = req.session.userid;
        customerio.inits();
        customerio.createCustomer({
            email: req.session.email,
            user: {firstName: req.session.first_name, lastName: req.session.last_name}
        });
        customerio.sendEmail({
            event: 'seatedReserve',
            content: {
                user: req.session.first_name + ' ' + req.session.last_name,
                title: req.body.title,
                amount: req.body.seatAmount
            }
        });

        res.writeHead(302, {
            'Location': '/product/view/' + req.param('id')
        });
        res.end();
        return false;

    });

});


app.get(['/stand/:id'], function (req, res) {
    common.checkLogin(req, res, 0);
//console.log(req.param('ship'));

    seated = require('../module/seated_auction.js');
    req.body.id = req.param('id');

    q.all([seated.checkuserSeated(req, config.mysql, q), products.productDetail(req, config.mysql, q), user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount']), seated.checkSeatedCount(req, config.mysql, q)]).then(function (results) {


        prdt = results[1][0][0];
        req.body.title = prdt.title;
        req.body.seatAmount = prdt.seatAmount;

        var dateFormat = require('dateformat');
        var date = require('date-utils');
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_added']), "yyyy-mm-dd HH:MM:ss");
        if (((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') || results[1][0][0].length > 0) {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }
        else if (prdt['market_status'] != 'open') {
            res.writeHead(302, {
                'Location': '/product/view/' + req.param('id')
            });
            res.end();
            return false;
        }


        //add seat booking process
        seated.standSeat(req, config.mysql, q);
        seated.refundSeatAmount(req, config.mysql, q);

        //customerio reseve email
        customerio = require('../module/customerio');
        customerio.uid = req.session.userid;
        customerio.inits();
        customerio.createCustomer({
            email: req.session.email,
            user: {firstName: req.session.first_name, lastName: req.session.last_name}
        });
        customerio.sendEmail({
            event: 'seatedVacate',
            content: {
                user: req.session.first_name + ' ' + req.session.last_name,
                title: req.body.title,
                amount: req.body.seatAmount
            }
        });

        res.writeHead(302, {
            'Location': '/product/view/' + req.param('id')
        });
        res.end();
        return false;

    });

});


module.exports = app;