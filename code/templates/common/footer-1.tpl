</div>

<footer class="ftrwt gtfot">
    <div class="fotdi ftmdpro" style="padding-bottom:0; padding-top:0;">
        <div class="container">
            <div class="row">
                <div class="col-md -12">

                    <div class="col-xs-12 col-sm-6 col-md-5 footer_logo">

                        <a href="{$config.url}">
                            <img class="img-responsive vihi" src="{$config['url']}/image/logo.png"/>
                            <img class="img-responsive vivi" src="{$config['url']}/image/logo_1.png"/>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-3 col-md-2">
                        <h5 class="ftw500 his3">Company</h5>
                        <ul>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/about">About</a>
                            </li>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/contact">Contact</a>
                            </li>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/news">News</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-sm-3 col-md-2">
                        <h5 class="ftw500 his3">Services</h5>
                        <ul>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/how_it_works">How it Works</a>
                            </li>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/reviews">Reviews</a>
                            </li>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/dispute">Dispute</a>
                            </li>
                            <li>
                                <a class="alg_reg light_blck ftw500 wht3" href="/faq">FAQ</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-3 call_us">
                        <div class="lcall_us mftp mnm2">{$_phrase.contact_us}</div>
                        <div class="cu_num  cror3f">972-200-5516</div>
                        <div class="cror3fec">support@auctionsoftware.com</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container copyright text-center">
        <div class="row">
            <div class="">© AuctionSoftware.com 2014-2015, All rights reserved</div>
        </div>
    </div>
</footer>


<div class="ds modal fade  fcorn-register reg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-header csgray_box">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_buttons_register">x
        </button>
        <h4 class="modal-title blue_txt">Registration</h4>
    </div>


    <div class="form-wrapper">
        <div class="text-danger">{$register_error}</div>
        <form action="/register/save" method="POST" data-parsley-validate id="registerform"
              enctype="multipart/form-data" onsubmit="return checkTerms();" autocomplete="off">
            <input type="hidden" name="r_id" value="{$r_id}"/>
            <input type="hidden" name="do" id="do" value="quickregister_popup"/>
            <input type="hidden" name="email_exist" id="email_exist" value="0"/>
            <input type="hidden" name="user_exist" id="user_exist" value="0"/>
            <span id="form_proces_res" class="error_popup"></span>

            <div class="row">
                <div class="row">
                    <div class="col-md-6">
                        <label class="field prepend-icon">
                            <input type="text" name="first_name" id="first_name" class="gui-input"
                                   placeholder="First Name" data-parsley-required-message="Enter First Name"
                                   data-parsley-pattern="^[A-z ,.'-]+$"
                                   data-parsley-pattern-message="Special Characters are not allowed"
                                   data-required="true" data-parsley-group="block1" required>
                            <label for="first_name" class="field-icon"><i class="fa fa-user"></i></label>
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="field prepend-icon">
                            <input type="text" name="last_name" id="last_name" class="gui-input" placeholder="Last Name"
                                   data-parsley-required-message="Enter valid Last Name" data-required="true"
                                   data-parsley-pattern="^[A-z ,.'-]+$"
                                   data-parsley-pattern-message="Special Characters are not allowed"
                                   data-parsley-group="block1">
                            <label for="last_name" class="field-icon"><i class="fa fa-user"></i></label>
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <label class="field prepend-icon">
                            <input type="email" name="email" id="email_search" class="gui-input"
                                   placeholder="Email Address" data-parsley-required-message="Enter email address"
                                   data-parsley-type="email"
                                   data-parsley-type-message="Enter valid email address"
                                   data-required="true" onkeyup="check_userlist()" data-parsley-group="block1"
                                   required>
                            <label for="email_search" class="field-icon"><i class="fa fa-user"></i></label>
                        </label>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <label class="field prepend-icon">
                        <input type="password" name="password" id="passwordp" class="gui-input" placeholder="Password"
                               data-parsley-required-message="Enter Password" data-required="true"
                               data-parsley-maxlength="10"
                               data-parsley-maxlength-message="Password must be within 10 characters of length"
                               data-parsley-minlength="6"
                               data-parsley-minlength-message="Password must be at least 6 characters of length"
                               data-parsley-group="block1" required>
                        <label for="passwordp" class="field-icon"><i class="fa fa-lock"></i></label>
                    </label>

                </div>
                <div class="col-md-6">
                    <label class="field prepend-icon">
                        <input type="password" name="repassword" id="qpasswordp2" class="gui-input"
                               placeholder="Confirm Password" data-parsley-error-message="Please enter same password"
                               data-required="true" data-parsley-group="block1" data-parsley-equalto="#passwordp"
                               required>
                        <label for="qpasswordp2" class="field-icon"><i class="fa fa-lock"></i></label>
                    </label>

                </div>
            </div>
            <div class="row" align="center">
                <div class="col-md-12 register-toggle check_opt">
                    <label class="option">
                        <input type="checkbox" name="agree" value="1" id="agree">
                        <span class="checkbox"></span>I agree to the <a href="javascript: void(0)"
                                                                        onclick="popup('{$config[\'url\']}/terms')">Terms
                        &
                        Conditions</a>
                    </label>
                </div>
            </div>
            <div class="row" align="center">
                <div class="col-md-12">
                    <button type="button" class="btn btn-primary" id="join_deals"
                            onclick="$('#registerform').submit();">
                        Join AuctionSoftware.com
                    </button>
                </div>
            </div>
            <div class="row" align="center">
                <div class="col-md-12">
                    <a href="{$config.url}/login" onclick="alreadymember();">Already a member?</a>
                </div>
            </div>
            <div class="spacer-b30">
                <div class="tagline"><span>OR </span></div>
                <!-- .tagline -->
            </div>
            <div class="row social">
                <div class="col-md-1"></div>
                <div class="col-md-5"><a href="{$config.url}/facebook/auth/facebook"
                                         class="field prepend-icon btn btn-success">Login with facebook<label
                        class="field-icon"><i class="fa fa-facebook qzp1m"></i></label></a></div>
                <div class="col-md-5"><a href="{$config.url}/linked/auth/linkedin"
                                         class="field prepend-icon btn btn-info">Login with Linked in<label
                        class="field-icon"><i
                        class="fa fa-linkedin qzp1m"></i></label></a></div>
            </div>
        </form>

    </div>
</div>
<div class="ds modal fade fcorn-register" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-header csgray_box">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_buttons">x</button>
        <h4 class="modal-title blue_txt">Login</h4>
    </div>

    <div class="form-wrapper"> <!-- Form-wrapper only for positioning -->

        <div class="text-danger">{$login_error}</div>

        <span id="form_proces_res_1" class="error_popup"></span>

        <form action="{$config['url']}/login/save" method="post" data-parsley-validate enctype="multipart/form-data"
              id="loginform" autocomplete="off">

            <div class="row">

                <div class="col-md-12">
                    <label class="field prepend-icon">
                        <input class="form-control gui-input email" type="email" name="username"
                               value="{$remembermeuser}" data-parsley-required-message="Enter email address"
                               data-parsley-type="email"
                               data-parsley-type-message="Enter valid email address"
                               id="u_name" size="30" autocomplete="off" required data-trigger="change"
                               placeholder="Email Address">
                        <label for="u_name" class="field-icon"><i class="fa fa-envelope"></i></label>
                    </label>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="field prepend-icon">
                            <input type="password" name="password" id="u_pass" size="30" autocomplete="off"
                                   data-parsley-error-message="Enter password" required data-trigger="change"
                                   class="gui-input" placeholder="Password">
                            <label for="u_pass" class="field-icon"><i class="fa fa-lock"></i></label>
                        </label>

                    </div>
                </div>
                <div class="row option-group field">
                    <div class="col-md-6">
                        <label class="option">
                            <input type="checkbox" name="remember" checked="">
                            <span class="checkbox"></span>Remember Me
                        </label>
                    </div>
                    <div class="col-md-6 forget-pass"><a href="{$config.url}/login/forgot_password">Forgot Password?</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-primary" onclick="$('#loginform').submit();">Member Login
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <a href="{$config.url}/register">Not a member?</a>
                    </div>
                </div>
                <div class="spacer-b30">
                    <div class="tagline"><span>OR </span></div>
                    <!-- .tagline -->
                </div>
                <div class="row social">

                    <div class="col-md-6"><a href="{$config.url}/facebook/auth/facebook"
                                             class="field prepend-icon btn btn-success">Login with facebook<label
                            class="field-icon"><i class="fa fa-facebook qzp1m"></i></label></a></div>
                    <div class="col-md-6"><a href="{$config.url}/linked/auth/linkedin"
                                             class="field prepend-icon btn btn-info">Login with Linked in<label
                            class="field-icon"><i class="fa fa-linkedin qzp1m"></i></label></a></div>
                </div>
            </div>
        </form>

    </div>

</div>
<link rel="stylesheet" type="text/css" href="{$config.url}/css/footer.css"/>
<script src="{$config['externaljs']}common.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="{$config['url']}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript" src="{$config['externaljs']}register.js"></script>
<script src="{$config['url']}/js/owl.carousel.js"></script>
{foreach $external2js as $key => $val}
<script src="{$config['externaljs']}{$val}.js" type="text/javascript"></script>
{/foreach}
{if $register_fail == 1}
<script type="text/javascript">
    $(function () {
        $('#myModal').modal('show');
    });
</script> {/if}
{if $login_fail == 1}
<script type="text/javascript">
    $(function () {
        $('#login').modal('show');
    });
</script> {/if}

<script type="text/javascript">
    function popup(url) {
        params = 'width=500';//+screen.width;
        params += ', height=500';//+screen.height;
        params += ', top=0, left=0';
        params += ', scrollbars=yes, resizable=yes';

        newwin = window.open(url, 'windowname4', params);
        if (window.focus) {
            newwin.focus()
        }
        return false;
    }
</script>
</body>
</html>