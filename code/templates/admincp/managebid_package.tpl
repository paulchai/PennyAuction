{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Manage Bid Packages</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage Bid Packages</div>
        </div>
                <!-- Page Heading -->
                <!--<div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-settings"></i> {$action} 
                            </li>
                        </ol>
                    </div>
                </div>-->
                <!-- /.row -->
              <div class="ulgn_hd clearfix">
		<div class="pull-left">
			Manage Bid Packages
		</div>
		<div class="pull-right">
			<a href="{$config.url}/admincp/masters/addbid"><input type="button" class="btn btn-primary" value="Add" ></a>
		</div>
	 </div>
             <div class="row btbox users_alst">
               <div class="col-md-1">Select</div>
                <div class="col-md-1">S.No</div>
                <div class="col-md-2">Packages Name</div>
                <div class="col-md-2">Packages Price</div>
                <div class="col-md-1">Status</div>
                <div class="col-md-3">Packages Created Date</div>
                <div class="col-md-1">Edit</div>
                <div class="col-md-1">Delete</div>
             </div>
              <div class="row btbox1 users_alst">
              <div class="col-md-1">
                <input type="checkbox" />
              </div>
                <div class="col-md-1">1</div>
                <div class="col-md-2">Platinum Package</div>
                <div class="col-md-2"><i class="fa fa-euro"></i> 1000.00</div>
                <div class="col-md-1">Active</div>
                <div class="col-md-3">2015-04-30 07:20:20</div>
                <div class="col-md-1"><a><i class="fa fa-pencil-square-o"></i></a></div>
                <div class="col-md-1"><a><i class="fa fa-trash"></i></a></div>
             </div>
             <div class="ulgn_hd1">
                <div class="btm_txt">All</div>
                <div class="btm_txt">None</div>
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
                

               
                <!-- /.row -->
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

$('#masterstabid').click();

</script>