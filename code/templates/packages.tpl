{include file="common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="row dashboard user_panel">
   {include file="left-nav-dashboard.tpl" nocache}
  <div class="col-md-9" style="width:65%">
   <div class="dash"></div>
      <div class="abutop">Buy Packages</div>
        <div class="row lp_table">
           {foreach $packages as $key => $val}
            <div class="col-md-4 pricing-table {if $key == 1}price_box{/if} {if $key == 2}price_box1{/if} {if $key == 0}price_box2{/if}">
              <ul class="padding0">
                <li class="title">
                 {$val.name} 
                </li>
                <li class="price">
                  1 Lorieum ipsum
                </li>
                <li>
                  Lorieum ipsum
                </li>
                <li>
                  Lorieum ipsum
                </li>
                <li>
                  Lorieum ipsum
                </li>
                <li>
                  Lorieum ipsum
                </li>
                <li>
                  Lorieum ipsum
                </li>
                <li class="ptitle rd_txt">${$val.price}</li>
                <li class="button">
                 <a href="{$config.url}/package/buy/{$val.id}"> <button class="btn btn-large lred">
                    BUY NOW
                  </button></a>
                </li>
              </ul>
            </div>
            
            {/foreach} 
          </div>
      </div>
  </div>    

{include file="common/footer-1.tpl" nocache} 