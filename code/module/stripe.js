var stripe = require('stripe-api')(global.card.stripekey);
var self = require('./payment');
var stripes = require('./stripe');
exports.createCustomerPayment = function (results, req, uid, self) {
    stripe.customers.retrieve(uid,
        function (err, response) {
            payment = false;
            payment1 = false;
            if (typeof(err) === 'undefined' || err === null) {
                payment = true;
            }
            else {
                if (err.error.message == 'No such customer: ' + uid) {
                    payment1 = true;
                }
                else {
                    page = '';
                    self.errorTrigger(err.error.message, '');
                }
            }
            if (payment1) {
                //console.log('phase1');
                stripes.addCustomer(results, req);
            }
            else if (payment) {
                //console.log(as);
                stripes.addCard(results, req);
            }
        });
};
exports.addCustomer = function (results, req) {
    stripe.customers.create(
        {
            description: 'A simple test profile',
            id: uid,
            email: results.email
        },
        function (err, resp) {
            if (typeof(err) === 'undefined' || err === null) {
                self.customerid = resp.id;
                stripes.addCard(results, req);
            }
            else {
                self.errorTrigger(err.error.message, '');
            }
        });
};
exports.doStripePayment = function (selfes, callback) {
    common = require('./common');
    k = self.amount;
    //console.log(common.currencyConverter(k.replace('.','')));
    stripe.charges.create({
        amount: common.currencyConverter(k).replace('.', ''),
        currency: "usd",
        customer: self.customerid, // obtained with Stripe.js
        description: self.name
    }, function (err, charge) {
        if (typeof(err) === 'undefined' || err === null) {
            self.transactionid = charge.id;
            callback();
        }
        else {
            self.errorTrigger(err.error.message);
        }
    });
};
/**
 * Saves the given new credit card details to stripe account given in config.ini
 * @param results
 * @param req
 */
exports.addCard = function (results, req) {
    var ccExpiryMonthAndYear = req.body.ccExp.split(" / ");
    stripe.tokens.create({
            card: {
                "number": req.body.creditCardNumber,
                "cvc": req.body.ccCVV,
                "exp_month": ccExpiryMonthAndYear[0],
                "exp_year": ccExpiryMonthAndYear[1].replace('20', '')
            }
        },
        function (err, tkn) {
            if (typeof(err) === 'undefined' || err === null) {
                self.paymentid = tkn.id;
                stripe.cards.create(
                    self.customerid,
                    {card: tkn.id},
                    function (err, card) {
                        if (typeof(err) === 'undefined' || err === null) {

                            //console.log(self);
                            self.executeUserData(results.id, self.doPayment);
                        }
                        else {
                            self.errorTrigger(err.error.message, '');
                        }
                    }
                );
            }
            else {
                self.errorTrigger(err.error.message, '');
            }

        });
};

