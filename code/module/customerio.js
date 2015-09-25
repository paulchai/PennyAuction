//console.log(3);
var Customerio = require('node-customer.io');
//console.log(5);
var cio = '';
var uid = 0;
exports.inits = function () {
    this.uid = 'customer_' + this.uid;
    cio = new Customerio(global.customerio.api, global.customerio.key);
};
exports.createCustomer = function (data) {
// create a user with some initial properties
    cio.identify(this.uid, data.email, data.user, function () {
    });
};
// update an existing user with new properties
// track an event for a user, using the unique id you created them with
exports.sendEmail = function (data) {
    data.content.sitename = 'AuctionSoftware.com';
    //data.content = defaults.concat(data.content);
    cio.track(this.uid, data.event, data.content, function () {
    });
};
   