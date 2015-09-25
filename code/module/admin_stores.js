var common = require('./common');
var dateFormat = require('dateformat');
var mysqli = require('./mysqli');
var q = require('q');
var mysql = config.mysql;
exports.addStore = function (req) {
    $mysqli = {};
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 'store1');
    var defered = q.defer();
    var avatar = '';
    var imagefile = '';
    if (typeof(req.files.stores) !== 'undefined') {
        avatar = req.files.stores.name;
        imagefile = req.files.stores.originalname;
    }
    var escape_data = [req.body.name, req.body.description, avatar, imagefile, datge, (typeof(req.session) !== 'undefined') ? req.session.userid : 0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;

    });
    return defered.promise;
};
exports.addCategories = function (req) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'store4');
    var defered = q.defer();
    var escape_data = [req.body.cid, req.body.storeid];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};
/**
 * show list of stores and check count for pagination
 * @param req Request to send
 * @param iscount Need to count or not
 * @returns {*}
 */
exports.showStores = function (req, iscount) {
    var page = (typeof(req.body.page) !== 'undefined') ? req.body.page : 0;
    //search stores in admin section
    var scmd = (typeof(req.body.scmd) !== 'undefined') ? req.body.scmd : '';
    var storeidCustom = (typeof(req.body.id) !== 'undefined') ? req.body.id : 0;
    var sid = (typeof(req.body.storeid) !== 'undefined') ? req.body.storeid : storeidCustom;
    //var sid = storeid;
    $where = '';
    if (scmd == 'search') {
        var sname = (typeof(req.body.sname) !== 'undefined') ? req.body.sname : '';
        var scid = (typeof(req.body.scid) !== 'undefined') ? req.body.scid : 0;
        if (sname != '')
            $where += " and s.name like '%" + sname + "%'";
        if (scid > 0)
            $where += " and s.id in (select sc.storeid from stores_categories sc where sc.cid = " + scid + ")";
    }
    if (sid > 0 || sid == -1) {
        $where += " and s.id = " + sid;
        page = 0;
    }
    page = (page > 0) ? (page - 1) * 5 : 0;
    if (iscount == 1)
        $mysqli = {limit: '', field: 's.id', where: $where};
    else
        $mysqli = {
            limit: 'limit ' + page + ',5',
            field: 's.*,(select group_concat(sc.cid) from stores_categories sc where sc.storeid = s.id) as cids',
            where: $where
        };
    strQuery = mysqli.mysqli($mysqli, 'store5');
    var defered = q.defer();
    var escape_data = [];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};

/**
 * Close the store based on storeid
 * @param req  pass storeid
 * @returns {*}
 */
exports.deleteStore = function (req) {
    $mysqli = {};
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    strQuery = mysqli.mysqli($mysqli, 'store6');
    var defered = q.defer();
    var escape_data = [datge, req.body.id, (typeof(req.session) !== 'undefined') ? req.session.userid : 0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};
exports.updateStore = function (req) {

    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'store2');
    var defered = q.defer();
    datge = dateFormat(new Date(), "yyyy-mm-dd HH:MM:ss");
    var avatar = (typeof(req.param('avatar')) !== 'undefined') ? req.param('avatar') : '';
    var imagefile = (typeof(req.param('image')) !== 'undefined') ? req.param('image') : '';
    if (typeof(req.files.stores) !== 'undefined') {
        avatar = req.files.stores.name;
        imagefile = req.files.stores.originalname;
    }
    var escape_data = [req.body.name, req.body.description, avatar, imagefile, datge, (typeof(req.param('storeid')) !== 'undefined') ? req.param('storeid') : 0, (typeof(req.session) !== 'undefined') ? req.session.userid : 0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};

exports.deleteCategories = function (req) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'store8');
    var defered = q.defer();
    var escape_data = [(typeof(req.param('storeid')) !== 'undefined') ? req.param('storeid') : 0, (typeof(req.session) !== 'undefined') ? req.session.userid : 0];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};



