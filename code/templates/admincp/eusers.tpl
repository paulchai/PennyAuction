{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">
    <style type="text/css">
        .pro_image {
            border-radius: 3px;
            background-color: #FFF;
            box-shadow: 0px 0px 2px #ccc;
            text-align: center;
            line-height: 0;
            margin: 0px auto 0px;
            background-position: center center;
            background-size: cover;
            display: inline-block;
            width: auto;
            padding: 10px;
            height: auto;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;

            margin-left: 0;
        }

        .fileUpload input.upload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }

        span.w-100 {
            float: left;
            height: 48px;
            font-size: 14px;
        }
    </style>
    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Add User</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Users</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Add Users</div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    {if $error == 'saved'}
                    <div class="alert alert-success">
                        <strong>Saved!</strong> {$users.first_name} was successfully added.
                    </div>
                    {elseif $error != ''}
                    <div class="alert alert-danger">
                        <strong>{$error}</strong>
                    </div>
                    {/if}
                </div>
                <form class="admin_form" data-parsley-validate method="post"
                      enctype="multipart/form-data" action="{$config.url}/admincp/users/save">
                    <input type="hidden" value="{$users.id}" name="id"/>

                    <div class="col-lg-8">

                        <div class="form-group">

                            <label>Profile Pic</label>
                            <br/>

                            <div class="pro_image"><img
                                    src="{if $users.avatar == ''} {$config['imgpath']}no_img.png {else if $users.avatar != ''}{$config['imgpath']}profile/{$users.avatar}{/if}"
                                    width="82" title="{$users.first_name}" height="83" alt="{$val.title}"></a> </div>


                            <div class="fileUpload btn btn-primary redbg5"><span>Browse</span>
                                <input id="uploadBtn" type="file" class="upload" name="profile_image">
                            </div>


                            <!--input type="file" name="profile_image"-->
                        </div>

                        <div class="form-group">
                            <label>First Name</label>
                            <input class="form-control" placeholder="Enter First Name" value="{$users.first_name}"
                                   name="first_name" data-parsley-group="block1"
                                   data-parsley-error-message="Enter valid First Name" data-parsley-pattern="/^[A-z ,.'-]+$/i" required>
                        </div>


                        <div class="form-group">
                            <label>Last Name</label>
                            <input class="form-control" placeholder="Enter Last Name" value="{$users.last_name}"
                                   name="last_name" data-parsley-group="block1"
                                   data-parsley-error-message="Enter valid Last Name" data-parsley-pattern="^[A-z ,.'-]+$" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number:</label>

                            <input type="text" id="phone" name="phone" placeholder="Eg: 0123123456, +919874563210"
                                   class="form-control" value="{$users.phone}" data-parsley-maxlength="10"
                                   data-parsley-required-message="Enter Phone Name"
                                   data-parsley-maxlength-message="Enter valid Phone number" title="Phone Number"
                                   maxlength="20"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="username">User Name</label>
                            <input class="form-control" id="username" name="username" value="{$users.username}"
                                   data-parsley-group="block1" data-parsley-required-message="Enter User Name"
                                   data-parsley-pattern="/^[a-z0-9]+(?:[ _-][a-z0-9]+)*$/"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="email_address">Email</label>
                            <input class="form-control" id="email_address" name="email" type="email"
                                   value="{$users.email}"
                                   data-parsley-group="block1" data-parsley-required-message="Enter Email Name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="user_password">Password
                                <small>(leave empty to keep same)</small>
                            </label>
                            <input type="password" id="user_password" class="form-control" name="password"
                                   data-parsley-group="block1" data-parsley-maxlength="10"
                                   data-parsley-maxlength-message="Password must be within 10 characters of length"
                                   data-parsley-minlength="6"
                                   data-parsley-minlength-message="Password must be at least 6 characters of length">
                        </div>

                        <div class="form-group">
                            <label for="cpassword">Confirm Password</label>
                            <input type="password" class="form-control" id="cpassword" name="cpassword"
                                   data-parsley-group="block1"
                                   data-parsley-equalto="#user_password"
                                   data-parsley-equalto-message="Please enter same password">
                        </div>
                        <div class="form-group">
                            <label for="address_line1">Address Line 1:</label>

                            <input type="text" id="address_line1" name="address1" placeholder="Enter your address line1"
                                   class="form-control" value="{$users.address1}" title="Address Line 1" maxlength="50"
                                   data-parsley-required-message="Enter Address"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="address_line2">Address Line 2:</label>

                            <input type="text" id="address_line2" name="address2" placeholder="Enter your address line2"
                                   class="form-control" value="{$users.address2}" title="Address Line 2" maxlength="50">
                        </div>

                        <div class="form-group">
                            <label for="country">Country:</label>
                            <p>
                                {$users.country}
                            </p>

                            <select name="country" id="country" class="form-control" required
                                    data-parsley-required-message="Choose Country">
                                <option value="" selected="selected">Select Country</option>
                                {foreach $config.countries as $key => $val}
                                <option value="{$val.name}" {if $users.country==$val.name} selected {/if} attr="{$val.location_id}">{$val.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="state">State:</label>

                            <input type="text" id="state" name="state" placeholder="Enter state" class="form-control"
                                   value="{$users.state}" title="State" maxlength="20" required
                                   data-parsley-required-message="Enter state">
                        </div>
                        <div class="form-group">
                            <label for="town">City:</label>

                            <input type="text" id="town" name="city" placeholder="Enter city" class="form-control"
                                   value="{$users.city}" title="city" maxlength="20" required
                                   data-parsley-required-message="Enter City">
                        </div>
                        <div class="form-group">
                            <label for="zipcode">Zipcode:</label>

                            <input type="text" id="zipcode" name="zip" placeholder="Enter zipcode" class="form-control"
                                   value="{$users.zip}" title="Zipcode" maxlength="10" data-parsley-maxlength="6"
                                   required data-parsley-required-message="Enter Zipcode"
                                   data-parsley-maxlength-message="Enter valid Zipcode">
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" data-parsley-group="block1" required>
                                <option value="active" {if $users.status=='active'} selected {/if}>Active</option>
                                <option value="moderate" {if $users.status=='moderate'} selected {/if}>Moderate</option>
                                <option value="deactivate" {if $users.status=='deactivate'} selected {/if}>Deactivate</option>
                                <option value="unsubscribe" {if $users.status=='unsubscribe'} selected {/if}>Unsubscribe</option>
                                <option value="unverified" {if $users.status=='unverified'} selected {/if}>Unverified</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="about_me">About me</label>
                            <textarea class="form-control" id="about_me" rows="3" name="aboutme"
                                      data-parsley-group="block1" required
                                      data-parsley-required-message="A short note to describe yourself">{$users.aboutme}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="categories">Select Categories you are interested:</label>
                        </div>
                        <div class="form-group">
                            {foreach $category as $key => $val}
                            <span class="col-sm-3 w-100">
                                <input type="checkbox" id="categories" name="categories[]" value="{$val.id}"
                                       class="m-left-6"/>
                                <span class="p-left-5">{$val.name} </span>
                            </span>
                            {/foreach}
                        </div>
                        <div class="col-md-12" style="padding-top:15px;">
                            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#usertabid').click();
    var initValues = [{$mcats}];
    //alert(initValues);
    $(':checkbox[name^="categories"]').each(function () {
        //alert($.inArray($(this).val(), initValues));
        $(this).prop("checked", ($.inArray(parseInt($(this).val()), initValues) != -1));
    });

    $(function () {
        var ctry = '{$users.country}';
        if (ctry != '')
            $('#country').val(ctry);
    });
</script>