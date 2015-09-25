var express = require('express');
var common = require('../module/common');
var products = require('../module/products');
var app = express.Router();
//required js

var q = require('q');
var socetio = emittosocket;
var emits = '';
var req = '';
var cron = require('cron');
var cronJob = cron.job("*/6 * * * * *", function () {
    //io.sockets.emit('pandi', 'pandian');

    /*exports.deal = function(emitto)
     {*/
//emits = emitto;
    var bids = require('../module/autobid');
    var autobids = function (autobidData, emitto) {
        console.log(autobidData['pID']);
        q.all(bids.getAutobidUser('', config.mysql, q, autobidData['pID'])).then(function (results) {
            //console.log(results[0]);
            if (results[0].length > 0) {
                var aBid = [];
                aBid['userid'] = results[0][0]['user_id'];
                aBid['id'] = autobidData['pID'];
                aBid['wprice'] = parseFloat((parseFloat(autobidData['wprice']) + 0.01).toFixed(2));
                autobida.autobidaaaaaa(aBid, emits);
                // bids.updateAutobidUser('',config.mysql,q,autobidData['pID'],results[0][0]['user_id']);
                cb(null);
            }
            else
                cb(null);
        });
    };
    q.all(bids.autobidProjects('', config.mysql, q)).then(function (results) {
        if (results[0].length > 0) {
            var async = require('async');
            async.each(results[0], autobids, function (err) {
                if (err) return console.error(err);
                return 0;
            });
        }
    });

    //return 0;
    //autobida.autobidaaaaaa(aBid,emitto);
    //setInterval(function(){
//	
//	console.log(4444444);
//	autobida.autobidaaaaaa(aBid,emitto);
//	}, 3000);
//	 
    /*}*/

});
cronJob.start();


var autobida = require('../routes/autobid');
exports.autobidaaaaaa = function (aBid, emitsto) {
    console.log("autobidaaaaaa");

//console.log(aBid);return 0;
    var bids = require('../module/autobid');
    var uID = aBid['userid'];
    var pID = aBid['id'];
    var wP = aBid['wprice'];
    bids.updateAutobidUser('', config.mysql, q, aBid);

//common.checkLogin(req,res,0);
    config.perbid = global.general.bidincrement;

    user = require('../module/user');
    q.all([bids.maxcheckbidPlaced(req, config.mysql, q, pID), bids.productDetail(req, config.mysql, q, pID), user.userInfo(req, config.mysql, q, uID, ['balance', 'reserve_amount', 'first_name', 'last_name', 'email'])]).then(function (results) {
        console.log(999999999999999);
        maxisthere = results[0][0].length;
        maxuid = 0;
        maxamt = 0;
        maxbid = [];
        if (maxisthere > 0) {
            maxbid = results[0][0][0];
            maxuid = maxbid.user_id;
            maxamt = maxbid.amt;
            //aBid['wprice']  = maxamt+0.1;
        }

        prdt = results[1][0][0];
        title = prdt.title;
        if (maxuid == uID) {
            q.all(bids.getAutobidUser('', config.mysql, q, pID)).then(function (results) {
                if (results[0].length == 0)
                    bids.updateAllAutobidUser('', config.mysql, q, aBid);
            });
            return 1;
            //results[2][0][0]['reserve_amount'] = results[2][0][0]['reserve_amount'] - maxamt;
        }

        //  console.log(10410121);
        var dateFormat = require('dateformat');
        var date = require('date-utils');
        results[1][0][0]['wsprice'] = results[1][0][0]['wprice'] + config.perbid;
        datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
        closeddate = dateFormat(new Date(prdt['date_closed']), "yyyy-mm-dd HH:MM:ss");
        maxamnt = (maxuid > 0 && maxuid == uID) ? maxamt : 0;
        placeamt = config.perbid;

        if ((Date.compare(closeddate, datenow) <= 0 ) && prdt['market_status'] == 'open') {
            console.log('pandiiiiiiiiiiiiiiii');
            q.all(bids.getAutobidUser('', config.mysql, q, pID)).then(function (results) {
                if (results[0].length == 0)
                    bids.updateAllAutobidUser('', config.mysql, q, aBid);
            });
            return 1;
            //   res.writeHead(302, {
//           'Location': '/product/close/'+req.param('id')
//       });
            // res.end();return false;
        }
        else if (prdt['market_status'] != 'open') {
            console.log('pandiiiiiiiiiiiiiiii1111111111');
            q.all(bids.getAutobidUser('', config.mysql, q, pID)).then(function (results) {
                if (results[0].length == 0)
                    bids.updateAllAutobidUser('', config.mysql, q, aBid);
            });
            return 1;
            /*res.writeHead(302, {
             'Location': '/product/view/'+req.param('id')
             });
             res.end();return false;*/
        }

        else if ((results[2][0][0]['balance'] - results[2][0][0]['reserve_amount'] - config.perbid) < (parseFloat(results[1][0][0]['wsprice'], 2) + parseFloat(results[1][0][0]['shipping_price'], 2))) {
            console.log('pandiiiiiiiiiiiiiii222222222');
            q.all(bids.getAutobidUser('', config.mysql, q, pID)).then(function (results) {
                if (results[0].length == 0)
                    bids.updateAllAutobidUser('', config.mysql, q, aBid);
            });
            return 1;
            /* req.session.page = config.url+'/product/confirm/'+req.param('id')+'/'+req.param('wsprice');
             res.writeHead(302, {
             'Location': '/package'
             });
             res.end();return false;*/
        }
        else if (results[1][0][0]['wprice'] < wP) {
            update = 0;
            //bids.updateAutobidUser('',config.mysql,q,aBid);
            q.all(bids.placeBid('', config.mysql, q, 1, aBid)).then(function (resbid) {
                // bids.updateBid('',config.mysql,q,aBid);
                placebid = resbid[0].insertId;
                if (maxuid > 0) {
                    bid = maxbid.id;
                    buid = maxbid.user_id;
                    amt = parseFloat(maxbid.amt, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                    console.log(amt);
                    bids.reduceReserve('', config.mysql, q, amt, buid);
                    bids.removeBidReserve('', config.mysql, q, bid);
                }
                //req.session.placedbid = true;
                // req.session.placedbidamount = wP;
                // console.log(2);
                customerio = require('../module/customerio');
                customerio.uid = uID;
                customerio.inits();

                customerio.createCustomer({
                    email: results[2][0][0]['email'],
                    user: {firstName: results[2][0][0]['first_name'], lastName: results[2][0][0]['last_name']}
                });
                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: results[2][0][0]['first_name'] + ' ' + results[2][0][0]['last_name'],
                        title: prdt.title,
                        amount: wP
                    }
                });

                aBid['wssprice'] = '';
                aBid['wssprice'] = parseFloat(wP, 2) + parseFloat(results[1][0][0]['shipping_price'], 2);
                console.log(aBid['wssprice']);
                bids.addReserve(req, config.mysql, q, aBid);
                // bids.updateBid(req,config.mysql,q);
                bids.updateBid('', config.mysql, q, aBid);
                bids.reducePoint('', config.mysql, q, aBid);
                bids.updateAutobidamount('', config.mysql, q, aBid);

                q.all(bids.getAutobidUser('', config.mysql, q, pID)).then(function (results) {

                    if (results[0].length == 0)
                        bids.updateAllAutobidUser('', config.mysql, q, aBid);
                });
                // console.log(2);
                // emitto.emit('emitdata','dddd');
                /*  res.writeHead(302, {
                 'Location': '/product/view/'+req.param('id')
                 });
                 res.end();return false; */

                var emitdata = {
                    'pID': pID,
                    'uID': uID,
                    'wprice': wP,
                    'winner': results[2][0][0]['first_name'] + ' ' + results[2][0][0]['last_name'],
                    'date': prdt['date_closed']
                };

                socetio.emit('autoBid', emitdata);
                return 1;
            });

        }
        else {
            q.all(bids.placeBid('', config.mysql, q, 1, aBid)).then(function (resbid) {
                placebid = resbid[0].insertId;
                bids.reducePoint('', config.mysql, q, aBid);
                customerio = require('../module/customerio');
                customerio.uid = uID;
                customerio.inits();
                req.session.placedbid = true;
                req.session.placedbidamount = wP;
                customerio.createCustomer({
                    email: results[2][0][0]['email'],
                    user: {firstName: results[2][0][0]['first_name'], lastName: results[2][0][0]['last_name']}
                });
                customerio.sendEmail({
                    event: 'bid_submitted',
                    content: {
                        user: results[2][0][0]['first_name'] + ' ' + results[2][0][0]['last_name'],
                        title: prdt.title,
                        amount: wP
                    }
                });
                /*
                 res.writeHead(302, {
                 'Location': '/product/view/'+req.param('id')
                 });*/
                return 1;
            });
        }
    });
};


//module.exports = app;