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
      <h4 class="ds_brd">{$_phrase.shipping}{$_phrase.engspace}{$_phrase.address}</h4>
      {if $shipping|count == 0} <a href="{$config['url']}/dashboard/Address/shipping" title="ADD SHIPPING ADDRESS" name="key" style="text-decoration:none">
      <button class="btn edit_shipin">{$_phrase.add}{$_phrase.engspace}{$_phrase.shipping}{$_phrase.engspace}{$_phrase.address}</button>
      </a> {/if}
      {if $shipping|count > 0}
      <!--<h4 class="shead">{$_phrase.shipping}{$_phrase.engspace}{$_phrase.address}</h4>-->
      <div class="row mblue_box md_hide">
        <div class="ship_add">{$_phrase.name} </div>
        <div class="ship_add">{$_phrase.address}</div>
        <div class="ship_add"> {$_phrase.state} </div>
        <div class="ship_add">{$_phrase.city}</div>
        <div class="ship_add">Postcode </div>
        <div class="ship_add">{$_phrase.phoneno} </div>
        <div class="ship_add"> Options</div>
      </div>
      <div class="row mblue_box1">
        <div data-label="Name" class="account_p_lbl ship_add">{$shipping.name}</div>
        <div data-label="Address" class="account_p_lbl ship_add">{$shipping.address1} {if $shipping.address2 !=''},  {$shipping.address2} {/if} </div>
        <div data-label="State" class="account_p_lbl ship_add"> {$shipping.state} </div>
        <div data-label="City" class="account_p_lbl ship_add">{$shipping.city} </div>
        <div data-label="Postcode" class="account_p_lbl ship_add">{$shipping.zipcode} </div>
        <div data-label="Phone No" class="account_p_lbl ship_add">{$shipping.phone} </div>
        <div data-label="Options" class="account_p_lbl ship_add"> <a href="{$config['url']}/dashboard/Address/shipping" title="Edit" class="delet_link">{$_phrase.edit}</a> &nbsp;  &nbsp; <a href="javascript:void(0);" title="Edit" class="delet_link" onclick="if(confirm('Are you sure?'))window.location = '{$config['url']}/dashboard/RemoveAddress/shipping'">{$_phrase.delete}</a> </div>
      </div>
      {/if}
      
      
      
      <h4 class="ds_brd m-top-20">{$_phrase.billing}{$_phrase.engspace}{$_phrase.address}</h4>
      {if $billing|count == 0}<a href="{$config['url']}/dashboard/Address/billing" title="ADD BILLING ADDRESS" name="key" style="text-decoration:none">
      <button class="btn edit_shipin">{$_phrase.add}{$_phrase.engspace}{$_phrase.billing}{$_phrase.engspace}{$_phrase.address}</button>
      </a> {/if} 
      {if $billing|count > 0}
     <!-- <h4 class="shead">{$_phrase.billing}{$_phrase.engspace}{$_phrase.address}</h4>-->
      <div class="row mblue_box md_hide">
        <div class="ship_add">{$_phrase.name} </div>
        <div class="ship_add">{$_phrase.address}</div>
        <div class="ship_add"> {$_phrase.state} </div>
        <div class="ship_add">{$_phrase.city}</div>
        <div class="ship_add">Postcode </div>
        <div class="ship_add">{$_phrase.phoneno} </div>
        <div class="ship_add"> Options</div>
      </div>
      <div class="row mblue_box1" style="background:none">
        <div data-label="Name" class="account_p_lbl ship_add">{$billing.name}</div>
        <div data-label="Address" class="account_p_lbl ship_add">{$billing.address1} {if $billing.address2 !=''} ,  {$billing.address2}{/if} </div>
        <div data-label="State" class="account_p_lbl ship_add"> {$billing.state} </div>
        <div data-label="City" class="account_p_lbl ship_add">{$billing.city} </div>
        <div data-label="Postcode" class="account_p_lbl ship_add">{$billing.zipcode} </div>
        <div data-label="Phone No" class="account_p_lbl ship_add">{$billing.phone} </div>
        <div data-label="Options" class="account_p_lbl ship_add"> <a href="{$config['url']}/dashboard/Address/billing" title="Edit" class="delet_link">{$_phrase.edit}</a> &nbsp;  &nbsp; <a href="javascript:void(0);" title="Edit" class="delet_link" onclick="if(confirm('Are you sure?'))window.location = '{$config['url']}/dashboard/RemoveAddress/billing'">{$_phrase.delete}</a> </div>
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