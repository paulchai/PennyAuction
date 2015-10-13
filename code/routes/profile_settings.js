var util = require('util');
var express = require('express');
var reload = require('reload');
var q = require('q');
var sprintf = require('sprintf').sprintf;
var common = require('../module/common');
var app = express.Router();
var profile = require('../module/profile_settings');
app.get('/', function (req, res) {
    $arr['mcats'] = $arr['users'] = '';
    var module = require('../module');
    $arr.pagetitle = '';
    $arr.ptitle = 'profile_settings';
    common.checkLogin(req, res, 0);
    q.all(profile.profileDetails(req, config.mysql, q, ['email', 'username', 'id', 'first_name', 'last_name', 'aboutme', 'image', 'avatar', 'address1', 'address2', 'country', 'state', 'city', 'zip', 'phone'])).then(function (results) {
        $arr['users'] = results[0][0];
        q.all(profile.listUserCategories(req, config.mysql, q)).then(function (results2) {
            $arr['mcats'] = results2[0][0]['mcat'];
            common.tplFile('profile_settings.tpl');
            common.headerSet(1);
            common.loadTemplateHeader(req, res, $arr);
        });
    });
});
app.post('/update/', function (req, res) {
    var attach = require('../module/attach');
    attach.save('profile', req, res);
    $arr['save'] = true;
    q.all(profile.saveDetails(req, config.mysql, q)).then(function (results) {
        var managecats = function (mcat, cb) {
            profile.managecategories(req, config.mysql, q, mcat);
            cb(null);
        };
        profile.removeCategories(req, config.mysql, q);
        if (typeof(req.body.categories) != 'undefined') {
            var async = require('async');
            async.each(req.body.categories, managecats, function (err) {
                if (err) return console.error(err);
                res.writeHead(302, {
                    'Location': '/profile_settings/'
                });
                res.end();
                return false;
            });
        }
        else {
            res.writeHead(302, {
                'Location': '/profile_settings/'
            });
            res.end();
            return false;
        }
    })
});
module.exports = app;