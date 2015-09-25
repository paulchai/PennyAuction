{include file="common/header-1.tpl" nocache}
<style>
.log_fields input[type=text], .log_fields input[type=password]{
	width:100%;
	height:34px;
}
.login_head{
	border-bottom:none;
}
.frpw1{
	min-height:400px;
}
.login_middle {
    background: url('../images/sing.png') repeat-x;
    width: 50%;
    height: 220px;
    float: left;
    border: 1px solid #dedddf;
	    padding-left: 80px;
    padding-top: 26px;
}
.login_lft {
    width: 315px;
    float: left;
    padding: 10px 0 0 20px;
}
.login_form {
        width: 97%;
    float: left;
}
.login_head {
    width: 100%;
    float: left;
    padding-bottom: 10px;
   }
</style>
<div class="container frpw1">
<div class="banner_inner">
  <div class="banner_inner">
    <div class="login_head"> {if $textStatus != ''}
      <div class="dash_heads">
        <div class="span-22a">
          <center>
            <div id="messagedisplay">
              <ul id="message" class="success_msg">
                <li>
                  <p>{$textStatus}</p>
                </li>
              </ul>
            </div>
          </center>
        </div>
      </div>
      {/if}
      
      
      
      
      {if $step1}
      <form action="/login/forgot_password" method="post" accept-charset="utf-8" data-parsley-validate required>
        <div class="login-part text-center">
          <h2 title="Forgot Password">Forgot Password</h2>
        </div>
        
        <div class="login_middle bidonregi1">
          <div class="login_lft">
            <div class="login_form">
              
                <p>Your Email <span class="red">*</span>:</p>
                <input type="email" id="email" name="email" placeholder="Enter your email" data-parsley-error-message="Enter valid email address" value="" maxlength="100" class="form-control bidonregi2" required/>
              </div>
              </div>
            <div class="m-top-30"><input type="submit" name="submit_forgot_password" value="Send" title="Send" class="btn btn-success bidonregi2"/></div>
          
        </div>
      </form>
      {/if}
      
      {if $step2}
      <form action="/login/changepassword" method="post" id="change_password" name="change_password" accept-charset="utf-8" data-parsley-validate>
        <input type="hidden" name="id" value="{$id}" />
        <div class="col-md-12">
        <div class="login_middle_common_profil" style="padding-left:0;">
          <div class="user_name_common">
           <div class="col-md-4">
              <p>New Password <span class="red">*</span>:</p></div>
              <div class="col-md-6">
                <input type="password" id="new_password" name="new_password" title="New Password" maxlength="20" class="form-control"  required >
              </div>
            </div>
            <span class="red"> </span> </div>
            </div>
            
            <div class="col-md-12">
          <div class="user_name_common">
            <div class="log_fields">
            <div class="col-md-4">
              <p>Confirm Password <span class="red">*</span>:</p></div>
              <div class="col-md-6">
                <input type="password" id="new_password" name="confirm_password" title="Confirm Password" class="form-control"  maxlength="20" required data-parsley-equalto="#new_password" >
              </div>
            </div>
            <span class="red"> </span> </div>
            </div>
            <div class="col-md-12">
          <div class="user_name_common">
            <div class="no_img">
              <div class="buton_green">
                <div class="profil_butoon">
                <div class="col-md-1"></div>
                <div class="col-md-9">
                <div class="col-md-6"> <button type="reset" class="btn btn-primary">RESET</button></div>
                                  
                <span> </span>
                <div class="col-md-2"><input type="submit" name="submit_change_pass" value="SAVE"  class="btn btn-success" ></div>
                </div></div>
              
            </div>
          </div>
        </div>
        </div>
      </form>
      {/if} </div>
    <div class="user" style="display:none;" ></div>
  </div>
</div> </div>
{include file="common/footer-1.tpl" nocache}