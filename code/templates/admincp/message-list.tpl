<div class="col-lg-12 m-top-20">
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Title</th>
                <th>Message</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            {if $messages.length > 0}
            {foreach $messages as $key => $val}
            <tr>
                <td>{if $loged.userid == $val.from_id} {$val.tname} {else if $loged.userid != $val.from_id}
                    {$val.fname}{/if}
                </td>
                <td><a href="{$config.url}/admincp/messages/view/{$val.r_id}">{$val.subject}</a><br/>
                    {$val.message_short}..
                </td>
                <td>{$val.date_add}</td>
            </tr>
            {/foreach}
            {else}
            <tr>
                <td colspan="3" style="text-align: center;">No Users found</td>
            </tr>
            {/if}
            </tbody>
        </table>
        {$pagination_html}
    </div>
</div>