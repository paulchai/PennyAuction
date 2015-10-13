{if $deleted_project}
<div class="alert alert-success"><strong>Deleted!</strong></div>
{/if}
{if $undeleted_project}
<div class="alert alert-danger"><strong>You can't delete this.Users already bidded!</strong></div>
{/if}
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Image</th>
            <th>Status</th>
            <th>Date Added</th>
            <th>Date Closed</th>
            <th>Won Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        {if $projects.length>0}
        {foreach $projects as $key => $val}
        <tr>
            <td>{$val.id}</td>
            <td><a href="{$config.url}/product/view/{$val.id}">{$val.title}</a></td>
            <td><a href="#" title="{$val.title}"> <img
                    src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}"
                    width="50" height="50" alt="1"></a></td>
            <td style="text-align: center;">
                {$val.status}
                {if $val.user_id|default:FALSE}
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".address_{$val.id}">
                    Address
                </button>
                <div class="modal fade address_{$val.id}" tabindex="-1" role="dialog"
                     aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">
                                    <strong>Address</strong>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <address>
                                    <strong>{$val.first_name} {$val.last_name}</strong><br>
                                    {$val.address1}<br>
                                    {$val.address2}<br>
                                    {$val.city}<br>
                                    {$val.state}<br>
                                    {$val.country}<br>
                                    {$val.zip}<br>
                                    <abbr title="Phone">P:</abbr> (+1) {$val.phone}
                                </address>

                                <address class="line_below">
                                    <strong>Email</strong><br>
                                    <a target="_blank" href="mailto:#">{$val.email}</a>
                                </address>

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" disabled> Shipped to buyer / Delivered
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
            </td>
            <td>{$val.stime}</td>
            <td>{$val.ctime}</td>
            <td>${$val.wprice}</td>
            <td><a href="{$config.url}/admincp/projects/edit/{$val.id}">Edit</a>
                <a onclick="PopupBox('{$config.url}/admincp/projects/delete/{$val.id}','Are you sure?');"
                   href="javascript:void(0)">Delete</a></td>
        </tr>
        {/foreach}
        {else}
        <tr>
            <td colspan="9" style="text-align: center;">No Products found</td>
        </tr>
        {/if}
        </tbody>
    </table>
    {$pagination_html}
</div>
<style type="text/css">
    .line_below {
        padding-bottom: 20px;
        border-bottom: 1px solid #e5e5e5;
    }
</style>