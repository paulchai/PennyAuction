{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Manage Email Templates</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage Email Templates</div>
        </div>
              <div class="aw_thead">Forgot Password</div>
			<div class="aw_thead">We will send this mail, when user submit the forgot password form.</div>
	
	
		<div class="row">
				<div class="col-md-3">From<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  placeholder="###FROM_EMAIL###"/>
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Reply To<span class="rstr">*</span></div>
				<div class="col-md-5">
					<div><input class="form-control"  placeholder="###TO_EMAIL###" /></div>
					<div class="gry_txt">Voucher Prefix.example:ONCT</div>
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Subject<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  />
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Email Content<span class="rstr">*</span></div>
				
				<div class="col-md-7">
					<div>
						<textarea rows="4" class="form-control"></textarea>
					</div>
					<div class="gry_txt">
						FROM_EMAIL,TO_MAIL,SITE_NAME,USERNAME,NEW_PASSWORD,SITE_LINK
					</div>
					<div class="rstr">* Required Fields</div>
					<div class="row">
						<div class="col-md-2"><button class="btn btn-primary">Back</button></div>
						<div class="col-md-2"><button class="btn">Reset</button></div>
						<div class="col-md-2"><button class="btn btn-success">Update</button></div>
					</div>
				</div>
		 </div>
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

$('#masterstabid').click();

</script>