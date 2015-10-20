var express = require('express');
var reload = require('reload');
var common = require('../module/common');
var router = express.Router();
var mysqli = require('../module/mysqli');
var user = require('../module/user');
var q = require('q');
var md5 = require('MD5');
var jwt = require('jsonwebtoken'); // used to create, sign, and verify tokens
var secret = "fun168853455331";

router.get('/', function (req, res) {
    res.json({ message: 'Welcome to the MLM API!' });
});

// route to authenticate a user (POST http://localhost:8080/api/authenticate)
router.post('/auth', function(req, res) {
    $mysqli = {username: req.body.username};
    strQuery = mysqli.mysqli($mysqli, 0);
    mysql = config.mysql;
    query = mysql.query(strQuery, function (error, results) {
        if (results.length > 0 && results[0]['username'] == req.body.username) {
            // check if password matches
            result = results[0];
            result.password = md5(md5(req.body.password) + result['password_salt']);
            if (result.password != result.password_hash) {
                res.json({success: false, message: 'Authentication failed. Wrong password.'});
            } else {

                // if user is found and password is right
                // create a token
                var token = jwt.sign(result, secret, {
                    expiresInMinutes: 1440 // expires in 24 hours
                });

                // return the information including token as JSON
                res.json({
                    success: true,
                    message: 'Enjoy your token!',
                    token: token
                });
            }
        }
        else {
            res.json({success: false, message: 'Authentication failed. User not found.'});
        }

    });
});


// route middleware to verify a token
router.use(function(req, res, next) {
    // check header or url parameters or post parameters for token
    var token = req.body.token || req.query.token || req.headers['x-access-token'];

    // decode token
    if (token) {

        // verifies secret and checks exp
        jwt.verify(token, secret, function(err, decoded) {
            if (err) {
                return res.json({ success: false, message: 'Failed to authenticate token.' });
            } else {
                // if everything is good, save to request for use in other routes
                req.decoded = decoded;
                next();
            }
        });

    } else {

        // if there is no token
        // return an error
        return res.status(403).send({
            success: false,
            message: 'No token provided.'
        });

    }
});

// route to return all users (GET http://localhost:8080/api/users)
router.get('/users', function(req, res) {
    q.all([user.getMlMUsers(config.mysql, q)]).then(function (result) {
        return res.json(result[0][0]);
    });
});

// route to create a user (POST http://localhost:8080/api/users)
router.post('/users', function(req, res) {
    q.all([user.checkUserExist(req, config.mysql, q)]).then(function (result) {
        if (result[0][0].length > 0) {
            return res.json({success: false, message: 'Failed to create user. User already exist!'});
        } else {
            q.all([user.createMlMUsers(req, config.mysql, q)]).then(function (result) {
                return res.json({success: true, id: result[0][0].insertId});
            }).fail(function (err) {
                return res.json({success: false, message: 'Failed to create user.'});
            });
        }
    }).fail(function(err) {
        return res.json({ success: false, message: 'Failed to create user. SQL ERROR!' });
    });

});

module.exports = router;