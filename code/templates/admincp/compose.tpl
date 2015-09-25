{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Messages</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Messages</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Compose</div>
        </div>        
                <div class="row">
                  <div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th colspan="4">Messages</th>
                                       
                                       
                                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <tr>
                                        <td colspan="4">

                                        <div role="tabpanel">

  <!-- Nav tabs -->
  
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" {if $action == ''} class="active" {/if}><a href="{$config.url}/admincp/messages/" >All</a></li>
    <li role="presentation" {if $action == 'inbox'} class="active" {/if}><a href="{$config.url}/admincp/messages/inbox">Inbox</a></li>
    <li role="presentation" {if $action == 'sent'} class="active" {/if}><a href="{$config.url}/admincp/messages/sent">Sent</a></li>
    <li role="presentation" {if $action == 'archive'} class="active" {/if}><a href="{$config.url}/admincp/messages/archive">Archive</a></li>
    <li role="presentation" {if $action == 'delete'} class="active" {/if}><a href="{$config.url}/admincp/messages/delete">Delete</a></li>
    <li role="presentation" {if $action == 'compose'} class="active" {/if}><a href="{$config.url}/admincp/messages/compose">Compose</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home"><div class="col-lg-12 m-top-20">
       <form action="{$config.url}/admincp/messages/save"  method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate>
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                               
                                <tbody>
                                 
                                  <tr>
                                        <td>To : <select name="users">{foreach $users as $key => $val}<option value="{$val.id}"> {$val.first_name} {$val.last_name} ({$val.email}) {/foreach}</select></td>
                                        
                                    </tr>
                                 
                                    
                                 <tr><td colspan="3">

                                
                                   <input type="hidden" value="0" name="r_id">
                                   <h2><input type="text" class="form-control" value="" name="subject" required placeholder="subject"></h2>
                                      <h2>
                           <textarea name="message" id="product_info" data-parsley-group="block1" required class="form-control"   value="" style="margin-top: 10px;" placeholder="body"></textarea>
                        </h2>
                                  <input type="submit" value="Compose" class="btn btn-success" style="margin-top: 10px;" />


                                 
                                 </td></tr>
                                </tbody>

                            </table>
                        </div>
 </div>
                </div>
</form>   
                </div>
    
  </div>

</div>
                                      </td>
                                         
                                       
                                    </tr>
                                 
                                </tbody>
                            </table>
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