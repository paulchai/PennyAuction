{include file="/common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="row user_panel"> {include file="left-nav-dashboard.tpl" nocache}
  <div class="col-md-8">
    <div class="row">
      <div class="dash"></div>
      <div class="abutop">Dashboard</div>
      <div class="col-md-12">
        <P>&nbsp;</P>
        <P>&nbsp;</P>
        <div class="row">
          <div class="col-md-4 redwid25"><a href="{$config.url}/dashboard/watchlist"><img src="{$config['url']}/images/wtlist.PNG" /></a></div>
          <div class="col-md-4 redwid25"><a href="{$config.url}/dashboard/wonauctions"><img src="{$config['url']}/images/imgwon.PNG" /></a></div>
          <div class="col-md-4 redwid25"><a href="{$config.url}/dashboard/referral"><img src="{$config['url']}/images/woncoin.png" /></a></div>
        </div>
      </div>
      <div class="col-md-4 redwid25"></div>
      <div class="col-md-4 redwid25"><a href="{$config.url}/package/"> <img src="{$config['url']}/images/bypack.png" /></a></div>
    </div>
  </div>
</div>
{include file="/common/footer-1.tpl" nocache} 