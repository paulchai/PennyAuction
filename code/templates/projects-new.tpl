<script src="{$config.url}/js/countdown.js"></script>
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
<div class="row">
  {foreach $proj as $key => $val}
              <div class="col-md-4">
                <div class="media">
                  <a class="pull-left" href="{$config['url']}/product/view/{$val.id}">
                    <div class="ht_rimg1">
                    <img class="media-object" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}" width="99">
                    </div>
                  </a>
                  <div class="media-body">
                    <div class="pro_title"> <a href="{$config['url']}/product/view/{$val.id}" title="{$val.title}"> {$val.ptitle} </a></div>
                    <div class="pro_price orng_txt">${$val.bprice}</div>
                    <div class="pro_price">$Bid:<span class="orng_txt">${$val.wprice}</span></div>
                    <div class="pro_time" id="my{$val.id}">{$val.day}</div>
                  </div>
                </div>
                 <script>   clock['{$val.id}'] = document.getElementById('my{$val.id}')
    , targetDate['{$val.id}'] = new Date('{$val.closed}'); 
 
  clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
 clearvar['{$val.id}'] =  setInterval(function(){
	if(targetDate['{$val.id}']>new Date())
    clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
	else
	clock['{$val.id}'].innerHTML = 'Closed';
  }, 1000);
  </script>
                <div class="clearfix pro_btm">
                  <div class="pull-left"><img class="media-object" onclick="addtowatchlist({$val.id})" src="{$config.url}/images/watch_list.png" alt="..."></div>
                  <div class="pull-right">
                    <button class="btn btn-primary" onclick="window.location = '{$config['url']}/product/bid/{$val.id}'">
                    BID ME
                    </button>
                  </div>
                    
                </div>
              </div> 
              {/foreach}
          </div>