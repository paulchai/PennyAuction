{include file="common/header-1.tpl" nocache}
<style>
    .dashboard .col-md-8 {
        width: 66.66666667%;
    }

    .dashboard .col-md-9 {
        min-height: 5px;
    }
</style>
<div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache}</div>
    <div class="col-md-9">
        <h4 class="ds_brd" style="text-transform: capitalize;">{$_phrase.add}{$type}xxx{$_phrase.engspace}{$_phrase.address}</h4>

        <form action="{$config['url']}/dashboard/Myaddress" method="post" id="shipping" name="shipping"
              accept-charset="utf-8" data-parsley-validate>
            <input type="hidden" name="type" value="{$type}" id="addresstype"/>

            <div class="row">
                <div class="form-group">
                    <label for="name" class="col-md-3">{$_phrase.name}:</label>

                    <div class="col-md-5">
                        <input type="text" id="name" name="name" placeholder="Enter your name" value="{$shipping.name}"

                               class="form-control splchar_restrict" title="Enter your name" maxlength="20" data-parsley-required-message="Enter name" required>
                        <!--<input type="text" class="form-control wd60 splchar_restrict" id="exampleInputEmail1" name="tags" value="{$projects.tags}"  data-parsley-required-message="Please add keyword" required>-->
                    </div>
                </div>
            </div>

            <!--<div class="form-group fnt">-->
                <!--<label for="exampleInputEmail1" class="nclracac newclr">Keywords </label>-->
                <!--<input type="text" class="form-control wd60 splchar_restrict" id="exampleInputEmail1" name="tags" value="{$projects.tags}"  data-parsley-required-message="Please add keyword" required>-->
            <!--</div>-->
            <div class="row">
                <div class="form-group">
                    <label for="address_line1" class="col-md-3">{$_phrase.addressline1}:</label>

                    <div class="col-md-5">
                        <input type="text" id="address_line1" name="address1" placeholder="Enter your address line1"
                               data-parsley-required-message="Enter Address line 1"
                               class="form-control" value="{$shipping.address1}" title="Address Line 1" maxlength="50"
                               required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="address_line2" class="col-md-3">{$_phrase.addressline2}:</label>

                    <div class="col-md-5">
                        <input type="text" id="address_line2" name="address2" placeholder="Enter your address line2" data-parsley-required-message="Enter Address line 2"
                               class="form-control" value="{$shipping.address2}" title="Address Line 2" maxlength="50" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="country" class="col-md-3">{$_phrase.country}:</label>

                    <div class="col-md-5">
                        <select name="country" id="country" class="form-control" required data-parsley-required-message="Choose Country">
                            <option value="" selected="selected">{$_phrase.select}{$_phrase.engspace}{$_phrase.country}</option>
                           </select>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="state" class="col-md-3">{$_phrase.state}:</label>

                    <div class="col-md-5">
                    <select name="state" id="state" class="form-control" required
                            data-parsley-required-message="Choose state">
                        <option value="" selected="selected">Select state</option>

                    </select>
                </div>
            </div>
</div>
                <input type="hidden" name="hidden_country" id="hidden_country" value="{$users.country}">
                <input type="hidden" name="hidden_state" id="hidden_state" value="{$users.state}">


            <div class="row">
                <div class="form-group">
                    <label for="town" class="col-md-3">{$_phrase.city}:</label>

                    <div class="col-md-5">
                        <input type="text" id="town" name="city" placeholder="Enter city" class="form-control"
                               data-parsley-required-message="Enter city"
                               value="{$shipping.city}" title="city" maxlength="20" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="zipcode" class="col-md-3">{$_phrase.zipcode}:</label>

                    <div class="col-md-5">
                        <input type="text" id="zipcode" name="zipcode" placeholder="Enter zipcode" class="form-control"
                               data-parsley-required-message="Enter zipcode"
                               value="{$shipping.zipcode}" title="Zipcode" maxlength="10" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="phone" class="col-md-3">{$_phrase.phonenumber}:</label>

                    <div class="col-md-5">
                        <input type="text" id="phone" name="phone" placeholder="Eg: 0123123456, +919874563210"
                               data-parsley-required-message="Enter Phone number"
                               class="form-control" value="{$shipping.phone}" title="Phone Number" maxlength="20" required
                               >
                    </div>
                </div>
            </div>
            <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <input class="btn save_btn" type="submit" value="Save">

                    </div>
                    </div>
            </form>
            <!--</form>-->
        <!--</form>-->
    </div>
</div>
{include file="common/footer-1.tpl" nocache}
<script>
    $(function () {
        var ctry = '{$shipping.country}';
        if (ctry != '')
            $('#country').val(ctry);
    });

    $(function () {
        populateCountries("country", "state");
        var ctry = '{$users.country}';
        if (ctry != '')
            $('#country').val(ctry);
        loadState();

    });

    var ctry = '{$users.country}';
    console.log(ctry);
    if(ctry !='')
    {
        $('#country').val(ctry);

        loadState();

    }


    $('#country').on('change',function()
    {
        loadState();
    });
</script>
