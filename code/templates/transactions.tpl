{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">My Transaction</h4>
      <div class="row mblue_box md_hide">
        <div class="col-md-2">Description </div>
        <div class="col-md-2"> Type</div>
        <div class="col-md-2"> Amount </div>
        <div class="col-md-2">Date</div>
        <div class="col-md-2"> Gateway </div>
        <div class="col-md-2">Status</div>
      </div>
      {if $transaction|count <=  0}
      <div class="col-md-12 text-center m-top-20 font-12">No Results Found</div>
      {else}
      {foreach $transaction as $key => $val}
      <div class="row mblue_box1">
        <div data-label="Description" class="account_p_lbl col-md-2">{$val.description} </div>
        <div data-label="Type" class="account_p_lbl col-md-2">{$val.type}  </div>
        <div data-label="Amount" class="account_p_lbl col-md-2">${$val.amount}   <br /><br />  {if $val.amount > $val.buynowpandi.paid  and $val.buynowpandi.paid>0} (Paid : ${$val.buynowpandi.paid} , Discount : ${$val.buynowpandi.discount} , Bid Credits : ${$val.buynowpandi.bidcredits} )  {/if} </div>
        <div data-label="Date" class="account_p_lbl col-md-2">{$val.date_added}</div>
        <div data-label="Gateway" class="account_p_lbl col-md-2">{$val.gateway} </div>
        <div data-label="Status" class="account_p_lbl col-md-2">{$val.status} </div>
      </div>
      {/foreach}
      {/if}  {$pagination_html}</div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 