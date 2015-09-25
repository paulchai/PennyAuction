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

