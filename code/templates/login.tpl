{include file="common/header-1.tpl" nocache}
<div class="row">
<style>
.container {
  width: auto;
  max-width: 1170px;
}
.login_account {
  width: auto;
  float: left;
  padding-bottom: 42px;
  margin-top: 10px;
}
.login_account p {
  width: auto;
  float: left;
  text-align: center;
  font: normal 12px Arial, Helvetica, sans-serif;
  color: #666666;
  padding: 5px 0px 10px 28px;
}
.login_rgt {
  width: auto !important;
  float: left;
  background: url('../images/log_divide.png') left top no-repeat;
  padding-top: 27px;
  min-height: 344px;
}
.padle{
	padding-left:0;
}
</style>
 
  <!-- LOGIN STARTS!-->
  <div class="col-md-12">
  <div class="login_middle  m-top-50">
  <div class="col-md-6">
    <div class="login_lft">
      <form action="{$config['url']}/login/save" method="post"  enctype="multipart/form-data"   data-parsley-validate >
        <div class="login_form">
          <div class="log_fields">
            <p>{$_phrase.username} <span class="red">*</span>:</p>
            <div class="col-md-8 padle">
            <input id="username" name="username" data-parsley-error-message="Enter user name" value="{$remembermeuser}" required placeholder="Enter user name"  class="form-control" style="height:auto;width:204px"></div>
          </div>
          <span class="red fl"></span>
          <div class="log_fields">
            <p>{$_phrase.password} <span class="red">*</span>:</p>
            <div class="col-md-8 padle">
            <input type="password" id="password" name="password" data-parsley-error-message="Enter password" required value=""  class="form-control" style="height:auto;width:204px">
          </div></div>
        </div>
        <span class="red fl"></span>
        <div class="login_check">
          <input type="checkbox" name="remember" value="1">
          <p class="remeber">Remember me</p>
          <label><a href="{$config['url']}/login/forgot_password" title="Forgot password">{$_phrase.forgot}{$_phrase.engspace}{$_phrase.password}?</a></label>
        </div>
      
           <div style="clear: both;">  <input type="submit" name="login" value="Signin" class="btn save_btn" title="SIGNIN"></div>
         
        <div style="padding-top: 10px; float:left"> <span class="Loading_Img" style="display:none">
          <p style="width:195px; padding-left: 0px; color:black;font: bold 13px/16px arial;"> <img src="http://unieauction.com/platinum-demo/public/white/images/ajax-loader.gif" alt="loading"> <strong class="pls_wit" style="padding-top:0px; float:right; margin: -14px 90px;"> Processing... </strong> </p>
          </span> </div>
      </form>
    </div>
    </div>
     <div class="col-md-6">
    <div class="login_rgt">
      <!--<div class="login-social">
        <p>Login With</p>
      </div>
      <div class="login_net">
        <ul>
          <li><a href="#" title="Login with facebook"><img src="{$config['dpath']}images/f_connect.png" alt="Login with facebook"></a></li>
          <li><a href="#" title="Twitt-connect"><img src="{$config['dpath']}images/twitt_connect.png" alt="Twitt-connect"></a> </li>
        </ul>
      </div>
      <span class="other">
      <label>(OR)</label>
      </span>-->
     
      <div class="login_account text-center">
        <h2>Don't have an account</h2>
        <p>Register now to bid, buy, or sell on any Auction site worldwide. It's easy and FREE. <!--Already registered--></p>
        <p>If you want to sign in, you'll need to register first.</p>
        <p>Registration is fast and FREE.</p>
       <a href="{$config.url}/register" title="Register" class="btn save_btn">Register</a>
      </div></div>
    </div>
  </div>
  <!-- LOGIN ENDS!--> 
  </div>
</div>

{include file="common/footer-1.tpl" nocache}