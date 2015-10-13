{include file="common/header-1.tpl" nocache}
<div class="row" style="min-height:250px">
    <div class="banner_inner">
        <div class="wrapper_outer">
            <div class="wrapper_inner">
                <div class="wrapper">
                    <div class="auctions_black_authorize_top_bg">
                        <div class="auctions_black_authorize_top_left"></div>
                        <div class="auctions_black_authorize_top_mid">
                            <h2>{$_phrase.authorize_authentication}</h2>

                            <h2 class="validation"></h2>
                            {if $error!=''}
                            <ul class="parsley-errors-list filled" id="parsley-id-1311">
                                <li class="parsley-required">{$error}</li>
                            </ul>
                            {/if}
                        </div>
                        <div class="auctions_black_authorize_top_right"></div>
                    </div>
                    <div class="actions_black_autorize_mid_bg" id="authrize_payment_page">
                        <div class="white_theme_tot_aut">
                            <form method="POST" name="authorize_form" id="authorize_form" action="/package/pay"
                                  autocomplete="off">
                                <input type="hidden" name="id" value="{$id}"/>

                                <div class="form-group">
                                    <label for="payment">{$_phrase.pay_type}:</label>
                                    <select id="payment" name="payment">
                                        <option value="paypal">{$_phrase.paypal}</option>
                                        <option value="authorize">{$_phrase.authorize_paytype}</option>
                                        <option value="stripe">{$_phrase.stripe}</option>
                                    </select>
                                </div>
                                <div id="cardPayments" style="display:none;">
                                    <div class="form-group">
                                        <h3>{$_phrase.card_type} : <span class="label label-default" id="cardType">Type card number below</span></h3>
                                    </div>
                                    <div class="form-group">
                                        <label for="creditCardNumber">{$_phrase.card_number}:</label>

                                        <div class="input-group">
                                            <input type="text" class="form-control cc-number" maxlength="19"
                                                   placeholder="Valid Card Number"
                                                   name="creditCardNumber"
                                                   id="creditCardNumber" required>
                            <span class="input-group-addon" id="basic-addon2">
                                <i class="fa fa-credit-card"></i>
                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-12 padal">
                                        <div class="col-md-6 padlf">
                                            <div class="form-group">
                                                <label for="cc-exp" class="control-label">{$_phrase.expiration_date}</label>
                                                <input id="cc-exp" name="ccExp" type="tel" class="form-control cc-exp"
                                                       placeholder="•• / ••" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6 padrt">
                                            <div class="form-group">
                                                <label for="cc-cvc" class="control-label">{$_phrase.cvv}</label>
                                                <input id="cc-cvc" name="ccCVV" type="tel" class="form-control cc-cvc"
                                                       placeholder="•••" required>
                                            </div>
                                        </div>
                                    </div>

                                    <input name="authorize_pay_submit" class="btn save_btn" type="Submit"
                                           value="PAY NOW">
                                </div>
                            </form>
                            <!--<div class="col-md-12" style="padding-left:0; padding-right:0; margin-bottom:3%; margin-top:3%;">{$config.title}</div>&lt;!&ndash;{$config.paypal}&ndash;&gt;-->
                            <div id="paypalDetails">
                                <form target="paypal"
                                      action="{if $config['paypal']['sandbox'] == 'yes'} https://www.sandbox.paypal.com/cgi-bin/webscr {else} https://www.paypal.com/cgi-bin/webscr {/if}"
                                      method="post">
                                    <input type="hidden" name="cmd" value="_cart">
                                    <input type="hidden" name="upload" value="1">
                                    <input type="hidden" name="business" value="{$config['paypal']['address']}">
                                    <!-- Begin First Item -->
                                    <input type="hidden" name="quantity_1" value="1">
                                    <input type="hidden" name="item_name_1" value="Buying {$package} Package">
                                    <input type="hidden" name="item_number_1" value="{$id}">
                                    <input type="hidden" name="amount_1" value="{$amount}">
                                    <input type="hidden" name="custom" value="package|{$loged.userid}|{$id}">
                                    <input type="hidden" name="notify_url" value="{$config.dpath}package/paypal">
                                    <input type="hidden" name="return" value="{$config.url}/dashboard/transactions">
                                    <input type="hidden" name="cancel_return"
                                           value="{$config.url}/dashboard/transactions">
                                    <!-- End Third Item -->
                                    <input type="hidden" name="currency_code" value="USD">
                                    <!--<input type="hidden" name="tax_cart" value="5.13"> -->
                                    <input type="submit" value="Pay now" class="btn save_btn" border="0" name="upload"
                                           alt="Make payments with PayPal - it's fast, free and secure!" width="87"
                                           height="23">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{include file="common/footer-1.tpl" nocache}
<script type="text/javascript" src="{$config.url}/bower_components/jquery.payment/lib/jquery.payment.js"></script>
<script type="text/javascript"
        src="{$config.url}/bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">

    var ctype = '{$get.gateway}';
    if (ctype != '') {
        $('select[name="payment"]').val(ctype);
        $('#cardPayments').show();
        $('#paypalDetails').hide();
    }

    $(function () {
        $('select[name="payment"]').on('change', function () {
            //console.log(2);
            if ($(this).val() == 'paypal') {
                $('#cardPayments').hide();
                $('#paypalDetails').show();
            }
            else {
                $('#cardPayments').show();
                $('#paypalDetails').hide();
            }
        });
    });
</script>
<script>
    jQuery(function ($) {
        /*Setup Stripe for credit card validation*/
        var PublishableKey = 'pk_test_aPrUcfPZTrYw59ZnpxNSCzhl'; // Replace with your API publishable key
        Stripe.setPublishableKey(PublishableKey);
        /*Setup Jquery Payment library for validation*/
        $('.cc-number').payment('formatCardNumber');
        $('.cc-exp').payment('formatCardExpiry');
        $('.cc-cvc').payment('formatCardCVC');
    });
</script>
<script>
    $(document).ready(function () {
        $.validator.setDefaults({
            errorElement: "span",
            errorClass: "help-block",
            highlight: function (element, errorClass, validClass) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length || element.prop('type') === 'checkbox' || element.prop('type') === 'radio') {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
        jQuery.validator.addMethod("cardNumber", function (value, element) {
            console.log(Stripe.card.cardType(value));
            $("#cardType").html(Stripe.card.cardType(value));
            return this.optional(element) || Stripe.card.validateCardNumber(value);
        }, "Please specify a valid credit card number.");

        jQuery.validator.addMethod("cardExpiry", function (value, element) {
            /* Parsing month/year uses jQuery.payment library */
            value = $.payment.cardExpiryVal(value);
            return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
        }, "Invalid expiration date.");

        jQuery.validator.addMethod("cardCVC", function (value, element) {
            return this.optional(element) || Stripe.card.validateCVC(value);
        }, "Invalid CVC.");
        $("#authorize_form").validate({
            rules: {
                creditCardNumber: {
                    required: true,
                    cardNumber: true
                },
                ccExp: {
                    required: true,
                    cardExpiry: true
                },
                ccCVV: {
                    required: true,
                    cardCVC: true
                }
            },
            messages: {
                creditCardNumber: {
                    required: "Enter card number"
                },
                ccExp: {
                    required: "Enter expiry date"
                },
                ccCVV: {
                    required: "Enter CVV number"
                }
            }
        });
    });
</script>