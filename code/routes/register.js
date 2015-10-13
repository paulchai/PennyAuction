var express = require('express');
var reload = require('reload');
var common = require('../module/common');
var register = require('../module/register');
var q = require('q');
var app = express.Router();

app.post('/save', function (req, res) {
    data = req.body;

    if (data.email == '' || data.password == '' || data.repassword == '' || data.first_name == '' || data.last_name == '') {
        res.writeHead(302, {
            'Location': '/index/reg/Required Field Was Missing'
        });
        res.end();
        return false;
    }
    Recaptcha = require('recaptcha').Recaptcha;

    var data = {
        remoteip: req.connection.remoteAddress,
        challenge: req.body.recaptcha_challenge_field,
        response: req.body.recaptcha_response_field
    };
    /*var PUBLIC_KEY  = config.captachapublickey,
     PRIVATE_KEY = config.captachaprivatekey;
     var recaptcha = new Recaptcha(PUBLIC_KEY, PRIVATE_KEY, data);

     recaptcha.verify(function(success, error_code) {
     if (!success) {
     res.writeHead(302, {
     'Location': '/index/reg/Invalid Captcha'
     //add other headers here...
     });
     res.end();return false;
     }
     });*/

    q.all([register.checkemail(config.mysql, req)]).then(function (results) {
        if (results[0][0].length > 0) {
            res.writeHead(302, {
                'Location': '/index/reg/Email Already Exist!.'
                //add other headers here...
            });
            res.end();
            return false;
        }
        else {
            register.save(config.mysql, req, res);
        }

    });

});

app.get(['/', '/:id'], function (req, res) {
    $arr.error = $arr.r_id = '';
    register.loadPage(req, res, $arr, config);
});
app.get('/error/:error', function (req, res) {

    $arr.error = req.param('error');
    register.loadPage(req, res, $arr, config);
});
module.exports = app;