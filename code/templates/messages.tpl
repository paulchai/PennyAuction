{include file="common/header-1.tpl" nocache}
<div class="main_container">
<div class="row dashboard">
<div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
<div class="col-md-9">
<div class="row ds_brd">
  <div class="col-md-8">
    <h4>{$_phrase.my}{$_phrase.engspace}{$_phrase.message}{$_phrase.s}</h4>
  </div>
</div>
<ul class="nav nav-tabs" role="tablist">
  <li role="presentation" {if $action == ''} class="active" {/if}><a href="{$config.url}/dashboard/messages/" >{$_phrase.all_msg}</a></li>
  <li role="presentation" {if $action == 'inbox'} class="active" {/if}><a href="{$config.url}/dashboard/messages/inbox">{$_phrase.inbox}</a></li>
  <li role="presentation" {if $action == 'sent'} class="active" {/if}><a href="{$config.url}/dashboard/messages/sent">{$_phrase.sent_box}</a></li>
  <li role="presentation" {if $action == 'archive'} class="active" {/if}><a href="{$config.url}/dashboard/messages/archive">{$_phrase.archive}</a></li>
  <li role="presentation" {if $action == 'delete'} class="active" {/if}><a href="{$config.url}/dashboard/messages/delete">{$_phrase.delete_box}</a></li>
  <li role="presentation" {if $action == 'compose'} class="active" {/if}><a href="{$config.url}/dashboard/messages/compose">{$_phrase.compose}</a></li>
</ul>
<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="home"> {include file="message-list.tpl" nocache} </div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 