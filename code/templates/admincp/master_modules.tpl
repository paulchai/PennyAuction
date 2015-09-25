{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Manage Modules</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage Modules</div>
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
             <div class="ulgn_hd clearfix">
                <div class="pull-left">
                    Manage Modules
                </div>
                
             </div>
             <div class="row btbox users_alst">
                <div class="col-md-3">S.No</div>
                <div class="col-md-3">Module Name</div>
                <div class="col-md-3">Module Type</div>
                <div class="col-md-3">Module Status</div>
             </div>
              <div class="row btbox1 users_alst">
                <div class="col-md-3">1</div>
                <div class="col-md-3">Beginner</div>
                <div class="col-md-3">Bid Package</div>
                <div class="col-md-3">
                    <button class="btn btn-primary">Uninstall</button>
                </div>
             </div>
             <div class="ulgn_hd1">
                <div class="btm_txt">All</div>
                <div class="btm_txt">None</div>
                <div class="btm_txt">Active</div>
                <div class="btm_txt">Inactive</div>
                <div class="btm_txt">
                    <select>
                        <option>More Auction</option>
                        <option>Delete</option>
                    </select>
                </div>
                <div class="pull-right">
                    <div class="btm_txt">Displayed 1-15 of 42</div>
                    <div class="btm_txt">
                        <ul class="pagination">
                                <li>
                                  <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                  </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                  <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                </li>
                              </ul>
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