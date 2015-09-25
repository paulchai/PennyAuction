{include file="common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache}
<h3>Winners</h3>
<div class="row winner_auc"> {foreach $projects as $key => $val}
  <div class="col-md-6">
    <div class="winner_left">
      <div class="red_ribbon">You Saved {$val.mprice*100/$val.wprice}%</div>
      <div class="profile_wimg"><img src="{if $val.uavatar == ''} {$config['imgpath']}no_img.png {else if $val.uavatar != ''}{$config['imgpath']}profile/{$val.uavatar}{/if}"  style="width:117px;height:120px" alt="{$val.title}" title="{$val.title}" border="0"></div>
      <div class="winner_lbl">Winner:Penny buy</div>
      <div class="wloc">Location:Texas, US</div>
    </div>
    <div class="winner_right">
      <div class="project_name">{$val.title}</div>
      <div class="phone_img">
      <img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" style="width:231px;height:143px" alt="{$val.title}" title="{$val.title}" border="0">
      
      </div>
      <div class="clearfix">
        <div class="pull-left"><span class="wr_lbl">Bought For Only:</span><span class="wr_lbl1"> {$val.wprice}</span></div>
        <div class="pull-right"><span class="wr_lbl">Price:</span><span class="wr_lbl1"> {$val.mprice}</span></div>
      </div>
      <div class="wr_lbl">Auction closed on:</div>
      <div class="wr_lbl1">{$val.date_closed}</div>
    </div>
  </div>
  {/foreach} </div>

{include file="common/footer-1.tpl" nocache} 