{include file="common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="row dashboard user_panel">
   {include file="left-nav-dashboard.tpl" nocache}
  <div class="col-md-9" style="width:65%">
    <div class="dash"></div>
      <div class="abutop">My Transaction</div>
     
      <div class="row mblue_box">
        <div class="col-md-3">Description </div>
        <div class="col-md-1"> Type</div>
        <div class="col-md-2"> Amount </div>
        <div class="col-md-2">Date</div>
        <div class="col-md-2"> Gateway </div>
        <div class="col-md-1">Status</div>
      </div>
      {if $transaction|count <=  0}
      <div class="col-md-12 text-center m-top-20 font-12">No Results found Found</div>
      {else}
      {foreach $transaction as $key => $val}
      <div class="row mblue_box1">
        <div class="col-md-3">{$val.description} </div>
        <div class="col-md-1">{$val.type} </div>
        <div class="col-md-2">${$val.amount} </div>
        <div class="col-md-2">{$val.date_added}</div>
        <div class="col-md-2">{$val.gateway} </div>
        <div class="col-md-1">{$val.status} </div>
      </div>
      {/foreach}
      {/if}  {$pagination_html}</div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 