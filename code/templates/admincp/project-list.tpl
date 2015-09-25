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
            <th>Posted By</th>
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
            <td>{$val.status}</td>
            <td>{$val.stime}</td>
            <td>{$val.ctime}</td>
            <td>{$val.email}</td>
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