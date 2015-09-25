{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Email Template</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Users</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Email Template</div>
        </div>
                <!-- Page Heading -->
                
                <!--<div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> Blog
                            </li>
                        </ol>

                    </div>
                </div>-->
                <!-- /.row -->

                <div class="row">
                  <div class="col-lg-12">
                    <a href="{$config.url}/admincp/email/new" class="btn btn-success">Add</a>
                  </div>

                </div>

                <div class="row">

                    <div class="col-lg-12"> {if $error == 'deleted'}
                        <div class="alert alert-success"> Email was deleted successfully. </div>

                        {/if}

                    {if $error == 'saved'}
                    <div class="alert alert-success"> Email was added successfully. </div>

                    {/if}

                        {if $error == 'edited'}
                        <div class="alert alert-success"> Email was edited successfully. </div>

                        {/if}
                    </div>

                </div>

                <div class="row">
                  <div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Event</th>
                                        <th>Subject</th>
                                        <!--<th>Message</th>-->
                                        <th>Created Date</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                {if $emails >= 1}

                                {foreach $email as $key => $val}
                                <tr>
                                    <td>{$val.event}</td>
                                    <td>{$val.subject}</td>
                                    <!--<td>{$val.description_short}..</td>-->
                                    <td>{$val.date_add}</td>
                                    <td><a href="{$config.url}/admincp/email/edit/{$val.id}"><i class="fa fa-edit"></i>Edit</a></td>
                                    <td><a href="javascript:void(0);" onclick="PopupBox('{$config.url}/admincp/email/delete/{$val.id}','Are you sure you want to delete this?.')"><i class="fa fa-edit"></i>Delete</a></td>
                                </tr>
                                {/foreach}

                                {else}

                                <tr>

                               <td colspan="5" style="text-align: center;">

                                   No Data Found

                               </td>

                                </tr>

                                {/if}


                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>
 </div>
                </div>
               
                <!-- /.row -->
</div>
        </div>
        </div>   
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
$('#generaltabid').click();
</script>
