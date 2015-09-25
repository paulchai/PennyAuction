{include file="common/header-1.tpl" nocache}
<style>
.dashboard .col-md-8 {
  width: 66.66666667% !important;
}
</style>
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9"> 
      <h4 class="ds_brd">Shipping Address</h4>
      {if $shipping|count == 0} <a href="{$config['url']}/dashboard/Address/shipping" title="ADD SHIPPING ADDRESS" name="key" style="text-decoration:none">
      <button class="btn edit_shipin">Add Shipping Address</button>
      </a> {/if}
      {if $shipping|count > 0}
      <!--<h4 class="shead">Shipping Address</h4>-->
      <div class="row mblue_box md_hide">
        <div class="ship_add">Name </div>
        <div class="ship_add">Address</div>
        <div class="ship_add"> State </div>
        <div class="ship_add">City</div>
        <div class="ship_add">Postcode </div>
        <div class="ship_add">Phone No </div>
        <div class="ship_add"> Options</div>
      </div>
      <div class="row mblue_box1">
        <div data-label="Name" class="account_p_lbl ship_add">{$shipping.name}</div>
        <div data-label="Address" class="account_p_lbl ship_add">{$shipping.address1} {if $shipping.address2 !=''},  {$shipping.address2} {/if} </div>
        <div data-label="State" class="account_p_lbl ship_add"> {$shipping.state} </div>
        <div data-label="City" class="account_p_lbl ship_add">{$shipping.city} </div>
        <div data-label="Postcode" class="account_p_lbl ship_add">{$shipping.zipcode} </div>
        <div data-label="Phone No" class="account_p_lbl ship_add">{$shipping.phone} </div>
        <div data-label="Options" class="account_p_lbl ship_add"> <a href="{$config['url']}/dashboard/Address/shipping" title="Edit" class="delet_link">Edit</a> &nbsp;  &nbsp; <a href="javascript:void(0);" title="Edit" class="delet_link" onclick="if(confirm('Are you sure?'))window.location = '{$config['url']}/dashboard/RemoveAddress/shipping'">Delete</a> </div>
      </div>
      {/if}
      
      
      
      <h4 class="ds_brd m-top-20">Billing Address</h4>
      {if $billing|count == 0}<a href="{$config['url']}/dashboard/Address/billing" title="ADD BILLING ADDRESS" name="key" style="text-decoration:none">
      <button class="btn edit_shipin">Add Billing Address</button>
      </a> {/if} 
      {if $billing|count > 0}
     <!-- <h4 class="shead">Billing Address</h4>-->
      <div class="row mblue_box md_hide">
        <div class="ship_add">Name </div>
        <div class="ship_add">Address</div>
        <div class="ship_add"> State </div>
        <div class="ship_add">City</div>
        <div class="ship_add">Postcode </div>
        <div class="ship_add">Phone No </div>
        <div class="ship_add"> Options</div>
      </div>
      <div class="row mblue_box1" style="background:none">
        <div data-label="Name" class="account_p_lbl ship_add">{$billing.name}</div>
        <div data-label="Address" class="account_p_lbl ship_add">{$billing.address1} {if $billing.address2 !=''} ,  {$billing.address2}{/if} </div>
        <div data-label="State" class="account_p_lbl ship_add"> {$billing.state} </div>
        <div data-label="City" class="account_p_lbl ship_add">{$billing.city} </div>
        <div data-label="Postcode" class="account_p_lbl ship_add">{$billing.zipcode} </div>
        <div data-label="Phone No" class="account_p_lbl ship_add">{$billing.phone} </div>
        <div data-label="Options" class="account_p_lbl ship_add"> <a href="{$config['url']}/dashboard/Address/billing" title="Edit" class="delet_link">Edit</a> &nbsp;  &nbsp; <a href="javascript:void(0);" title="Edit" class="delet_link" onclick="if(confirm('Are you sure?'))window.location = '{$config['url']}/dashboard/RemoveAddress/billing'">Delete</a> </div>
      </div>
      {/if} </div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
<style>
.ship_add
{
	width:120px !important;
}
</style>