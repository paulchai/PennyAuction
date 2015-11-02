var util = require('util');
var dateFormat = require('dateformat');
var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
var url = require('url');

exports.getDailyBidAmount = function (req, mysql, q) {
    $mysqli = {
        date:req.body.date
    };
    strQuery = mysqli.mysqli($mysqli, 'getdailybidamount');
    var defered = q.defer();
    query = mysql.query(strQuery, defered.makeNodeResolver());
    return defered.promise;
};

exports.upsertJackpotDaily = function (req, bidamount, bidshare, mysql, q) {
    console.log(req.body);
    $mysqli = {
        date: req.body.date,
        amount_bid: bidamount,
        bid_share: bidshare,
        amount_mlm: req.body.amount
    };

    strQuery = mysqli.mysqli($mysqli, 'upsertjackpotdaily');

    var defered = q.defer();
    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};

exports.upsertJackpotMonthly = function (req, bid_total, share_total, mlm_total, total, mysql, q) {
    $mysqli = {
        date: req.body.date,
        amount_bid: bid_total,
        bid_share: share_total,
        amount_mlm: mlm_total,
        amount_total: total
    };

    strQuery = mysqli.mysqli($mysqli, 'upsertjackpotMonthly');

    var defered = q.defer();
    query = mysql.query(strQuery, defered.makeNodeResolver());

    return defered.promise;
};

exports.getJackpotSum = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'getjackpotsum');
    var escape_data = [];
    var deferred = q.defer();
    query = mysql.query(strQuery, escape_data, deferred.makeNodeResolver());
    return deferred.promise;
};


