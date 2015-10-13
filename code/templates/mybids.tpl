{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">{$_phrase.my_bid}{$_phrase.s}</h4>
      <div class="row mblue_box md_hide">
        <div class="col-md-3 text-center">{$_phrase.image}</div>
        <div class="col-md-2 text-center">{$_phrase.title}</div>
        <div class="col-md-4 text-center" >{$_phrase.end}{$_phrase.engspace}{$_phrase.time} </div>
        <div class="col-md-3 text-center">{$_phrase.total_bids_placed}</div>
        
      </div>
      {if $mybids|count <=  0}
      <div class="row mblue_box1 masw2e"> {$_phrase.no_bids_found} </div>
      {else}
      {foreach $mybids as $key => $val}
      <div class="row mblue_box1">
        <div data-label="Image" class="account_p_lbl col-md-3 text-center"><a href=""><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>
        <div data-label="Title" class="account_p_lb col-md-2 text-center"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>
        <div data-label="End Time" class="account_p_lb col-md-4 text-center">{$val.date_closed}</div>
        <div data-label="Total Bids Placed" class="account_p_lb col-md-3 text-center">{$val.bids}</div>
        
      </div>
      {/foreach}
      {/if} 
      
      {$pagination_html} </div>
  </div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 