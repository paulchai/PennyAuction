{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Blog</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Users</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Blog</div>
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
                    <a href="{$config.url}/admincp/blog/new" class="btn btn-success">Add</a>
                  </div>
                </div>    
                <div class="row">
                  <div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Message</th>
                                        <th>Status</th>
                                        <th>Date Added</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $blog as $key => $val}   
                                    <tr>
                                        <td>{$val.title}</td>
                                        <td>{$val.description_short}..</td>
                                        <td>{$val.status}</td>
                                        <td>{$val.date_add}</td>
                                        <td><a href="{$config.url}/admincp/blog/edit/{$val.id}"><i class="fa fa-edit"></i>Edit</a></td>
                                        <td>{if $val.status == 'open'}<a href="{$config.url}/admincp/blog/unpublish/{$val.id}"><i class="fa fa-edit"></i>Un Publish</a>{else if $val.status != 'open'}<a href="{$config.url}/admincp/blog/publish/{$val.id}"><i class="fa fa-edit"></i>Publish</a>{/if}</td>
                                    </tr>
                                 {/foreach}
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
