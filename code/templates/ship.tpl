{include file="common/header-1.tpl" nocache}
<script type="text/javascript" src="{$config.url}/js/countdown.js"></script>
<script type="text/javascript">
    var clock = [];
    var targetDate = [];
    var clearvar = [];
</script>
<div class="row">
    <div class="col-md-12 ship_bner">
        <div class="banner">{if !$cusdisable}
            <div class="bann_rht">
                <div class="rb_head">Own Your Penny Auction at Auction Software.com</div>
                <div class="rb_shead">Our penny auction product runs on NODE.JS</div>
                <div class="clearfix">
                    <div class="pull-left"><img src="{$config.url}/images/node_js.png" alt=""/></div>
                    <div class="pull-right"><img src="{$config.url}/images/buy_now.png" alt=""/></div>
                </div>
            </div>{/if}
        </div>
        <div class=" col-md-12 ship_bner box">
            <div class="panel panel-default">
                <div class=" panel-heading">
                    <div class="row">
                        <div class="crtitm"> {$_phrase.your_buynow_item}</div>
                    </div>
                </div>
                <div class="panel-body" id="step1">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <div><img
                                    src="{if $product.avatar == ''} {$config['imgpath']}no_img.png {else if $product.avatar != ''}{$config['imgpath']}product/{$product.avatar}{/if}"
                                    style="max-width:256px;max-height: 400px;" alt="1"></div>
                            <div class="dtimelft">{$product.title}</div>
                        </div>
                        <div class="col-xs-12 col-sm-8 col-md-8 ship_pro">
                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.time_left}</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-xs-6 col-sm-7 col-md-7">
                                    <div class="dtimelft1" id="my{$product.id}">{$product.day}</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.price} (USD $)</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="dtimelft1">US ${$product.bprice}</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.quantity}</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="dtimelft">1</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.shipping_cost} (USD $)</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="dtimelft1">${$product.shipping_price}</div>
                                </div>
                            </div>

                            {if $product.bid_credits > 0}
                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.bid_credit_spent} (USD $)</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="dtimelft1">${$product.bid_credits}</div>
                                </div>
                            </div>
                            {/if}


                            <div class="row">
                                <div class="col-xs-5 col-sm-4 col-md-4">
                                    <div class="dtimelft">{$_phrase.total_price} (USD $)</div>
                                </div>
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="dtimelft">:</div>
                                </div>
                                <div class="col-md-7">
                                    <div class="dtimelft1">US ${$product.totalprice-$product.bid_credits}</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <button type="button" onclick="nextstep('step2');" class="btn btn-primary blubt">
                                        {$_phrase.proceed_to_checkout}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="product">{$_phrase.product}{$_phrase.engspace}{$_phrase.description}</div>
                        <div class="para"> {$product.description}</div>
                    </div>
                </div>
                <div class="panel-body" id="step2" style="display:none">
                    <div class="clearfix row tamount_paid">
                        <div class="col-md-4">
                            <div class="tolalamnt">{$_phrase.totalamounttobepaid}</div>
                            <div class="ship">({$_phrase.including_shipping})</div>
                        </div>
                        <div class="col-md-4">
                            <div class="rate">US ${$product.totalprice-$product.bid_credits}</div>
                        </div>
                    </div>
                    <div class="row">
                        <form action="{$config['url']}/product/buy/{$product.id}/" method="get" id="shipping"
                              name="shipping" accept-charset="utf-8" data-parsley-validate>
                            <div class="shping"> {$_phrase.shipping}{$_phrase.engspace}{$_phrase.address}</div>
                            <div class="row pding">
                                <div class="col-xs-12 col-sm-12 col-md-8">
                                    <input class="form-control ct" placeholder="{$_phrase.enter_your_name}" name="name"
                                           value="{$shipping.name}" required>
                                </div>
                            </div>
                            <div class="row pding">
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <input type="email" class="form-control ct" placeholder="{$_phrase.enter_your_email}"
                                           name="email" value="{$useremail}" required>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <input class="form-control ct" placeholder="{$_phrase.enter_phone}" name="phone"
                                           value="{$shipping.phone}" data-parsley-maxlength="10" maxlength="10"
                                           required>
                                </div>
                            </div>
                            <div class="row pding">
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <input class="form-control ct" placeholder="{$_phrase.enter_your_address_line}" name="address"
                                           value="{$shipping.address1}{if $shipping.address2 !=''},{$shipping.address2}{/if}"
                                           required>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <select name="country" id="country" class="form-control" required>
                                        <option value="" selected="selected">{$_phrase.select}{$_phrase.engspace}{$_phrase.country}</option>
                                        {foreach $config.countries as $key => $val}
                                        <option value="{$val.name}" {if $users.country==$val.name} selected {/if} attr="{$val.location_id}">{$val.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="row pding">
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <input class="form-control ct" placeholder="{$_phrase.enter_your_state}" name="state"
                                           value="{$shipping.state}" data-parsley-pattern="^[A-z ,.'-]+$"
                                           data-parsley-pattern-message="Only Alphabets are allowed" required>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-2">
                                    <input class="form-control ct" placeholder="{$_phrase.city}" name="city"
                                           value="{$shipping.city}" data-parsley-pattern="^[A-z ,.'-]+$"
                                           data-parsley-pattern-message="Only Alphabets are allowed" required>
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-2">
                                    <input class="form-control ct" placeholder="{$_phrase.zipcode}" name="zipcode"
                                           value="{$shipping.zipcode}" required>
                                </div>
                            </div>
                            <div class="row pding">
                                <div class="cupn">{$_phrase.coupon_code|upper}<span class="validcupn">({$_phrase.please_enter_valid_coupon})</span>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <input id="code" name="ccode" class="form-control" placeholder="{$_phrase.coupon_code|upper}">
                                </div>
                                {if !$cusdisable}
                            </div>
                            <div class="row pding">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="paypl">{$_phrase.please_checkout_paypal}</div>
                                </div>
                                {/if}
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <button type="button" onclick="checkCoupon();" class="btn btn-primary bltn">
                                        {$_phrase.checkout}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-body" id="step3" style="display:none">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="cpncd">Thank you for entering coupon code!</div>
                            <div class="discnt">You got the discount of $ <span id="discount">0</span></div>
                        </div>
                        <!--<div class="col-md-6">
                                    <button type="button" class="btn btn-primary btnt">Shope More</button>
                                </div>-->
                    </div>
                    <div class="row amt">
                        <div class="col-xs-12 col-sm-6 col-md-5">
                            <div class="amtpd">{$_phrase.totalamounttobepaid}</div>
                            <div class="incldship">({$_phrase.including_shipping})</div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="dlrpric">US <span
                                    id="finalamt">{$product.totalprice-$product.bid_credits}</span></div>
                        </div>
                    </div>
                    <div class="col-md-8"></div>
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <button type="button" onclick="proceedBuy()" class="btn btn-primary btnt">{$_phrase.checkout}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{if !$cusdisable}
<div class="clearfix node_jsb">
    <div class="pull-left njsb">
        <div class="pbld">Product build <span>via</span></div>
    </div>
    <div class="pull-left left_nj">
        <p>After detailed research we built in Node.Js.</p>

        <p>Problem</p>

        <p> 1. Bidding in Php delay in response from Server. As you grow to million of USers server slown down in
            PHP </p>

        <p>Solution</p>

        <p>1. server responds back in milliseconds.</p>

    </div>
</div>
{/if}
{include file="common/footer-1.tpl" nocache}
<script type="text/javascript">
    $(function () {
        var ctry = '{$shipping.country}';
        if (ctry != '')
            $('#country').val(ctry);
    });
    function nextstep(id) {
        $('.panel-body').hide();
        $('#' + id).show();
    }
    function proceedBuy() {
        $('#shipping').submit();
    }
    function checkCoupon() {
        var code = $('#code').val();
        if (code != '') {
            param = {
                code: code
            };
            $.ajax({
                type: 'post',
                url: '{$config["url"]}/product/checkcoupon/',
                data: param,
                dataType: 'json',
                success: function (data) {
                    if (data.success == 'false')
                        alert('Invalid Coupon');
                    else {
                        var discount = "";
                        var afterDiscount = "";
                        if (data.type == 'dollar') {
                            discount = parseFloat(data.amount, 2);
                            afterDiscount = parseFloat('{$product.bprice}', 2) - discount;
                        }
                        else if (data.type == 'percentage') {
                            discount = (parseFloat(data.amount, 2) * parseFloat('{$product.bprice}', 2) / 100);
                            afterDiscount = parseFloat('{$product.bprice}', 2) - discount;
                        }
                        $('#discount').html(discount);
                        $('#finalamt').html(afterDiscount + parseFloat('{$product.shipping_price}', 2) - parseFloat('{$product.bid_credits}', 2));
                        nextstep('step3');
                    }
                }
            });
        }
        else
            $('#shipping').submit();
    }
    meee('{$product.id}', '{$product.closed}');
    function meee(id, dateee) {
        clearInterval(clearvar[id]);
        clock[id] = document.getElementById('my' + id);
        targetDate[id] = new Date(dateee); // Jan 1, 2050;

        clock[id].innerHTML = countdown(targetDate[id]).toString();
        clearvar[id] = setInterval(function () {
            if (targetDate['{$product.id}'] > new Date())
                clock[id].innerHTML = countdown(targetDate[id]).toString();
            else
                clock[id].innerHTML = 'Closed';
        }, 1000);
    }
</script>
<script type="text/javascript">
    $(function () {
        $("#country").on("change", function () {
            console.clear();
            console.log(this.value);
            var param = {
                countryCode: $("#country option:selected").text()
            };
            console.log(param);
            $.ajax({
                type: 'post',
                url: '{$config.url}/product/getStates/',
                data: param,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script>