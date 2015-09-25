
<div class="db_menu">
  <div class="{if $pageofjs == '/dashboard/'}active{/if}"><a href="{$config['url']}/dashboard">{$_phrase.dashboard}</a></div>
  <div class="{if $pageofjs == '/live'}active{/if}"><a href="{$config['url']}/live">{$_phrase.live} {$_phrase.auction}{$_phrase.s}</a></div>
  <div class="{if $pageofjs == '/future'}active{/if}"><a href="{$config['url']}/future">{$_phrase.future} {$_phrase.auction}{$_phrase.s}</a></div>
  <div class="{if $pageofjs == '/closed'}active{/if}"><a href="{$config['url']}/closed">{$_phrase.closed} {$_phrase.auction}{$_phrase.s}</a></div>
  <div class="{if $pageofjs == '/shop'}active{/if}"><a href="{$config['url']}/shop">{$_phrase.buy_now}</a></div>
  <div class="{if $pageofjs == '/winner'}active{/if}"><a href="{$config['url']}/winner">{$_phrase.winner}{$_phrase.s}</a></div>
  <div class="{if $pageofjs == '/blog'}active{/if}"><a href="{$config['url']}/blog">{$_phrase.blog}{$_phrase.s}</a></div>
  <div class="{if $pageofjs == '/package'}active{/if}"><a href="{$config['url']}/package">{$_phrase.deposit}</a></div>
</div>
<style>.db_menu div
{
  padding:9px 17px !important;	
}</style>
