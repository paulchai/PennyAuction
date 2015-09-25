{include file="common/header-1.tpl" nocache}
<div class="container">
  <div class="banner_inner">
    <div class="banner_inner">
      <div class="login_head">
      
   {if $textStatus != ''}   <div class="dash_heads">
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
      
      
        <ul>
          <li><a href="{$config['url']}" title="HOME">Home </a></li>
          <li><a href="" title="arr_bg"><img src="http://unieauction.com/platinum-demo/public/white/images/arr_bg.png" width="13" height="11" alt="Arrow" /></a></li>
          <li class="active"><a  title="SIGN IN">Sign in</a></li>
        </ul>
      </div>
      
      {if $step1}
      <form action="/login/forgot_password" method="post" accept-charset="utf-8" data-parsley-validate required>
        <div class="login-part">
          <h2 title="Forgot Password">Forgot Password</h2>
        </div>
        <div class="login_middle">
          <div class="login_lft">
            <div class="login_form">
              <div class="log_fields">
                <p>Your Email <span class="red">*</span>:</p>
                <input type="email" id="email" name="email" placeholder="Enter your email" value="" maxlength="30" class="textbox" required/>
              </div>
              <span class="red"></span> </div>
            <div class="login_button">
                <input type="submit" name="submit_forgot_password" class="btn save_btn" value="Send" title="Send"/>
              </div>
                      </div>
          </div>
        </div>
      </form>
      {/if}
      
      {if $step2}
      <form action="/login/changepassword" method="post" id="change_password" name="change_password" accept-charset="utf-8" data-parsley-validate>
        <input type="hidden" name="id" value="{$id}" />
        <div class="login_middle_common_profil">
          <div class="user_name_common">
            <div class="log_fields">
              <p>New Password <span class="red">*</span>:</p>
              <h2>
                <input type="password" id="new_password" name="new_password" title="New Password" maxlength="20" required >
              </h2>
            </div>
            <span class="red"> </span> </div>
          <div class="user_name_common">
            <div class="log_fields">
              <p>Confirm Password <span class="red">*</span>:</p>
              <h2>
                <input type="password" id="new_password" name="confirm_password" title="Confirm Password" maxlength="20" required data-parsley-equalto="#new_password">
              </h2>
            </div>
            <span class="red"> </span> </div>
          <div class="user_name_common">
            <div class="no_img">
              <div class="buton_green">
                <div class="profil_butoon">
                  <div class="res_left"></div>
                  <div class="res_mid"><a title="RESET">
                    <input type="submit" name="submit_user" value="RESET">
                    </a></div>
                  <div class="res_right"></div>
                </div>
                <span> </span>
                <div class="grand_total_btn_cp">
                  <div class="save_left"></div>
                  <div class="save_mid"><a title="SAVE">
                    <input type="submit" name="submit_change_pass" value="SAVE">
                    </a></div>
                  <div class="save_right"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
      {/if} </div>
    <div class="user" style="display:none;" ></div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache}