var util = require('util'),
    nsmarty = require('nsmarty');
var md5 = require('MD5');
var mysqli = require('./mysqli');
var common = require('./common');
var q = require('q');
exports.process = function (req, mysql, callback) {

    q.all(this.loginExist(req, mysql, q)).then(function (results) {
        //console.log(results[0]);console.log('pandi');return 0;
        if (results[0].length > 0) {
            result = results[0][0];
            result.password = md5(md5(req.param('password')) + result['password_salt']);
            if (result.password == result.password_hash || typeof(req.body.autologin) != 'undefined') {
                callback(results[0]);
            }
            else {
                callback('');
            }
        }
        else {
            callback('');
        }
    }).catch(function (error) {
        throw error;
        // Handle any error from all above steps
    });

};

exports.loginExist = function (req, mysql, q) {
    $mysqli = {username: req.body.username};
    strQuery = mysqli.mysqli($mysqli, 0);
    var defered = q.defer();
    var escape_data = [];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    query.on('error', function (err) {
        throw err;
    });
    return defered.promise;
};
exports.saved = function (req, res, arr) {
    common.tplFile('saved.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, arr);
};
exports.login = function (req, res, arr) {
    common.tplFile('login.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, arr);
};