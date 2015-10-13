var express = require('express');
var common = require('../module/common');
var app = express.Router();
var q = require('q');
var mysqli = require('../module/mysqli');
var dashboard = require('../module/dashboard');
var cryptos = require('../module/crypto.js');

app.post('/withdrawal', function (req, res) {
    common.checkLogin(req, res, 0);
    user = require('../module/user');
    withdraw = require('../module/withdraw');
    if (typeof(req.body.amount) === 'undefined' || typeof(req.body.paymethod) === 'undefined' || typeof(req.body.paydetails) === 'undefined') {
        res.writeHead(302, {
            'Location': '/dashboard/withdrawal/error/Invalid datas'
        });
        res.end();
        return false;
    }
    if (parseFloat(req.body.amount) <= 0) {
        res.writeHead(302, {
            'Location': '/dashboard/withdrawal/error/Amount Invalid'
        });
        res.end();
        return false;
    }
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount'])]).then(function (results) {
        $arr['users'] = results[0][0][0];
        $arr['users']['reserve_amount'] = parseFloat(results[0][0][0]['balance'] - results[0][0][0]['reserve_amount']);
        if ($arr['users']['reserve_amount'] >= req.body.amount) {
            bid = require('../module/bid');
            bid.reduceBalance(req, config.mysql, q, req.body.amount);
            withdraw.addWithdraw(req, config.mysql, q);
            res.writeHead(302, {
                'Location': '/dashboard/withdrawal/success/Withdraw Request Sent'
            });
            res.end();
            return false;
        }
        else {
            res.writeHead(302, {
                'Location': '/dashboard/withdrawal/error/Withdraw Amount must not be greater than available amount'
            });
            res.end();
            return false;
        }
    });

});
app.get(['/withdrawal', '/withdrawal/:action/:message'], function (req, res) {
    common.checkLogin(req, res, 0);
    withdraw = require('../module/withdraw');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    $arr['action'] = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
    $arr['message'] = (typeof(req.param('message')) !== 'undefined') ? req.param('message') : '';
    q.all([withdraw.mywithdraw(req, config.mysql, q, 0), withdraw.mywithdraw(req, config.mysql, q, 1)]).then(function (results) {
        $arr['withdraw'] = results[0][0];
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/withdrawal',
            current: req.body.page,
            rowsPerPage: 5,
            totalResult: results[1][0].length
        });
        $arr['pagination_html'] = paginator.render();
        common.tplFile('withdrawal.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});
app.get('/mybids', function (req, res) {
    common.checkLogin(req, res, 0);
    bids = require('../module/bid');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([bids.mybids(req, config.mysql, q), bids.totalmybids(req, config.mysql, q)]).then(function (results) {
        $arr['pagination'] = results[1][0].length;
        $arr['mybids'] = results[0][0];
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/mybids',
            current: req.body.page,
            rowsPerPage: 5,
            totalResult: $arr['pagination']
        });

        $arr['pagination_html'] = paginator.render();
        common.tplFile('mybids.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});
app.get('/watchlist/:id', function (req, res) {
    common.checkLogin(req, res, 0);
    products = require('../module/products');
    products.deleteWatchlist(req, config.mysql, q);
    req.session.watchlistdelete = true;
    res.writeHead(302, {
        'Location': '/dashboard/watchlist'
    });
    res.end();
    return false;

});
app.post(['/messages/save'], function (req, res) {
    common.checkLogin(req, res, 0);
    messages = require('../module/message');
    user = require('../module/user');
    //req.body.r_id = (typeof(req.param('r_id')) !== 'undefined') ? req.param('r_id') : 0;

    req.body.r_id = parseInt(req.body.r_id);
    if (req.body.r_id <= 0) {
        q.all([common.admincpId(req, config.mysql, q)]).then(function (result) {
            req.body.toid = result[0][0][0]['id'];
            //req.body.subject = $arr['messages'][0]['subject'];
            var dat = require('date-util');
            req.body.r_id = Date.parse(new Date()) / 1000;
            q.all([user.userInfo(req, config.mysql, q, req.body.toid, ['email', 'first_name', 'last_name'])]).then(function (results) {
                req.body.toemail = results[0][0][0]['email'];
                req.body.first_name = results[0][0][0]['first_name'];
                req.body.last_name = results[0][0][0]['last_name'];
                messages.addmessages(req, config.mysql, q);
                res.writeHead(302, {
                    'Location': '/dashboard/messages/sent/'
                });
                res.end();
                return false;
            });
        });
    }
    else {
        q.all([messages.showmessages(req, config.mysql, q), common.admincpId(req, config.mysql, q)]).then(function (results) {
            $arr['messages'] = results[0][0];
            if ($arr['messages'].length == 0) {
                res.writeHead(302, {
                    'Location': '/dashboard/messages'
                });
                res.end();
                return false;

            }
            if ($arr['messages'][0]['from_id'] != req.session.userid && $arr['messages'][0]['to_id'] != req.session.userid) {
                res.writeHead(302, {
                    'Location': '/dashboard/messages'
                });
                res.end();
                return false;
            }
            req.body.toid = results[1][0][0]['id'];
            req.body.subject = $arr['messages'][0]['subject'];
            q.all([user.userInfo(req, config.mysql, q, req.body.toid, ['email', 'first_name', 'last_name'])]).then(function (results) {
                req.body.toemail = results[0][0][0]['email'];
                req.body.first_name = results[0][0][0]['first_name'];
                req.body.last_name = results[0][0][0]['last_name'];
                messages.addmessages(req, config.mysql, q);
                res.writeHead(302, {
                    'Location': '/dashboard/messages/view/' + req.body.r_id
                });
                res.end();
                return false;
            });

        });
    }

});
app.get(['/messages/:action/:r_id'], function (req, res) {
    common.checkLogin(req, res, 0);
//common.checkLogin(req,res,0);
    messages = require('../module/message');
    req.body.r_id = (typeof(req.param('r_id')) !== 'undefined') ? req.param('r_id') : 0;
    $arr['r_id'] = req.body.r_id;
    req.body.r_id = parseInt(req.body.r_id);
    if (req.body.r_id <= 0) {
        res.writeHead(302, {
            'Location': '/dashboard/messages'
        });
        res.end();
        return false;
    }
    req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
    $arr['action'] = req.body.action;
    if (req.body.action != 'view') {
        messages.movemessages(req, config.mysql, q);
        res.writeHead(302, {
            'Location': '/dashboard/messages/view/' + req.body.r_id
        });
        res.end();
        return false;
    }
    q.all([messages.showmessages(req, config.mysql, q)]).then(function (results) {

        $arr['messages'] = results[0][0];
        if ($arr['messages'].length == 0) {
            res.writeHead(302, {
                'Location': '/dashboard/messages'
            });
            res.end();
            return false;

        }
        if ($arr['messages'][0]['from_id'] != req.session.userid && $arr['messages'][0]['to_id'] != req.session.userid) {
            res.writeHead(302, {
                'Location': '/dashboard/messages'
            });
            res.end();
            return false;
        }
        if ($arr['messages'].length > 0) {
            req.body.r_id = $arr['messages'][0]['r_id'];
            messages.readmessages(req, config.mysql, q);
        }
        common.tplFile('message-view.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });
});
app.get(['/messages', '/messages/:action'], function (req, res) {
    common.checkLogin(req, res, 0);
    //common.checkLogin(req,res,0);
    messages = require('../module/message');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 1;
    req.body.action = (typeof(req.param('action')) !== 'undefined') ? req.param('action') : '';
    $arr['action'] = req.body.action;
    if (req.body.action == 'compose') {
        common.tplFile('compose.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    }
    else {
        q.all([messages.mymessages(req, config.mysql, q, 0), messages.mymessages(req, config.mysql, q, 1)]).then(function (results) {
            $arr['pagination'] = results[1][0].length;
            $arr['messages'] = results[0][0];
            var pagination = require('pagination');
            var paginator = new pagination.SearchPaginator({
                prelink: '/dashboard/messages/' + req.body.action,
                current: req.body.page,
                rowsPerPage: 5,
                totalResult: $arr['pagination']
            });
            $arr['pagination_html'] = paginator.render();
            common.tplFile('messages.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        });
    }
});
app.get('/watchlist', function (req, res) {
    common.checkLogin(req, res, 0);
    products = require('../module/products');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    if (typeof(req.session.watchlistdelete) !== 'undefined') {
        delete req.session.watchlistdelete;
        $arr['save'] = true;
    }
    q.all([products.mywatchlist(req, config.mysql, q), products.totalmywatchlist(req, config.mysql, q)]).then(function (results) {
        $arr['pagination'] = results[1][0].length;
        $arr['mywatchlist'] = results[0][0];
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/watchlist',
            current: req.body.page,
            rowsPerPage: 5,
            totalResult: $arr['pagination']
        });

        $arr['pagination_html'] = paginator.render();
        common.tplFile('mywatchlist.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});
app.get('/buynow', function (req, res) {
    common.checkLogin(req, res, 0);
    dashboard = require('../module/dashboard');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([dashboard.mybuynow(req, config.mysql, q, 0), dashboard.mybuynow(req, config.mysql, q, 1)]).then(function (results) {
        $arr['pagination'] = results[1][0].length;
        $arr['mybuynow'] = results[0][0];
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/buynow',
            current: req.body.page,
            rowsPerPage: 10,
            totalResult: $arr['pagination']
        });

        $arr['pagination_html'] = paginator.render();
        common.tplFile('mybuynow.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});
app.get('/wonauctions', function (req, res) {
    common.checkLogin(req, res, 0);
    bids = require('../module/bid');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([bids.mywonauctions(req, config.mysql, q), bids.totalmywonauctions(req, config.mysql, q)]).then(function (results) {
        $arr['pagination'] = results[1][0].length;
        $arr['mybids'] = results[0][0];
        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/wonauctions',
            current: req.body.page,
            rowsPerPage: 10,
            totalResult: $arr['pagination']
        });

        $arr['pagination_html'] = paginator.render();
        common.tplFile('wonauctions.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});
app.get('/review', function (req, res) {
    //common.checkLogin(req,res,0);
    //bids = require('../module/bid');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    $arr['externalcss'] = ['bootstrap', 'font-awesome', 'star-rating',];
    $arr['externaljs'] = ['bootstrap', 'star-rating'];
    $arr['reviewaction'] = false;

    common.tplFile('review.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);


});
app.post('/review', function (req, res) {
    common.checkLogin(req, res, 0);
    review = require('../module/review');
    q.all([review.reviewAdd(req, config.mysql, q)]).then(function (results) {
        $arr['reviewaction'] = true;
        res.writeHead(302, {
            'Location': '/reviews'
        });
        res.end();
        return false;
    });
    /*common.tplFile('review.tpl');
     common.headerSet(1);
     common.loadTemplateHeader(req,res,$arr);*/


});
app.get('/transactions', function (req, res) {
    common.checkLogin(req, res, 0);
    invoices = require('../module/invoices');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([invoices.mytransactions(req, config.mysql, q), invoices.totalmytransactions(req, config.mysql, q)]).then(function (results) {

        var async = require('async');

        async.mapSeries(results[0][0], function (num, doneCallback) {
                //req.params.buynowuserid =  num.user_id;
                q.all(invoices.buynowProjectSpecific(req, config.mysql, q, num.primary_id)).then(function (buynowresult) {
                    if (buynowresult[0].length > 0) {
                        num.buynowpandi = buynowresult[0][0];
                    }
                    else {
                        num.buynowpandi = {};
                    }
                    return doneCallback(null, num);
                });
            },
            function (err, result) {
                if (err) return console.error(err);

                $arr['transaction'] = result;
                $arr['pagination'] = results[1][0].length;
                var pagination = require('pagination');
                var paginator = new pagination.SearchPaginator({
                    prelink: '/dashboard/transactions',
                    current: req.body.page,
                    rowsPerPage: 10,
                    totalResult: $arr['pagination']
                });
                $arr['pagination_html'] = paginator.render();
                common.tplFile('transactions.tpl');
                common.headerSet(1);
                common.loadTemplateHeader(req, res, $arr);
            });
    });
});
app.get('/invoices/:id', function (req, res) {
    common.checkLogin(req, res, 0);
    invoices = require('../module/invoices');
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    q.all([invoices.viewTransactions(req, config.mysql, q)]).then(function (results) {
        $arr['transaction'] = results[0];
        common.tplFile('invoices.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});


app.get('/password', function (req, res) {
    common.checkLogin(req, res, 0);
    common.tplFile('passwordchange.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);

});

app.post('/changepassword', function (req, res) {
    $arr['save'] = true;
    // common.checkLogin(req,res,0);
    mysql = config.mysql;
    var md5 = require('MD5');
    var password_salt = '12345';
    var password = md5(md5(req.body.new_password) + password_salt);
    strQuery = mysqli.mysqli($mysqli, 57);


    if (typeof(req.body.isajax) != 'undefined' && req.body.isajax == 1) {

        $mysqli = {username: req.session.username};
        strQuery = mysqli.mysqli($mysqli, 0);

        query = mysql.query(strQuery, function (error, results, fields) {
            if (results.length > 0) {
                result = results[0];
                result.password = md5(md5(req.param('password')) + result['password_salt']);
                if (result.password == result.password_hash) {
                    res.json(1);
                    return false;
                }
                else {
                    res.json(0);
                    return false;
                }
            }
        });

    }
    else {

        $mysqli = {};
        var defered = q.defer();
        escape_data = [password, password_salt, req.session.userid];
        query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
        res.writeHead(302, {
            'Location': '/dashboard/password'
        });
        res.end();
        return false;
    }

});


app.get('/Myaddress', function (req, res) {

    common.checkLogin(req, res, 0);
    q.all([dashboard.getAddresses(req, config.mysql, q, 'shipping'), dashboard.getAddresses(req, config.mysql, q, 'billing')]).then(function (results) {
        $arr['shipping'] = results[0][0][0];
        $arr['billing'] = results[1][0][0];
        common.tplFile('Addresses.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });


});


app.post('/Myaddress', function (req, res) {
    common.checkLogin(req, res, 0);
    q.all([dashboard.getAddresses(req, config.mysql, q, req.body.type)]).then(function (results) {
        var doauction = "";
        if (results[0][0].length > 0)
            doauction = 'update';
        else
            doauction = 'save';
        q.all(dashboard.saveaddress(req, config.mysql, q, doauction)).then(function (results) {
            res.writeHead(302, {
                'Location': '/dashboard/Myaddress'
            });
            res.end();
            return false;
        });
    });
});

String.prototype.capitalizeFirstLetter = function () {
    return this.charAt(0).toUpperCase() + this.slice(1);
};

app.get('/Address/:type', function (req, res) {

    common.checkLogin(req, res, 0);
    $arr['shipping'] = '';
    req.body.type = (typeof(req.param('type')) !== 'undefined') ? req.param('type').capitalizeFirstLetter() : 'shipping';
    q.all([dashboard.getAddresses(req, config.mysql, q, req.body.type)]).then(function (results) {
        if (results[0][0].length > 0)
            $arr['shipping'] = results[0][0][0];

        $arr['type'] = req.body.type;
        common.tplFile('Myaddress.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });


});


app.get('/referral', function (req, res) {

    common.checkLogin(req, res, 0);
    req.body.page = (typeof(req.param('page')) !== 'undefined') ? req.param('page') : 0;
    $arr['referral'] = $arr['referrallink'] = '';
    q.all([dashboard.getReferral(req, config.mysql, q, 0, 0), dashboard.getReferral(req, config.mysql, q, 0, 1)]).then(function (results) {
        $arr['referrallink'] = cryptos.encrypt(req.session.userid.toString());
        $arr['referral'] = results[0][0];

        var pagination = require('pagination');
        var paginator = new pagination.SearchPaginator({
            prelink: '/dashboard/referral',
            current: req.body.page,
            rowsPerPage: 5,
            totalResult: results[1][0].length
        });
        $arr['pagination_html'] = paginator.render();
        common.tplFile('referral.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });
});

app.get(['/autobid', '/autobid/:id'], function (req, res) {
    common.checkLogin(req, res, 0);
    $arr['referral'] = $arr['referrallink'] = $arr['Autobids'] = $arr['project'] = $arr['AutobidsClosed'] = $arr['aData'] = '';

    if (typeof(req.param('id')) != 'undefined' && req.param('id') > 0) {
        q.all(dashboard.getautobidDetails(req, config.mysql, q)).then(function (results) {
            $arr['aData'] = results[0][0];
            common.tplFile('autobid.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        });
    }
    else {
        q.all([dashboard.getOpenProjects(req, config.mysql, q), dashboard.fetchAutobidlist(req, config.mysql, q, 1), dashboard.fetchAutobidlist(req, config.mysql, q, 0)]).then(function (results) {
            $arr['project'] = results[0][0];
            $arr['Autobids'] = results[1][0];
            $arr['AutobidsClosed'] = results[2][0];
            common.tplFile('autobid.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        });
    }
});

app.post('/autobid', function (req, res) {
    common.checkLogin(req, res, 0);
    if (typeof(req.body.aid) != 'undefined' && req.body.aid > 0) {
        dashboard.updateAutobid(req, config.mysql, q);
        res.writeHead(302, {
            'Location': '/dashboard/autobid'
        });
        res.end();
        return false;
    }
    else {
        q.all(dashboard.checkAutobid(req, config.mysql, q)).then(function (results) {
            if (results[0].length == 0) {
                dashboard.saveAutobid(req, config.mysql, q);
            }
            res.writeHead(302, {
                'Location': '/dashboard/autobid'
            });
            res.end();
            return false;
        });
    }
});

app.get(['/seated'], function (req, res) {
    common.checkLogin(req, res, 0);
    $arr['seatedAuction'] = '';
    var seated = require('../module/seated_auction.js');
    q.all(seated.scheduledSeats(req, config.mysql, q)).then(function (results) {
        $arr['seatedAuction'] = results[0];
        common.tplFile('seated.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });
});


app.get('/', function (req, res) {
    common.checkLogin(req, res, 0);
    var user = require('../module/user');
    q.all([user.userInfo(req, config.mysql, q, req.session.userid, ['balance', 'reserve_amount'])]).then(function (results) {
        $arr['users'] = results[0][0][0];
        $arr['login_fail'] = 0;
        $arr['users']['reserve_amount'] = parseFloat(results[0][0][0]['balance'] - results[0][0][0]['reserve_amount']).toFixed(2);
        common.tplFile('dashboard.tpl');
        common.headerSet(1);
        common.loadTemplateHeader(req, res, $arr);
    });

});

app.get('/RemoveAddress/:type', function (req, res) {

    common.checkLogin(req, res, 0);
    $arr['shipping'] = '';
    req.body.type = (typeof(req.param('type')) !== 'undefined') ? req.param('type') : 'shipping';
    q.all([dashboard.removeAddresses(req, config.mysql, q, req.body.type)]).then(function (results) {

        res.writeHead(302, {
            'Location': '/dashboard/Myaddress'
        });
        res.end();
        return false;
    });


});


app.get('/autobidremove/:id', function (req, res) {
    common.checkLogin(req, res, 0);

    dashboard.removeautobid(req, config.mysql, q);
    res.writeHead(302, {
        'Location': '/dashboard/autobid'
    });
    res.end();
    return false;

});


module.exports = app;