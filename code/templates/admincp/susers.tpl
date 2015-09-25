{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

        {include file="/admincp/left-nav.tpl" nocache}

        <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Search User</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Users</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Search Users</div>
        </div>
            <div class="row">
                   <form class="admin_form" data-parsley-validate method="get" enctype="multipart/form-data" action="{$config.url}/admincp/users/search">
                         <div class="col-lg-4">

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input class="form-control" id="email" name="email" value="{$search.email}">

                            </div>
                             <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="" {if $search.status == ''} selected {/if}>All</option>
                                    <option value="active"  {if $search.status == 'active'} selected {/if}>Active</option>
                                    <option value="moderate"  {if $search.status == 'moderate'} selected {/if}>Moderate</option>
                                    <option value="unverified"  {if $search.status == 'unverified'} selected {/if}>Unverified</option>
                                    <option value="cancel"  {if $search.status == 'cancel'} selected {/if}>Cancelled</option>
                                </select>
                            </div>
                         </div>
                          <div class="col-lg-4">
                            <div class="form-group">
                                <label for="first_name">First Name</label>
                                <input id="first_name" class="form-control" placeholder="Enter First Name" value="{$search.first_name}" name="first_name">
                            </div>
                            <div class="form-group">
                                <label for="last_name">Last Name</label>
                                <input id="last_name" class="form-control" placeholder="Enter Last Name" value="{$search.last_name}" name="last_name">
                            </div>
                          </div>
                          <div class="col-lg-4">
                            <br /> <br /><br /><br /><br />
                            <div class="form-group">
                              <button type="submit" class="btn btn-success"> <i class="fa fa-search"></i> Search</button>
                           </div>

                         </div>
                        </form>
                </div>
                {include file="/admincp/user-list.tpl" nocache}
		</div>
     </div>
 </div>

{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
$('#usertabid').click();
</script>