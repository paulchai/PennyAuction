{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Manage Vouchers</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage Vouchers</div>
        </div>
               <div class="ulgn_hd clearfix">
		<div class="pull-left">
			Manage Voucher
		</div>
		<div class="pull-right">
			<a href="{$config.url}/admincp/masters/addvoucher"><button class="btn btn-primary">
				Add
			</button></a>
		</div>
	 
	 </div>
             <div class="row btbox">
                <div class="col-md-1">Select</div>
                <div class="col-md-1">S.No </div>
                <div class="col-md-2">Coupon Code</div>
                <div class="col-md-2">Voucher Group Name</div>
                <div class="col-md-1">Voucher Amount</div>
                <div class="col-md-1">Status</div>
                <div class="col-md-1">Voucher Used</div>
                <div class="col-md-1">Expiry Date</div>
                <div class="col-md-1">Edit</div>
                <div class="col-md-1">Deleted</div>
             </div>
              <div class="row btbox1">
                <div class="col-md-1"><input type="checkbox" class="checkbox" /></div>
                <div class="col-md-1">1</div>
                <div class="col-md-2">0122178755
                </div>
                <div class="col-md-2">
                    Rada A-1
                </div>
                <div class="col-md-1">100</div>
                <div class="col-md-1">Active</div>
                <div class="col-md-1">Unused</div>
                <div class="col-md-1">
                    <div>0000-00-00</div>
                    <div>00:00:00</div>
                </div>
                <div class="col-md-1"><a><i class="fa fa-pencil-square-o"></i></a></div>
                <div class="col-md-1"><a><i class="fa fa-envelope"></i></a></div>
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
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

$('#masterstabid').click();

</script>