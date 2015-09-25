<div class="ds modal fade fcorn-register reg" id="reg_myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header csgray_box">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_buttons_register">x</button>
    <h4 class="modal-title blue_txt">Registration</h4>
  </div>
 <form action="/register/save" method="POST" data-parsley-validate  id="registerform" enctype="multipart/form-data" onsubmit="return checkTerms();">
      	  <input type="hidden" name="r_id" value="{$r_id}" />
          <input type="hidden" name="do" id="do" value="quickregister_popup" />
         <input type="hidden" name="email_exist" id="email_exist" value="0" />
         <input type="hidden" name="user_exist" id="user_exist" value="0" />
    <div class="form-wrapper">    <div class="text-danger text-center">{$register_error}</div>
      <div class="row">
        <div class="row">
          <div class="col-md-6">
            <label class="field prepend-icon">
             <input type="text" name="first_name" id="first_name" class="gui-input" placeholder="First Name" data-required="true"   data-parsley-group="block1" required>
            <label for="firstname" class="field-icon"><i class="fa fa-user"></i></label>
            </label>
          </div>
          <div class="col-md-6">
            <label class="field prepend-icon">
            <input type="text" name="last_name" id="last_name" class="gui-input" placeholder="Last Name" data-required="true" data-parsley-group="block1" required>
            <label for="lastname" class="field-icon"><i class="fa fa-user"></i></label>
            </label>
          </div>
        </div>
        <div class="row">
          <!--<div class="col-md-6">
            <label class="field prepend-icon">
            <input type="text" name="username" id="username_search" class="gui-input" placeholder="User Name" data-required="true" onkeyup=" check_userlist()">
            <label for="username" class="field-icon"><i class="fa fa-user"></i></label>
            </label>
          </div>-->
          <div class="col-md-12">
					<label class="field prepend-icon">
                                    <input type="email" name="email" id="email_search" class="gui-input" placeholder="Email Address" data-required="true" onkeyup=" check_userlist()" data-parsley-group="block1" required>
                                    <label for="username" class="field-icon"><i class="fa fa-user"></i></label>  
                     </label>
					
					</div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <label class="field prepend-icon">
          <input type="password" name="password" id="passwordp" class="gui-input" placeholder="Password" data-required="true" data-parsley-group="block1" required>
          <label for="password" class="field-icon"><i class="fa fa-lock"></i></label>
          </label>
        </div>
        <div class="col-md-6">
          <label class="field prepend-icon">
         <input type="password" name="repassword" id="qpasswordp2" class="gui-input" placeholder="Confirm Password" data-required="true" data-parsley-group="block1" data-parsley-equalto="#passwordp" required>
          <label for="password" class="field-icon"><i class="fa fa-lock"></i></label>
          </label>
        </div>
      </div>
      <div class="row" align="center">
        <div class="col-md-12 register-toggle check_opt">
					<label class="option">
					<input type="checkbox" name="agree"  value="1" id="agree">
				   <span class="checkbox"></span>I agree to the <a href="" target="_blank">Terms & Conditions</a>
			  </label>
				</div>
      </div>
      <div class="row" align="center">
        <div class="col-md-12">
          <button type="button" class="btn btn-primary" id="join_deals" onclick="$('#registerform').submit();" >Join Bidconneqt</button>
        </div>
      </div>
      <div class="row" align="center">
        <div class="col-md-12"> <a href="javascript:void(0);" onclick="alreadymember();">Already a member?</a> </div>
      </div>
      <div class="spacer-b30">
        <div class="tagline"><span>OR </span></div>
        <!-- .tagline --> 
      </div>
      <div class="row social">
        <div class="col-md-6">
          <button type="button"  class="field prepend-icon btn btn-success" onclick="window.location='{$config.url}/facebook/auth/facebook'">
          Login with facebook

          <label for="lastname" class="field-icon"><i class="fa fa-facebook"></i></label>
          </button>
        </div>
        <div class="col-md-6">
          <button type="button"  class="field prepend-icon btn btn-info" onclick="window.location='{$config.url}/linked/auth/linkedin'">
          Login with Linked in
          <label for="lastname" class="field-icon"><i class="fa fa-linkedin"></i></label>
          </button>
        </div>
      </div>
    </div>
  </form>
</div>