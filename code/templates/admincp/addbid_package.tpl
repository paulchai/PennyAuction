{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Add Bid Packages</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Masters</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Add Bid Packages</div>
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
                <div class="row">
				<div class="col-md-3">Bid Name<span class="rstr">*</span></div>
				<div class="col-md-5">
					<input class="form-control"  />
				</div>
		 </div>
                 <div class="row">
                        <div class="col-md-3">Package Price<span class="rstr">*</span></div>
                        <div class="col-md-5">
                            <input class="form-control"  />
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
                

               
                <!-- /.row -->
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

$('#masterstabid').click();

</script>