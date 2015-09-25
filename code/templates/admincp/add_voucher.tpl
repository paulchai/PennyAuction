{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Add Voucher</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Add Voucher</div>
        </div>
            <div class="row">
		<div class="col-md-12">
			<div class="mm_btxt">Upload a bid package (Fileupload will be incompressed .zip format).</div>
			<div class="mm_btxt">Make sure the sql pack, js file and zip pack has tobe in same module name.</div>
			<div class="grn_tb"><strong>Need 777(Full write) Permission for specific folder to update Package.</strong></div>
			<div class="grn_tb">1. modules/</div>
			<div class="grn_tb">2. public/</div>
			<div class="grn_tb">application/bootstrap.php</div>
		</div>
	 </div>	
	 
            
             <div class="row">
                 <div class="col-md-3"></div>
                 <div class="col-md-5">
                 <div><input type="file" /></div>
                    <select class="form-control selct_mm">
                        <option>Bid Package</option>
                        <option>Other Package</option>
                    </select>
                    <div class="row">
                                <div class="col-md-4"><a href="{$config.url}/admincp/masters/addbid"><button class="btn btn-primary">Add Package </button></a></div>
                            </div>
                 </div>
             </div>
            <div class="row">
				<div class="col-md-3">Voucher Group<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  />
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Voucher code<span class="rstr">*</span></div>
				<div class="col-md-5">
					<div><input class="form-control"  /></div>
					<div class="gry_txt">Voucher Prefix.example:ONCT</div>
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Voucher Price<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  />
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Number of Vouchers<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  />
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Expiry Date<span class="rstr">*</span></div>
				<div class="col-md-5">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					<input class="form-control"  />
				</div>
				</div>
		 </div>
		 <div class="row">
				<div class="col-md-3">Status<span class="rstr">*</span></div>
				<div class="col-md-5">
					<div><input type="checkbox"  /></div>
					<div class="rstr">* Required Fields</div>
					<div class="row">
						<div class="col-md-2"><button class="btn btn-primary">Back</button></div>
						<div class="col-md-2"><button class="btn">Reset</button></div>
						<div class="col-md-2"><button class="btn btn-success">Add</button></div>
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