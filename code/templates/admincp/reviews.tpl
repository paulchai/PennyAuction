{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Reviews</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Users</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Reviews</div>
        </div> 
                <!-- Page Heading -->
                
                <!--<div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> reviews
                            </li>
                        </ol>
                    </div>
                </div>-->
                <!-- /.row -->

                <div class="row">
                  
                 
                </div>    
                
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Subject</th>
                                        <th>Message</th>
                                        <th>Date Added</th>
                                        <th>Rating</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $review as $key => $val}   
                                    <tr>
                                        <td>{$val.first_name} {$val.last_name}</td>
                                        <td>{$val.subject}</td>
                                        <td>{$val.message}</td>
                                        <td>{$val.date_add}</td>
                                        <td>{$val.rating}</td>
                                        <td><a onclick="PopupBox('{$config.url}/admincp/reviews/delete/{$val.id}','Are you sure to delete?');"
                   href="javascript:void(0)" > Delete</a></td>
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>

               
                <!-- /.row -->
</div>
     </div>
     </div>      
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
$('#generaltabid').click();
</script>