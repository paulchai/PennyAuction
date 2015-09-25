{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">
    {include file="/admincp/left-nav.tpl" nocache}
    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">{$breadcrumb} Users List</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Users</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>{$breadcrumb} Users List</div>
            </div>
            {include file="/admincp/user-list.tpl" nocache}
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#usertabid').click();
</script>