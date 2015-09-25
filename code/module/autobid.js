var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
exports.mybids = function (req, mysql, q) {
    $mysqli = {};
    var page = req.body.page;
    page = (page > 0) ? (page - 1) * 10 : 0;

    strQuery = mysqli.mysqli($mysqli, 37);
    var defered = q.defer();

    var escape_data = [req.session.userid, page];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.makeBought = function (req, mysql, q, bprice) {
    $mysqli = {};
    var id = req.param('id');


    strQuery = mysqli.mysqli($mysqli, 83);
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var escape_data = [id, req.session.userid, bprice, datge];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.reduceBalance = function (req, mysql, q, bprice) {
    $mysqli = {};
    var id = req.param('id');


    strQuery = mysqli.mysqli($mysqli, 84);
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var escape_data = [bprice, req.session.userid];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.totalmybids = function (req, mysql, q) {
    $mysqli = {};
    page = req.body.page;
    strQuery = mysqli.mysqli($mysqli, 38);

    var defered = q.defer();

    var escape_data = [req.session.userid];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.mywonauctions = function (req, mysql, q) {
    $mysqli = {};
    var page = req.body.page;
    page = (page > 0) ? (page - 1) * 10 : 0;
    strQuery = mysqli.mysqli($mysqli, 39);

    var defered = q.defer();

    var escape_data = [req.session.userid, page];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.totalmywonauctions = function (req, mysql, q) {
    $mysqli = {};
    page = req.body.page;
    strQuery = mysqli.mysqli($mysqli, 40);

    var defered = q.defer();

    var escape_data = [req.session.userid];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
/**
 * Places a bid in bid table
 * @param req
 * @param mysql
 * @param q
 * @param reserve
 * @param aBid
 * @returns {*}
 */
exports.placeBid = function (req, mysql, q, reserve, aBid) {
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    $mysqli = {};
    var defered = q.defer();
    var escape_data = [];
    if (reserve) {
        strQuery = mysqli.mysqli($mysqli, 45);
        console.log(aBid);
        escape_data = [aBid['id'],
            (typeof(aBid['userid']) !== 'undefined' ) ? aBid['userid'] : '0',
            datge,
            aBid['wprice'],
            datge]
    }
    else {
        strQuery = mysqli.mysqli($mysqli, 20);
        escape_data = [aBid['id'],
            (typeof(aBid['wprice']) !== 'undefined' ) ? aBid['wprice'] : '0',
            datge,
            aBid['wprice']
        ]
    }
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.updateBid = function (req, mysql, q, aBid) {

    var totalSec = global.general.bidincreaseseconds;
    var hours = parseInt(totalSec / 3600) % 24;
    var minutes = parseInt(totalSec / 60) % 60;
    var seconds = totalSec % 60;

    var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 21);

    var defered = q.defer();
    console.log(aBid);
    var escape_data = [aBid['wprice'], result, aBid['id']]
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};

exports.reduceReserve = function (req, mysql, q, Bamt, Bbuid) {
    delete payments;
    /*payments = require('./payment');
     payments.type = 'declined';

     payments.amount = req.body.amt;
     payments.sessionsdata = {};
     payments.sessionsdata = req.session;
     payments.transactionid = 0;
     payments.gateway = 'account';
     payments.sessionsdata = {};
     payments.sessionsdata.userid = req.body.buid;
     payments.payid = req.body.id;
     payments.name = 'Decline holded amount for '+req.body.title;

     payments.insertInvoice();*/

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 47);

    var defered = q.defer();

    var escape_data = [Bamt, Bbuid];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.insertInvoice = function (aBid, bidid) {
    $mysqli = {};
    mysql = config.mysql;
    strQuery = mysqli.mysqli($mysqli, 31);
    // status = 'debit';
    var escape_data = [0, 'account', dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), aBid['userid'], bidid, 'bid', aBid['title'], 0.01, 'paid', 'debit'];
    console.log(escape_data);

    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};

exports.removeBidReserve = function (req, mysql, q, bID) {


    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 68);

    var defered = q.defer();

    var escape_data = [bID];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.releaseAmount = function (req, mysql, q, bid, pid) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 48);

    var defered = q.defer();

    var escape_data = [bid.proposed_amount, bid.proposed_amount, bid.user_id]
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.addAmount = function (req, mysql, q, bid, pid) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 28);

    var defered = q.defer();

    var escape_data = [bid.proposed_amount, pid.id];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.addReserve = function (req, mysql, q, aBid) {

    delete payments;
    /*payments = require('./payment');
     payments.type = 'holded';
     payments.amount = req.body.wssprice;
     payments.sessionsdata = req.session;
     payments.payid = req.body.id;
     payments.name = 'Holded amount for '+req.body.title;
     //console.log(payments);
     payments.insertInvoice(); */
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 44);

    var defered = q.defer();

    var escape_data = [aBid['wssprice'], aBid['userid']]
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
exports.selectAwardBid = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 32);

    var defered = q.defer();

    var escape_data = [req.param('id')];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.makeAwardBid = function (req, mysql, q, id) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 35);

    var defered = q.defer();
    var dateFormat = require('dateformat');
    //var date = require('date-utils');
    datenow = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var escape_data = [datenow, id];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.addBidInvoice = function (req, mysql, q) {
    var payments = require('./payment');
    payments.transactionid = 0;
    payments.gateway = 'account';
    payments.sessionsdata = [];
    payments.sessionsdata.title = req.body.title;
    payments.sessionsdata.email = req.session.email;
    payments.sessionsdata.userid = req.session.userid;
    payments.sessionsdata.first_name = req.session.first_name;
    payments.sessionsdata.last_name = req.session.last_name;
    payments.payid = req.body.placebid;
    payments.type = 'bid';
    payments.name = req.body.title;
    payments.amount = req.body.placeamt;
    payments.insertInvoice();
};

exports.reducePoint = function (req, mysql, q, aBid) {
    // this.addBidInvoice(req,mysql,q);
    $mysqli = {};
    var escape_data = [global.general.eachbidpay, aBid['userid']];
    console.log(escape_data);
    strQuery = mysqli.mysqli($mysqli, 30);
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    console.log(2);
    return defered.promise;

};
exports.bidHistory = function (req, mysql, q, id) {

    $mysqli = {};
    sql = 24;
    if (id == 1) {
        sql = 33;
    }
    var escape_data = [req.param('id')];

    strQuery = mysqli.mysqli($mysqli, sql);

    var defered = q.defer();


    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};
exports.checkbidPlaced = function (req, mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 22);

    var defered = q.defer();

    var escape_data = [req.body.id, req.session.userid];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};
exports.maxcheckbidPlaced = function (req, mysql, q, pID) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 46);

    var defered = q.defer();

    var escape_data = [pID];
    //console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;

};

exports.productDetail = function (req, mysql, q, pID) {

    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 19);
    escape_fields = [pID];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};


exports.autobidProjects = function (req, mysql, q, pID) {

    $mysqli = {};
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 110);
    escape_fields = [global.general.autobid_seconds, datge];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver()).on('result', function (row) {
        // Pausing the connnection is useful if your processing involves I/O
        console.log(row);
    });

    return defered.promise;
};
/**
 *  Get auto bid user ID
 * @param req
 * @param mysql
 * @param q
 * @param pID
 * @returns {*}
 */
exports.getAutobidUser = function (req, mysql, q, pID) {

//console.log(pID);
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 122);
    escape_fields = [pID];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};
/**
 * Update projects_autobid that we started updating
 * @param req
 * @param mysql
 * @param q
 * @param aBID
 * @returns {*}
 */
exports.updateAutobidUser = function (req, mysql, q, aBID) {

//console.log(uID);
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 123);
    escape_fields = [aBID['id'], aBID['userid']];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};

exports.updateAutobidamount = function (req, mysql, q, aBID) {


    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 131);
    escape_fields = [aBID['wprice'], dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss"), aBID['id'], aBID['userid']];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};

/**
 *
 * @param req
 * @param mysql
 * @param q
 * @param aBid
 * @returns {*}
 */
exports.updateAllAutobidUser = function (req, mysql, q, aBid) {

//console.log(uID);
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 124);
    escape_fields = [aBid['id']];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};


exports.getProductDetail = function (req, mysql, q, pID) {
    /*

     console.log('pandiiiiiiiiiiiii');
     console.log(pID);*/
    $mysqli = {};
    var defered = q.defer();

    strQuery = mysqli.mysqli($mysqli, 132);
    escape_fields = [pID];
    //console.log(escape_fields);
    query = mysql.query(strQuery, escape_fields, defered.makeNodeResolver());

    return defered.promise;
};

