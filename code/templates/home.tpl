{include file="common/bidconnect-header.tpl" nocache} 
<script src="{$config.url}/js/countdown.js"></script>
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
<!--<link href="{$config['url']}/assets/css/bootstrapTheme.css" rel="stylesheet">
<link href="{$config['url']}/assets/css/custom.css" rel="stylesheet">--> 

<!-- Owl Carousel Assets -->
<link href="{$config['url']}/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="{$config['url']}/owl-carousel/owl.theme.css" rel="stylesheet">
<!--<link href="{$config['url']}/assets/js/google-code-prettify/prettify.css" rel="stylesheet">-->

<!-- Le fav and touch icons -->
<!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="{$config['url']}/assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{$config['url']}/assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{$config['url']}/assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="{$config['url']}/assets/ico/apple-touch-icon-57-precomposed.png">-->
<!-- /.container-fluid --> 

<!--SLIDER1-->
<div id="demo">
  <div class="container-fluid padding_flude" >
    <div class="row set12">
      <div id="owl-demo" class="owl-carousel">
        <div class="item"><img src="{$config['url']}/assets/img/ferr.png" style="max-height:604px"></div>
        <div class="item"><img src="{$config['url']}/assets/img/yacht.jpg" style="max-height:604px"></div>
        <div class="item"><img src="{$config['url']}/assets/img/Villa.jpg" style="max-height:604px"></div>
      </div>
    </div>
  </div>
</div>

<!--SLIDER2-->
{if $projects.open_project|count>0}  
<div id="demo">
  <div class="container-fluid padding_flude">
    <div class="row">
      <div class="col-md-12">
        <div class="mid_auction" id="activeauction">
          <p>ACTIVE AUCTIONS</p>
        </div>
        <div class="row home_aproduct" style="margin-top:30px">
      
     {foreach $projects.open_project as $key => $val}    
		<div class="col-md-3">
			<div class="thumbnail">
				<div class="home_box">
					<a href="{$config['url']}/product/view/{$val.id}">
					 <img style="cursor:pointer;height:171px;width:100%"  class="img-responsive"  src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}"> 
					</a>
				</div>
				<div class="caption">
					<div class="top_tcon">
						<div class="row">
							<div class="col-md-9 hp_tcolor">{$val.ptitle}</div>
							<div class="col-md-3 wprice{$val.id}">${$val.wprice}</div>
						</div>
						<div class="hp_tcolor"> <div id="my{$val.id}" style="font-size:13px">{$val.day}</div></div> <script>   clock['{$val.id}'] = document.getElementById('my{$val.id}')
    , targetDate['{$val.id}'] = new Date('{$val.closed}'); 
 
  clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
 clearvar['{$val.id}'] =  setInterval(function(){
	if(targetDate['{$val.id}']>new Date())
    clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
	else
	clock['{$val.id}'].innerHTML = 'Closed';
  }, 1000);
  </script>
						<div class="hp_p0">{$val.pdescription}</div>
					</div>
					<div class="clearfix bottom_tcon">
						<div class="pull-left">
							<button class="btn btn-wbdr"  onclick="javascript:window.location='{$config['url']}/product/view/{$val.id}'">BID NOW</button>
							
						</div>
						<div class="pull-right">
						<button class="btn btn-wbdr"  onclick="javascript:window.location='{$config['url']}/product/view/{$val.id}'">VIEW DETAILS</button>
						</div>
					</div>
				</div>
			</div>
		</div>  {/foreach}
		
	
		<div class="col-md-3">
			<div class="thumbnail vhome_box_wrapper">
				<div class="vhome_box">
					<a href="{$config['url']}/live?view=list&page=2">
							VIEW MORE
					</a>
				</div>
			</div>
		</div>
	</div>
      </div>
    </div>
  </div>
</div>  {/if}



{if $projects.closed_project|count>0}  
	<div class="hg_box">
			<!--<div><img src="images/categories.png" alt="" /></div>-->
			<div>SELECTED FINISHED AUCTIONS</div>
			<a href="{$config['url']}/closed?view=list&page=2"><div> More</div></a>
		</div>
		<div class="row light_hg_box">
			<div class="col-md-2 lv_tcenter">Image</div>
			<div class="col-md-4">Title</div>
			<div class="col-md-2 lv_tcenter">End Date</div>
			<div class="col-md-2">Price</div>
			<div class="col-md-2">---</div>
		</div>
        
        
          {foreach $projects.closed_project as $key => $val}
		<div class="row light_box">
			<div class="col-md-2"><img class="img-responsive" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}" style="width:110px;height:79px;cursor:pointer" onclick="window.location = '{$config['url']}/product/view/{$val.id}'"></div>
			<div class="col-md-4">
				<div class="lv_ptitle">{$val.ptitle}</div>
				<!--<div>(A218c95f0a4)</div>-->
				<div>Retailprice ${$val.bprice}</div>
			</div>
			<div class="col-md-2"><div class="timer_finished">Finished</div> </div>
			<div class="col-md-2">
			<div class="hlv_plbl">$ {$val.wprice}</div>
			<!--<div class="winner">Klexa</div>-->
			</div>
			<div class="col-md-2">
				<div><button class="btn btn-gray2">{if $val.status == 'sold'}Sold{elseif $val.status != 'sold'}Closed{/if}</button></div>
			</div>
		</div> {/foreach} {/if}
		



{include file="common/bidconnect-footer.tpl" nocache} 
<script src="{$config.url}/socket.io/socket.io.js"></script>

<script>
var socket = io.connect();
</script>
<script> 

 function meee(id,dateee,price)
  {  

   clearInterval(clearvar[id]);
    clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050;
 
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  document.getElementById('price'+id).innerHTML = price;
  clearvar[id] =  setInterval(function(){
	
	if(targetDate[id]>new Date())
    clock[id].innerHTML = countdown(targetDate[id]).toString();
	else
	clock[id].innerHTML = 'Closed';  
    }, 1000);
    
  }

     socket.on('bidAddtime', function(msg){  
	 
	 $('.wprice'+ msg.id).html('$'+msg.wprice);
     meee(msg.id,msg.date,msg.price);

     });
	 
	   socket.on('autoBid', function(emits){
		 var increasesec = "{$config['general']['bidincreaseseconds']}";
		 var t = new Date(emits.date);
		 t.setSeconds(t.getSeconds() + parseInt(increasesec));
		   meee(emits.pID,t,emits.wprice);
		     $('.wprice'+ emits.pID).html(emits.wprice);

        }); 	

</script> 