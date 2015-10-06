var express = require('express');
var common = require('../../module/common');
var app = express.Router();
var q = require('q');
var admin = require('../../module/admin');
var pagination = require('pagination');

app.get(['/login', '/login/:error'], function (req, res) {
    req.body.error = $arr['error'] = (typeof(req.param('error')) === 'undefined') ? '' : req.param('error');
    $arr.logincheck = 1;
    common.tplFile('admincp/login.tpl');
    common.headerSet(1);
    common.loadTemplateHeader(req, res, $arr);

});
app.post(['/login/save'], function (req, res) {
    if (typeof(req.body.autologin) == 'undefined')
        common.checkLogin(req, res, 1);
    else
        req.session.autologin = req.body.autologinoption;

    var login = require('../../module/login');

    function processObject(row) {
        if (row.length > 0) {
            if (row[0].admin == 1) {
                delete req.session.userid;
                delete req.session.email;
                delete req.session.username;
                delete req.session.autologin;
                delete session;

                req.session.admin = 1;
                req.session.email = row[0].email;
                req.session.username = row[0].username;
                req.session.userid = row[0].id;
                req.session.first_name = row[0].first_name;
                req.session.last_name = row[0].last_name;
                req.session.tpermission = 'no';
                $arr.loged = req.session;
                res.writeHead(302, {
                    'Location': '/admincp/dashboard'
                });
                res.end();
            }
            else {
                res.writeHead(302, {
                    'Location': '/admincp/login/Invalid login'
                });
                res.end();
            }
        }
        else {
            res.writeHead(302, {
                'Location': '/admin/login/Invalid login'
            });
            res.end();
        }
    }

    var userprocess = login.process(req, config.mysql, processObject);
});
module.exports = app;