var Customerio = require('node-customer.io'), cio = '', uid = 0;
var admin = require('./admin');
var q = require('q');
/**
 * Default setters
 */
$arr = {
    config: config
};
/**
 * Initialize customer.io with API key
 */
exports.inits = function () {
    this.uid = 'customer_' + this.uid;
    cio = new Customerio(global.customerio.api, global.customerio.key);
};
/**
 * create a user with some initial properties
 * @param data
 */
exports.createCustomer = function (data) {
    cio.identify(this.uid, data.email, data.user, function () {
    });
};
/**
 * update an existing user with new properties
 * track an event for a user, using the unique id you created them with
 * @param data
 */
exports.sendEmail = function (data) {
    data.content.sitename = config.title;
    data.content.siteurl = config.url;
    data.content.siteaddress = config.url;
    var customerioUser = this.uid;
    q.all([admin.getemail(data.event, config.mysql, q, 0)]).then(function (result) {
        var Emailsubject = result[0][0][0]['subject'];
        var Emailmsg = result[0][0][0]['message'];
        content = data.content;
        var keys = Object.keys(content);
        Emailmsg = Emailmsg.replace(/{{event.siteurl}}/g, config.url);
        Emailmsg = Emailmsg.replace(/{{event.sitename}}/g, config.title);
        Emailsubject = Emailsubject.replace(/{{event.siteurl}}/g, config.url);
        Emailsubject = Emailsubject.replace(/{{event.sitename}}/g, config.title);
        for (var i = 0; i <= keys.length; i++) {
            Emailsubject = Emailsubject.replace('{{event.' + keys[i] + '}}', content[keys[i]]);
            Emailmsg = Emailmsg.replace('{{event.' + keys[i] + '}}', content[keys[i]]);
        }
        data.content.subject = Emailsubject;
        data.content.msg = Emailmsg;
        cio.track(customerioUser, 'pennyauction', data.content, function (err, res) {
            if (err != null) {
                console.error(err);
            }
        });
    });
};