{include file="common/header-1.tpl" nocache} 
<script src="{$config.url}/js/countdown.js"></script> 
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
{include file="common/topnav.tpl" nocache} 
{if $view ==''}
<h3>{$pagetitle}</h3>
<div class="row fauction">
  <div class="col-md-12 feature_auctions">
    <div class="row"> {foreach $projects.project as $key => $val}
      <div class="col-md-3 item" style="margin-bottom:20px">
       {if $pagetitle== 'Future Auctions'} <div class="future_rib"><img src="images/future_img.png"></div> {/if}
              <img class="img-responsive" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}" style="width:244px;height:225px;cursor:pointer" onclick="window.location = '{$config['url']}/product/view/{$val.id}'">
        <div class="clearfix euro">
          <div class="pull-left">
            <div>{$val.ptitle}</div>
            <div id="my{$val.id}">{$val.day}</div>
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
          </div>
          <div class="pull-right">$ {$val.wprice}</div>
        </div>
        <div class="last_bidders">{$val.pdescription}</div>
        <div class="col">
        {if $val.status == 'open' AND $pageofjs != '/future'}  <input type="button" value="{if $pageofjs == '/shop'}BUY NOW{else if $pageofjs != '/shop'}BID NOW{/if}" onclick="window.location = '{$config['url']}/product/view/{$val.id}'" style="float: left;" class="butt1">
         {/if}
          <input type="button" value="VIEW DETALS" onclick="window.location = '{$config['url']}/product/view/{$val.id}'" style="float: right;" class="butt1">
        </div>
      </div>
      {/foreach} </div>
  </div>
  
  {if $projects.project|count == 0}
  <p> No Results found </p>
  {/if}
</div>
{$pagination_html}
{else}
<div class="main_container">
		<div class="brown_box">
			<div>FULL LIST </div>
			<a href="{$config['url']}/#activeauction"><div>Current</div> </a>
			<a href="{$config['url']}/closed?view=list"><div>Finished</div></a>
		</div>
		<div class="row light_brown_box">
			<div class="col-md-2 lv_tcenter">Image</div>
			<div class="col-md-4">Title</div>
			<div class="col-md-2 lv_tcenter">Time Remaining</div>
			<div class="col-md-2">Price</div>
		</div>
        
         {foreach $projects.project as $key => $val}
		<div class="row light_box">
			<div class="col-md-2"><img class="img-responsive" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}" style="width:110px;height:79px;cursor:pointer" onclick="window.location = '{$config['url']}/product/view/{$val.id}'"></div>
			<div class="col-md-4">
				<div class="lv_ptitle">{$val.ptitle}</div>
				<!--<div>(A218c95f0a4)</div>-->
				<div>Retailprice ${$val.bprice}</div>
			</div>
			<div class="col-md-2"><div class="time_box" id="my{$val.id}">{$val.day}</div>  <script>   clock['{$val.id}'] = document.getElementById('my{$val.id}')
    , targetDate['{$val.id}'] = new Date('{$val.closed}'); 
 
  clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
 clearvar['{$val.id}'] =  setInterval(function(){
	if(targetDate['{$val.id}']>new Date())
    clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
	else
	clock['{$val.id}'].innerHTML = 'Closed';
  }, 1000);
  </script> </div>
			<div class="col-md-2 lv_plbl">$ {$val.wprice}</div>
			<div class="col-md-2">
            
             {if $val.status == 'open'}
				<div><button class="btn btn-gray1" onclick="window.location = '{$config['url']}/product/view/{$val.id}'">BID NOW</button></div>
				<div><button class="btn btn-gray2" onclick="window.location = '{$config['url']}/product/buy/{$val.id}'">BUY NOW</button></div>
             {elseif $val.status == 'sold'}
             <div><button class="btn btn-gray1" onclick="window.location = '{$config['url']}/product/view/{$val.id}'">SOLD</button></div>
             {elseif $val.status != 'sold'}
             <div><button class="btn btn-gray1" onclick="window.location = '{$config['url']}/product/view/{$val.id}'">CLOSED</button></div>
             {/if}
            
			</div>
		</div>  {/foreach} 
		<div class="row btmpg ">
			<div class="col-md-10">
            
            {$pagination_html}
				<!--<ul class="pagination">
					
					<li><a href="#" class="active">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li>
					  <a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					  </a>
					</li>
				  </ul>-->
			</div>
			<!--<div class="col-md-2">
				<div class="pp_box">
					page 1 of 27
				</div>
			</div>-->
		</div>
	</div>  
{/if}


<style>
.btmpg .pagination
{
width:450px;	
}
</style>

<script> 

 function meee(id,dateee)
  {  

   clearInterval(clearvar[id]);
    clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050; 
 
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  clearvar[id] =  setInterval(function(){
    clock[id].innerHTML = countdown(targetDate[id]).toString();
  }, 1000);
    
  }
      socket.on('date', function(data){
        $('#txtdate').text(data.date);
    
    });
     socket.on('bidAddtime', function(msg){   
     meee(msg.id,msg.date);

     });

</script> 
{include file="common/footer-1.tpl" nocache}