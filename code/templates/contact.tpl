{include file="common/header-1.tpl" nocache} 
<style>
.gray_box {
  height: 238px;
  -webkit-border-radius: 23px/20px;
  -moz-border-radius: 23px/20px;
  border-radius: 23px/20px;
  background-color: #f1f1f1;
  margin-top: 10px;
  padding: 20px;
}
.gray_box h5 {
  font-size: 22px;
  font-weight: 700;
}
.btn-warning {
  color: #fff;
  background-color: #fe5a01;
  border-color: #fe5a01;
}
.bget_started{
	width: 150px;
  height: 33px;
  -webkit-border-radius: 4px/5px 5px 6px 6px;
  -moz-border-radius: 4px/5px 5px 6px 6px;
  border-radius: 4px/5px 5px 6px 6px;
  font-weight: 700;
}
body{
     font-family: 'Open Sans' !important;	
}
.ft25 {
    font-size: 26px;
    font-weight: bold;
}
</style>
<div class="row">
		<div class="col-md-12 about_us">
        <div class="col-md-3" style="margin-top: 45px;">
        <div class="premi2"><a href="/about">{$_phrase.about}{$_phrase.engspace}{$_phrase.us}</a></div>
        <div class="premi2"><a href="/how_it_works">{$_phrase.howpennyauctionwork}</a></div>
        <div class="premi2"><a href="/faq">{$_phrase.faq}{$_phrase.s}</a></div>
        <div class="premi2"><a href="/contact" class="active2">{$_phrase.contact}{$_phrase.engspace}{$_phrase.us|upper}</a></div>
        </div>
        
        <div class="contact_us_wrap col-md-9">
        <div class="col-md-7">
        <div class="ft25 title_about">{$_phrase.contact}{$_phrase.engspace}{$_phrase.us}</div>
        <div style="margin-bottom:10px;">{$_phrase.wedlovetohearfromyou}{$_phrase.engspace}{$_phrase.whatsonyourmind}</div>
        <form>
        <div class="row">
					<div class="col-md-6">
						<label class="alg_reg reg_lbl">{$_phrase.name}</label>
						<input class="form-control" type="text" data-parsley-id="3005">
					</div>
				</div>
                
                <div class="row">
					<div class="col-md-6">
						<label class="alg_reg reg_lbl">{$_phrase.email}{$_phrase.engspace}{$_phrase.address}</label>
						<input class="form-control" type="text" data-parsley-id="3005">
					</div>
				</div>
                
                
                <div class="row">
					<div class="col-md-6">
						<label class="alg_reg reg_lbl">{$_phrase.subject}</label>
						<input class="form-control" type="text" data-parsley-id="3005">
					</div>
				</div>
                
                <div class="row">
					<div class="col-md-12">
						<label class="alg_reg reg_lbl">{$_phrase.message}</label>
						<textarea class="form-control" cols="33"  rows="5" ></textarea>
					</div>
				</div>
                
                <div class="row" style="margin-top:15px;">
					<div class="col-md-12">
						<div class="alg_reg" style="padding-bottom:25px;">
							<input name="contact_email[email_copy]" type="hidden" value="0"><input as="boolean" id="contact_email_email_copy" name="contact_email[email_copy]" type="checkbox" value="1" data-parsley-multiple="contact_emailemail_copy" data-parsley-id="9634">
							{$_phrase.Emailacopyofthismessage}</div><ul class="parsley-errors-list" id="parsley-id-multiple-contact_emailemail_copy"></ul>
							<input class="btn btn-primary bget_started" name="commit" type="submit" value="Submit">		
						</div>
					</div>     
                    </form>   
        </div>        
        
        
        <div class="col-md-5">
        
        <div class="gray_box">

						<h5 class="gotham_medium light_blck  clrorg">{$_phrase.email}</h5><br>
						<a href="#" class="qmzw">support@auctionsoftware.com</a>
						<h5 class="gotham_medium light_blck">{$_phrase.phone}</h5>
						<div>972-200-5516</div>
					</div>
        </div>
        
        
        </div>
        
        
        </div>
			
	</div>
	{include file="common/footer-1.tpl" nocache}