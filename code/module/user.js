var util = require('util');

var q = require('q');
var mysqli = require('./mysqli');
var common = require('./common');
var url = require('url');
/**
 * Get all information about the user
 * @param req
 * @param mysql MySQL connection
 * @param q
 * @param id User's unique id
 * @param field Restrict fields or leave blank for all fields
 * @returns {*}
 */
exports.userInfo = function (req, mysql, q, id, field) {
    if (id == 0) {
        id = (typeof(req.session) !== 'undefined' ) ? req.session.userid : 0;
    }
    if (field == '') {
        field = '*';
    }
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 25);
    var escape_data = [field, id];
    var defered = q.defer();
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

exports.userBidCount = function (req, mysql, q, id) {
    $mysqli = {};
    page = req.body.page;
    strQuery = mysqli.mysqli($mysqli, 'buyerbidcount');

    var defered = q.defer();

    var escape_data = [id];
    console.log(escape_data);
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    return defered.promise;
};

/**
 * Gets active user's id,email,first name and last name
 * @param mysql
 * @param q
 * @returns {*|promise}
 */
exports.getActiveUsers = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 143);
    var escape_data = [];
    var deferred = q.defer();
    query = mysql.query(strQuery, escape_data, deferred.makeNodeResolver());
    return deferred.promise;
};

exports.getMlMUsers = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'getmlmusers');
    var escape_data = [];
    var deferred = q.defer();
    query = mysql.query(strQuery, escape_data, deferred.makeNodeResolver());
    return deferred.promise;
};

exports.getMlMUsers = function (mysql, q) {
    $mysqli = {};
    strQuery = mysqli.mysqli($mysqli, 'getmlmusers');
    var escape_data = [];
    var deferred = q.defer();
    query = mysql.query(strQuery, escape_data, deferred.makeNodeResolver());
    return deferred.promise;
};

exports.checkUserExist = function (req, mysql, q) {
    $mysqli = {
        username:req.body.username
    };
    strQuery = mysqli.mysqli($mysqli, 12);
    var defered = q.defer();
    query = mysql.query(strQuery, defered.makeNodeResolver());
    return defered.promise;
};

exports.createMlMUsers = function (req, mysql, q) {
    var md5 = require('MD5');
    var password_salt = '16**fun';
    var password = md5(md5(req.body.password) + password_salt);
    console.log(req.body);
    $mysqli = {
        username: req.body.username,
        display_name: req.body.display_name,
        email: req.body.email,
        password_hash: password,
        password_salt: password_salt,
        curr_rank: req.body.curr_rank,
        sp_no: req.body.sp_no,
        created_at: req.body.created_at,
        balance: req.body.balance,
        gender: req.body.gender,
        address1: req.body.address1,
        address2: req.body.address2,
        zip: req.body.zip
    };

    strQuery = mysqli.mysqli($mysqli, 'createmlmusers');

    var defered = q.defer();
    escape_data = [req.body.first_name, req.body.last_name];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());

    return defered.promise;
};
