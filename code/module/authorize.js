var AuthorizeTypes = require('auth-net-types')
    , _AuthorizeCIM = require('auth-net-cim')
    , AuthorizeCIM = new _AuthorizeCIM({
        api: global.card.authorizeapi,
        key: global.card.authorizekey,
        sandbox: (global.card.authorizesandbox == 'yes') // false
    });
var payment = require("./payment");

/**
 * For a new customer customerProfileId should be his current database id. While doing Authorize.net transaction, save the customerProfileId generated into database
 * And use customerProfileId from database from next transaction
 * @type {number}
 */
var customerProfileId = 0;
var merchantCustomerId = 0;
var customerPaymentProfileId = null;
var email = "admin@auctionsoftware.com";
var description = "A customer with lot of cash";
var creditCardNumber = 0;
var ccExpiryMonth = 0;
var ccExpiryYear = 0;
var item = null;
var self = null;
var userProfile = null;

exports.createCustomerPayment = function (results, req, uid, selfS) {
    userProfile = results;
    self = selfS;
    email = selfS.sessionsdata.email;
    merchantCustomerId = customerProfileId = uid;
    var ccExpiryMonthAndYear = req.param('ccExp').split(" / ");
    ccExpiryMonth = ccExpiryMonthAndYear[0];
    ccExpiryYear = ccExpiryMonthAndYear[1];
    creditCardNumber = req.param('creditCardNumber');
    AuthorizeCIM.getCustomerProfile(customerProfileId, function (err, response) {
        if (typeof(err) === 'undefined' || err === null) { // Got customer profile details, check for customer's payment profile details
            if (typeof response.profile.paymentProfiles.customerPaymentProfileId != "undefined") { // User has only one credit card detail, use it
                customerPaymentProfileId = response.profile.paymentProfiles.customerPaymentProfileId;
            } else if (typeof response.profile.paymentProfiles[0].customerPaymentProfileId != "undefined") { // More than one credit card is available, so fetch the first card detail
                customerPaymentProfileId = response.profile.paymentProfiles[0].customerPaymentProfileId;
            }
            console.log("Got customer's existing payment profile");
            if (customerPaymentProfileId !== null) { // Get existing payment profile
                self.executeUserData(userProfile.id, self.doPayment);
            } else { // User doesn't have a payment profile.Create new one
                createPaymentProfile();
                self.executeUserData(userProfile.id, self.doPayment);
            }

        } else { // Couldn't get user's profile details with the specified id. Create new profile
            AuthorizeCIM.createCustomerProfile({
                customerProfile: {
                    merchantCustomerId: merchantCustomerId,
                    description: description,
                    email: email,
                    customerProfileId: customerProfileId
                }
            }, function (err, response) {
                if (typeof(err) === 'undefined' || err === null) { // User profile has been successfully created. Create payment profile
                    customerProfileId = response.customerProfileId;
                    createPaymentProfile();
                } else { // Getting error mostly because, the user profile already exists, so make transaction. Check error
                    if (err.code == "E00039") { // Failed because profile already exists. Make a transaction
                        console.log("Check this loop");
                        getCustomerPaymentProfile();
                        self.executeUserData(userProfile.id, self.doPayment);
                    }
                }
            });
        }
    });
};

/**
 * Try to create payment profile with the given card details.
 * If error is received then it means these details are already available
 *  Get user payment profile details and create a transaction
 * Else create a new payment profile
 */
var getCustomerPaymentProfile = function () {
    AuthorizeCIM.getCustomerPaymentProfile({
        customerProfileId: customerProfileId,
        customerPaymentProfileId: customerPaymentProfileId
    }, function (err, response) {
        if (typeof(err) === 'undefined' || err === null) { // User payment profile received successfully. Get customer payment profile
            if (typeof response.profile.paymentProfiles.customerPaymentProfileId != "undefined") { // User has only one credit card detail, use it
                customerPaymentProfileId = response.profile.paymentProfiles.customerPaymentProfileId;
            } else if (typeof response.profile.paymentProfiles[0].customerPaymentProfileId != "undefined") { // More than one credit card is available, so fetch the first card detail
                customerPaymentProfileId = response.profile.paymentProfiles[0].customerPaymentProfileId;
            }
        } else { // Create customer payment profile and then make a transaction
            createPaymentProfile();
        }
    });
};
/**
 * Create a payment profile with the given credit card
 */
var createPaymentProfile = function () {
    var options = {
        customerType: 'individual',
        payment: {
            creditCard: new AuthorizeTypes.CreditCard({
                cardNumber: creditCardNumber.replace(/\s+/g, ''),
                expirationDate: ccExpiryYear + '-' + ccExpiryMonth
            })
        }
    };

    AuthorizeCIM.createCustomerPaymentProfile({
        customerProfileId: customerProfileId,
        paymentProfile: options
    }, function (err, response) {
        if (typeof(err) === 'undefined' || err === null) { // Created payment profile. Make a transaction
            customerPaymentProfileId = response.customerPaymentProfileId;
            self.customerid = customerProfileId;
            self.paymentprofileid = customerPaymentProfileId;
            self.executeUserData(userProfile.id, self.doPayment);
        } else { // Payment profile already exists. Make transaction with existing data. This loop won't execute, since the case is handled at the beginning
            if (err.code = "E00039") {
                console.log("Nothing to worry. Return to caller function");
            }
        }
    });
};
exports.doAuthorizePayment = function (self, callback) {
    var transaction = {
        amount: self.amount,
        tax: {
            amount: 0,
            name: '',
            description: ''
        },
        shipping: {
            amount: 0,
            name: '',
            description: ''
        },
        duty: {
            amount: 0,
            name: '',
            description: ''
        },
        lineItems: {
            itemId: self.payid,
            name: self.name,
            description: self.name,
            quantity: 1,
            unitPrice: self.amount,
            taxable: false
        },
        customerProfileId: customerProfileId,
        customerPaymentProfileId: customerPaymentProfileId
    };

    AuthorizeCIM.createCustomerProfileTransaction('AuthCapture', transaction, function (err, res) {
        if (typeof(err) === 'undefined' || err === null) {
            self.transactionid = 0;
            callback();
        }
        else {
            self.errorTrigger(err);
        }
    });
};