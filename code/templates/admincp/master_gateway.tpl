{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Manage Payment Gateways</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Manage Payment Gateways</div>
        </div>
              <div class="ulgn_hd">Payment Gateways</div>
             <div class="row btbox">
                <div class="col-md-1">S.No</div>
                <div class="col-md-2">Action</div>
                <div class="col-md-3">Name</div>
                <div class="col-md-4">Payment Description</div>
                <div class="col-md-2">Method</div>
             </div>
              <div class="row btbox1">
                <div class="col-md-1">1</div>
                <div class="col-md-2">
                    <a>
                        <i class="fa fa-pencil-square-o"></i>
                    </a>
                </div>
                <div class="col-md-3">Paypal</div>
                <div class="col-md-4">Auction script payments gateways added</div>
                <div class="col-md-2">sandbox</div>
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