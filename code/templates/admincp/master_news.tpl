{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">News</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage News</div>
        </div>
               <div class="ulgn_hd clearfix">
		<div class="pull-left">
			Manage News
		</div>
		<div class="pull-right">
			<button class="btn btn-primary">
				Add
			</button>
		</div>
	 
	 </div>
             <div class="row btbox">
                <div class="col-md-1">Select</div>
                <div class="col-md-1">S.No </div>
                <div class="col-md-2">News Title</div>
                <div class="col-md-3">News Description</div>
                <div class="col-md-1">Status</div>
                <div class="col-md-2">Created Date</div>
                <div class="col-md-1">Edit</div>
                <div class="col-md-1">Delete</div>
             </div>
              <div class="row btbox1">
            <div class="col-md-1"><input type="checkbox" /></div>
                <div class="col-md-1">1</div>
                <div class="col-md-2">Variations</div>
                <div class="col-md-3">There are many variation</div>
                <div class="col-md-1">Active</div>
                <div class="col-md-2">
                    <div>2015-04-30</div>
                    <div>08:13:00</div>
                </div>
                <div class="col-md-1"><a><i class="fa fa-pencil-square-o"></i></a>
                </div>
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
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

$('#masterstabid').click();

</script>