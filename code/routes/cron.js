var express = require('express');
var common = require('../module/common');
var products = require('../module/products');
var app = express.Router();
var q = require('q');
var request = require('request');
var cron = require('cron');

var cronJob = cron.job("*/59 * * * * *", function () {
    request(config.url + '/product/closeall', function (error, response, body) {
        if (!error && response.statusCode == 200) {
        }
    });

    //seated auction reminder email

    var seated = require('../module/seated_auction');
    q.all(seated.seatedAuctionReminderEmail(config.mysql, q)).then(function (results) {
        var async = require('async');
        async.forEachSeries(results[0], function (n1, callback_s1) {
            customerio = require('../module/customerio');
            customerio.uid = n1.userid;
            customerio.inits();
            customerio.createCustomer({email: n1.email, user: {firstName: n1.first_name, lastName: n1.last_name}});
            customerio.sendEmail({
                event: 'seatedReminder',
                content: {
                    user: n1.name,
                    title: n1.title,
                    url: config.url + '/product/view/' + n1.id,
                    start: n1.start,
                    end: n1.end
                }
            });

            seated.updateSeatedCronReminder(config.mysql, q, n1);
            callback_s1();
        });
    });
});

cronJob.start();