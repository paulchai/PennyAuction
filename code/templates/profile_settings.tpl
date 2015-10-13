{include file="common/header-1.tpl" nocache}
<style>
    .dashboard .col-md-8 {
        width: 66.66666667%;
    }
</style>
<div class="row dashboard prof_stings">
    <div class="col-md-3 db_left_nav"> {include file="left-nav-dashboard.tpl" nocache}</div>
    <div class="col-md-9 pst_wrap">
        <h4 class="ds_brd">{$_phrase.profile}{$_phrase.engspace}{$_phrase.setting}{$_phrase.s}</h4>

        <form action="/profile_settings/update/" id="profile_settings" method="post" accept-charset="utf-8"
              enctype="multipart/form-data">
            {if $save}
            <div class="row">
                <div class="bg bg-success padding-20">{$_phrase.profile}{$_phrase.engspace}{$_phrase.saved|lower}{$_phrase.engspace}{$_phrase.successfully|lower}!</div>
            </div>
            {/if}
            <div class="row hrht">
                <div class="col-xs-12 col-sm-3 col-md-3 pull-right">
                    <div class="pull-left person_pro ne_pro_image">
                        <img id="imageupload"
                             src="{if $users.avatar == ''} {$config['imgpath']}no_img.png {else if $users.avatar != ''}{$config['url']}/uploads/profile/{$users.avatar}{/if}"
                             title="No Photo" alt="no_img" width="97" height="75"></div>
                    <button type="button" class="ep_change_btn" onclick="triggerfile()">{$_phrase.change}</button>

                    <input name="profile_image" class="input file-upload" type="file"
                           style="opacity:0;width:1px;height:1px;">
                    <!-- <button type="button" class="btn save_btn" style="margin-left:20px;margin-top:20px" onclick="triggerfile()">Upload</button>        -->

                </div>
                <div class="col-xs-12 col-sm-9 col-md-9 psting_rlft">
                    <div class="row">
                        <div class="form-group">
                            <label for="user_email_address" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.email}*:</label>

                            <div class="col-xs-12 col-sm-5 col-md-6">
                                <input type="email" id="user_email_address" name="email" value="{$users.email}"
                                       maxlength="50" title="Email"
                                       class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="username" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.username}*:</label>

                            <div class="col-xs-12 col-sm-5 col-md-6">
                                <input type="text" id="username" name="username" value="{$users.username}" maxlength="20"
                                       title="User Name" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="first_name" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.firstname}*:</label>

                            <div class="col-xs-12 col-sm-5 col-md-6">
                                <input type="text" id="first_name" name="firstname" value="{$users.first_name}"
                                       maxlength="20"
                                       title="First Name" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="last_name" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.lastname}*:</label>

                            <div class="col-xs-12 col-sm-5 col-md-6">
                                <input type="text" id="last_name" name="lastname" value="{$users.last_name}"
                                       maxlength="20"
                                       title="Last Name" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="form-group">
                    <label for="about_me" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.aboutinprofile} *:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <textarea name="aboutme" id="about_me" class="form-control" cols="28" rows="5" title="About Me"
                                  maxlength="1000" required>{$users.aboutme}</textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="address_line1" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.addressline1}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <input type="text" id="address_line1" name="address1" placeholder="Enter your address line1"
                               class="form-control" value="{$users.address1}" title="Address Line 1" maxlength="50"
                               required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="address_line2" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.addressline2}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <input type="text" id="address_line2" name="address2" placeholder="Enter your address line2"
                               class="form-control" value="{$users.address2}" title="Address Line 2" maxlength="50">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="country" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.country}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                         <select name="country" id="country" class="form-control" required data-parsley-required-message="Choose Country">
                                                    <option value="" selected="selected">{$_phrase.select}{$_phrase.engspace}{$_phrase.country}</option>
                                                

                                                </select>
                    </div>
                </div>
            </div>
              <input type="hidden" name="hidden_country" id="hidden_country" value="{$users.country}">
                            <input type="hidden" name="hidden_state" id="hidden_state" value="{$users.state}">
            <div class="row">
                <div class="form-group">
                    <label for="state" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.state}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <select name="state" id="state" class="form-control" required
                                                   data-parsley-required-message="Choose state">
                                               <option value="" selected="selected">Select state</option>

                                           </select>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="form-group">
                    <label for="town" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.city}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <input type="text" id="town" name="city" placeholder="Enter city" class="form-control"
                               value="{$users.city}" title="city" maxlength="20" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="zipcode" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.zipcode}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <input type="text" id="zipcode" name="zip" placeholder="Enter zipcode" class="form-control"
                               value="{$users.zip}" title="Zipcode" maxlength="6" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="phone" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.phonenumber}*:</label>

                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <input type="text" id="phone" name="phone" placeholder="Eg: 0123123456, +919874563210"
                               class="form-control" value="{$users.phone}" title="Phone Number" maxlength="10" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="Categories" class="col-xs-12 col-sm-6 col-md-4">{$_phrase.select}{$_phrase.engspace}{$_phrase.categories} :</label>

                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <select class="form-control" name="categories[]" id="Categories" multiple="multiple">
                            {foreach $category as $key => $val}
                            <option value="{$val.id}"> {$val.aligned_name}</option>
                            {/foreach}
                        </select>
                        <!--  {foreach $category as $key => $val} <span class="w-100">
                          <input type="checkbox"  name="categories[]" value="{$val.id}"  class="m-left-6" />
                          <span class="p-left-5">{$val.name} </span> </span> {/foreach}--> </div>
                </div>
            </div>
            <!-- <div class="row">
               <label for="inputEmail" class="col-xs-12 col-sm-6 col-md-4">Photo:</label>
               <div class="col-xs-12 col-sm-6 col-md-8">

               </div>
             </div>-->
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4"></div>
                <div class="col-xs-12 col-sm-6 col-md-2">
                    <button class="btn save_btn">{$_phrase.save}</button>
                </div>
            </div>
        </form>
    </div>
</div>
{include file="common/footer-1.tpl" nocache}
<script src="{$config.url}/bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script>

    var initValues = '{$mcats}';
    var array = initValues.split(',');
    $('#Categories').val(array);
    /*$(':checkbox[name^="categories"]').each(function () {

     //alert($.inArray($(this).val(), initValues));
     $(this).prop("checked", ($.inArray($(this).val(), initValues) != -1));
     });*/

    $(function () {
        var ctry = '{$users.country}';
        if (ctry != '')
            $('#country').val(ctry);
        $('input[type=text]').each(function () {
            if ($(this).val() == 'null')
                $(this).val('');
        });
    });

    function triggerfile() {
        $("input[type='file']").trigger('click');
    }
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imageupload').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("input[type='file']").change(function () {
        readURL(this);
    })

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
        $.validator.addMethod('le', function (value, element, param) {
            return parseFloat(value) <= parseFloat($(param).val());
        });
        $.validator.addMethod('ge', function (value, element, param) {
            return parseFloat(value) >= parseFloat($(param).val());
        });
        $.validator.addMethod('greaterThanStartDate', function (value, element, param) {
            return moment(value, "MM/DD/YYYY HH:MM:SS") > moment($(param).val(), "MM/DD/YYYY HH:MM:SS");
        });
        $("#profile_settings").validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    maxlength: 50
                },
                firstname: "required",
                lastname: "required",
                acoutme: {
                    required: true,
                    range: [13, 23]
                },
                address1: {
                    required: true
                },
                address2: {
                    maxlength: 50
                },
                country: {
                    required: true
                },
                state: {
                    required: true,
                    maxlength: 20
                },
                city: {
                    required: true,
                    maxlength: 20
                },
                zip: {
                    required: true,
                    number: true,
                    maxlength: 6
                },
                phone: {
                    required: true,
                    number: true,
                    maxlength: 10
                }
            },
            messages: {
                email: {
                    required: "Enter Email address",
                    email: "Email address is required",
                    maxlength: "Enter not more than 50 character"
                },
                firstname: "Enter First name",
                lastname: "Enter Last name",
                aboutme: {
                    required: "Enter short detail about yourself",
                    range: "Enter more than 100 character and less than 1000 character"
                },
                address1: {
                    required: "Enter Address Line 1"
                },
                address2: {
                    required: "Choose Auction Type"
                },
                country: {
                    required: "Choose Country"
                },
                state: {
                    required: "Enter state",
                    maxlength: "State name cannot exceed 20 character limit"
                },
                city: {
                    required: "Enter city",
                    maxlength: "City name cannot exceed 20 character limit"
                },
                zip: {
                    required: "Enter Zip code",
                    number: "Enter only number",
                    maxlength: "Zip code name cannot exceed 6 character limit"
                },
                phone: {
                    required: "Enter phone number",
                    number: "Enter only number",
                    maxlength: "Enter no more than 10 digits"
                }
            }
        });
    });
</script>

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
