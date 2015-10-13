{include file="common/header-1.tpl" nocache} 

<div class="row">
 <div class="col-md-12 m-top-40 m-bottom-20"> 
 <div class="bg bg-danger padding-20">  
  <i class="fa fa-warning"></i>
  {$_phrases.someerrorbacktosite} <a href="{$config.url}">{$_phrase.clickhere}</a>
  <br /><div class="font-12 text-danger">{$message}</div>
 </div>
</div>
</div>

{include file="common/footer-1.tpl" nocache} 
