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
                <div>List</div>
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
                                            <li role="presentation" {if $action==''} class="active" {/if}><a
                                                href="{$config.url}/admincp/messages/">All</a></li>
                                            <li role="presentation" {if $action=='inbox'} class="active" {/if}><a
                                                href="{$config.url}/admincp/messages/inbox">Inbox</a></li>
                                            <li role="presentation" {if $action=='sent'} class="active" {/if}><a href="{$config.url}/admincp/messages/sent">Sent</a></li>
                                            <li role="presentation" {if $action=='archive'} class="active" {/if}><a
                                                href="{$config.url}/admincp/messages/archive">Archive</a></li>
                                            <li role="presentation" {if $action=='delete'} class="active" {/if}><a
                                                href="{$config.url}/admincp/messages/delete">Delete</a></li>
                                            <li role="presentation" {if $action=='compose'} class="active" {/if}><a
                                                href="{$config.url}/admincp/messages/compose">Compose</a></li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="home">
                                                {include file="admincp/message-list.tpl" nocache}
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- {$pagination_html}-->
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