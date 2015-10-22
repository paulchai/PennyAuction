var express = require('express');
var reload = require('reload');
var common = require('../module/common');
var session = require('express-session');
var app = express.Router();
var cryptos = require('../module/crypto.js');
var mysqli = require('../module/mysqli');
var q = require('q');


//required js
/*var configure = require('../configure');

 //default setters
 var config = configure.app();

 $arr = {
 config: config
 };*/

//login check router
app.post('/save', function (req, res) {
    if (typeof(req.body.autologin) == 'undefined')
        common.checkLogin(req, res, 1);
    else
        req.session.autologin = req.body.autologinoption;

    var login = require('../module/login');

    function processObject(row) {
        //console.log(row);
        if (row.length > 0) {
            if (row[0].status != 'active') {

                if (row[0].status == 'moderate') {
                    res.writeHead(302, {
                        'Location': '/index/log/Account Not Verified Yet. Please verify'
                    });
                }
                else {
                    res.writeHead(302, {
                        'Location': '/index/log/Account Deactivated'
                    });
                }
                res.end();
                return false;
            }

            delete req.session.userid;
            delete req.session.email;
            delete req.session.username;
            req.session.email = row[0].email;
            req.session.username = row[0].username;
            req.session.userid = row[0].id;
            req.session.first_name = row[0].first_name;
            req.session.last_name = row[0].last_name;
            $arr.loged = req.session;
            if (req.body.remember)
                res.cookie('username', req.body.username);
            else
                res.clearCookie('username');

            res.writeHead(302, {
                'Location': '/dashboard/'
            });
            res.end();
            return false;
        }
        else {
            res.writeHead(302, {
                'Location': '/index/log/invalid login Credentials '
            });
            res.end();
            return false;
        }
    }

    var userprocess = login.process(req, config.mysql, processObject);


});


//login router
app.get('/', function (req, res) {
    common.checkLogin(req, res, 1);
    $arr.loged = req.session;
    var login = require('../module/login');
    login.login(req, res, $arr);

});


//logout
app.get('/logout', function (req, res) {
    delete req.session.userid;
    delete req.session.email;
    delete req.session.username;
    //req.session = {};
    req.session.destroy();
    common.checkLogin(req, res, 0);
});


//forgot password
app.get('/forgot_password', function (req, res) {
    $arr['textStatus'] = '';
    var url = require('url');
    var datas_ = url.parse(req.url, true).query;

    if (datas_['id'] == '' || typeof(datas_['id']) == 'undefined') {
        $arr['step1'] = true;
        $arr['step2'] = false;
        $arr['verifyurl'] = '';
        $arr['id'] = '';
    }
    else {
        $arr['step2'] = true;
        $arr['step1'] = false;
        $arr['verifyurl'] = $arr['id'] = datas_['id'];
    }

    common.tplFile('forgot_password.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);
});

//send forgot password email
app.post('/forgot_password', function (req, res) {
    $mysqli = {username: req.body.username};
    strQuery = mysqli.mysqli($mysqli, 12);
    mysql = config.mysql;
    query = mysql.query(strQuery, function (error, results, fields) {
        if (results.length > 0 && results[0]['username'] == req.body.username) {
            customerio = require('../module/customerio');
            customerio.uid = results[0]['id'];
            customerio.inits();
            customerio.createCustomer({
                email: req.body.email,
                user: {firstName: results[0]['first_name'], lastName: results[0]['last_name']}
            });

            var hw = cryptos.encrypt(req.body.email);
            var u_ID = results[0]['id'].toString();
            var id = cryptos.encrypt(u_ID);
            $arr['step1'] = true;
            $arr['step2'] = false;
            $arr['textStatus'] = 'An email has been dispatched to you to update your password';
            $arr['verifyurl'] = config.url + '/login/forgot_password?id=' + hw;
            customerio.sendEmail({
                event: 'forgot_password',
                content: {
                    passwordurl: $arr['verifyurl'],
                    firstName: results[0]['first_name'],
                    lastName: results[0]['last_name']
                }
            });
            $arr['id'] = id;
        }
        else {
            $arr['textStatus'] = 'Email did not match with record';
        }

    });
    common.tplFile('forgot_password.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);
});
app.post('/changepassword', function (req, res) {


    //var hw = cryptos.encrypt(req.body.email);
    var u_ID = cryptos.decrypt(req.body.id);
    // common.checkLogin(req,res,0);
    mysql = config.mysql;
    var md5 = require('MD5');
    var password_salt = '12345'
    var password = md5(md5(req.body.new_password) + password_salt);
    strQuery = mysqli.mysqli($mysqli, 57);

    $mysqli = {};
    var defered = q.defer();
    escape_data = [password, password_salt, u_ID];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    res.writeHead(302, {
        'Location': '/login/'
    });
    res.end();
    return false;

});


app.get('/activation', function (req, res) {


    //var hw = cryptos.encrypt(req.body.email);
    var u_ID = cryptos.decrypt(req.param('id'));
    // common.checkLogin(req,res,0);
    mysql = config.mysql;
    var md5 = require('MD5');
    strQuery = mysqli.mysqli($mysqli, 141);

    $mysqli = {};
    var defered = q.defer();
    escape_data = [u_ID];
    query = mysql.query(strQuery, escape_data, defered.makeNodeResolver());
    res.writeHead(302, {
        'Location': '/index/log/your account has been verified successfully!'
    });
    res.end();
    return false;

});

module.exports = app;
