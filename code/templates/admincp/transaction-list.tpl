<div class="table-responsive">
    <table class="table table-bordered table-hover" id="transaction_history">
        <thead>
        <tr>
            <th>Invoice ID</th>
            <th>User</th>
            <th>Product Title</th>
            <th>Type</th>
            <th>Status</th>
            <th>Shipping Fee</th>
            <th>Amount</th>
            <th>Transaction ID</th>
            <th>Gateway</th>
            <th>Description</th>
            <th>Date Added</th>
        </tr>
        </thead>
        <tbody>
        {foreach $trans as $key => $val}
        <tr>
            <td>{$val.id}</td>
            <td>{$val.email}</td>
            <td>{$val.title} ({$val.pid})</td>
            <td>{$val.type}</td>
            <td>{$val.istatus}</td>
            <td>${$val.shipping_price}</td>
            <td>${$val.amount}</td>
            <td>{$val.transactionid}</td>
            <td>{$val.gateway}</td>
            <td>{$val.description}</td>
            <td>{$val.date_add}</td>
        </tr>
        {/foreach}
        </tbody>
    </table>
    {$pagination_html}
</div>