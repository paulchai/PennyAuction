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
      <h4 class="ds_brd">{$_phrase.scheduledseatedauction}</h4>
      <div class="row mblue_box md_hide">
        <div class="row mblue_box m-top-20">
          <div class="col-md-2">{$_phrase.title}</div>
          <div class="col-md-2"> {$_phrase.seatamount} </div>
          <div class="col-md-2"> {$_phrase.totalseat}{$_phrase.s} </div>
          <div class="col-md-2"> {$_phrase.seatsleft} </div>
          <div class="col-md-2"> {$_phrase.startsat}</div>
          <div class="col-md-2"> {$_phrase.endsat}</div>
        </div>
      </div>
      {if $seatedAuction|count <=  0}
      <div class="col-md-12 text-center m-top-20 font-12">{$_phrase.noresultsfound}</div>
      {else}
      {foreach $seatedAuction as $key => $alist}
      <div class="row mblue_box1"  style="background:none">
        <div data-label="Title" class="account_p_lbl col-md-2"><a href="{$config['url']}/product/view/{$alist.id}" title="{$val.ptitle}"> {$alist.title}</a></div>
        <div data-label="Bids Used" class="account_p_lbl col-md-2  text-center">${$alist.amount}</div>
                <div data-label="Bids Used" class="account_p_lbl col-md-2 text-center">{$alist.seats}</div>
        <div data-label="Bid Amount" class="account_p_lbl col-md-2  text-center">{$alist.seatsLeft}</div>
        <div data-label="Status" class="account_p_lbl col-md-2"> {$alist.start}</div>
        <div data-label="Bid Amount" class="account_p_lbl col-md-2">{$alist.end}</div>
      </div>
      {/foreach}
      {/if}
      </div>
  </div>
</div>
{include file="common/footer-1.tpl" nocache} 