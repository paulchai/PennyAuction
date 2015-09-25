{include file="common/header-1.tpl" nocache} 
{include file="common/topnav.tpl" nocache} 
<script src="{$config.url}/js/countdown.js"></script> 
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>
<div class="row user_panel">


   <div class="highbid"> {if $highbid}
    <div class="row">
      <div class="bg bg-success padding-20"> <i class="fa fa-warning"></i> Congratulations! You are the highest bidder of this project. </div>
    </div>
    {/if}
    {if $winbid}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-20"> <i class="fa fa-warning"></i> Congratulations! You won this project successfully. </div>
    </div>
    {/if}
    {if $soldhim}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-20"> <i class="fa fa-warning"></i> Congratulations! You bought this project successfully. </div>
    </div>
    {/if}
    {if $placedbid}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-20"> <i class="fa fa-warning"></i> Your Bid amount ${$placedbidamount} was Sucessfully Submitted. </div>
    </div>
    {/if} </div>
    
  <div class="col-md-4"> 
   {if $projects.market_status == 'open'}
    <div class="watch_list_del text-center" ><a href="javascript:void(0);" style="text-decoration:none" onclick="addtowatchlist({$projects.id})"><i class="fa fa-eye"></i>&nbsp;+&nbsp;Watchlist</a></div>
    {/if}
    
    <div class="pro_img"> 
      <!--<img src="{$config.url}/images/pro_img.png" alt="" />--> <img src="{if $projects.avatar == ''} {$config['imgpath']}no_img.png {else if $projects.avatar != ''}{$config['imgpath']}product/{$projects.avatar}{/if}" width="326" height="297" alt="1"> </div>
    <div class="thumbs"> 
      <!--<div class="thumb_img"><img src="{$config.url}/images/pro_thumb.png" alt="" class="img-responsive" /></div>
					<div class="thumb_img"><img src="{$config.url}/images/pro_thumb.png" al{$config.url}/images/t="" class="img-responsive" /></div>
					<div class="thumb_img"><img src="{$config.url}/images/pro_thumb.png" alt="" class="img-responsive" /></div>--> 
    </div>
  </div>
  <div class="col-md-8">
    <div class="row">
      <div class="col-md-6 emitrealbid emitrealbid{$projects.id}">
        <h3 class="product_title">{$projects.title}</h3>
        <div class="clearfix light_bbox">
          <div class="pull-left">
            <div><i class="fa fa-usd"></i>&nbsp;<span class="wsprices{$projects.id}">{$projects.wprice}</span></div>
            <div><i class="fa fa-usd"></i>&nbsp;{$projects.mprice}</div>
            <div><i class="fa fa-usd"></i>&nbsp;{$projects.shipping_price}</div>
          </div>
          <div class="pull-right">
            <div>Current Price</div>
            <div>Retail Price </div>
            <div>Shipping Fee </div>
          </div>
        </div>
        <div class="clearfix light_bbox">
          <div class="pull-left_del"><i class="fa fa-clock-o"></i>&nbsp;  {if $projects.market_status == 'open' or $projects.market_status == 'draft'}<span class="countdown" style="float:none" id="my{$projects.id}">{$projects.day}</span>{else}  Closed{/if} <!--<br /><br />{$projects.day}--></div>
          <!--<div class="pull-right"> Time-left </div>-->
        </div>
        
        
        <div class="clearfix btm_btn"> {if $projects.market_status == 'open'}
          <div class="pull-left">
         <!-- <form action="/product/confirm/" method="post" enctype="multipart/form-data">
               <input type="hidden" name="wsprice" value="{$projects.wsprice}" />
               <input type="hidden" name="id" value="{$projects.id}" />
               <button type="submit" class="btn btn-primary">BID NOW</button>
            </form> -->
            
             <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirmbid">BID NOW</button>
 <!-- <button onclick="window.location='{$config.url}/product/bid/{$projects.id}'" class="btn btn-primary">BID NOW</button>-->
          </div>
          {/if}
          {if $projects.market_status == 'open' and $projects.buynow}
          <div class="pull-right">
            <button class="btn btn-warning" onclick="window.location='{$config.url}/product/buy/{$projects.id}'">BUY NOW</button>
          </div>
          {/if} </div>
      </div>
      <div class="col-md-6">
        <div class="panel panel-warning top_bidders top_bidders{$projects.id}">
          <div class="panel-heading"> Correct Top Bidders </div>
          <div class="panel-body bid_his{$projects.id}" style="min-height:185px;height:auto">
          
          {if $bcnt == 0}
              <div class="row">
                <div class="col-md-12">   <p class="no_data">No Bids Yet</p> </div>
             </div>
             {else}
             
            {foreach $bids as $key => $val}
            <div class="row winner"><!--<div class="col-md-4">17:52:48</div>-->
              <div class="col-md-8"> {$val.name} </div>
              <div class="col-md-4"> ${$val.proposed_amount}</div>
            </div>     {/foreach}  {/if}  </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 product_decription">
        <h3>Product Description:</h3>
        <p>{$projects.description} </p>
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-md-12 product_decription">
        <h3>Shipping information:</h3>
        <p>{$projects.shipping_description} </p>
      </div>
    </div>
    
    
  </div>
</div>

<div class="modal confirmbid confirmbid{$projects.id}  fade" id="confirmbid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  
		  <div class="modal-body">
			<div>Are You sure you want to bid this item for price  <span class="wsprice{$projects.id}">${$projects.wsprice}</span>?</div>
			
            
            <form action="/product/confirm/" method="post" enctype="multipart/form-data">
               <input type="hidden" name="wsprice" id="wsprice{$projects.id}" value="{$projects.wsprice}" />
               <input type="hidden" name="id" value="{$projects.id}" />
               <button class="btn bid_now" type="submit">Confirm Bid</button>
            </form>
         
		  </div>
		</div>
	  </div>
</div>


{include file="common/footer-1.tpl" nocache} 
<script> 

function meee(id,dateee)
  {	 
 // id = '126';
 // alert(dateee);
 // alert(dateee);
  
   clearInterval(clearvar[id]);
	  clock[id] = document.getElementById('my'+id)
    , targetDate[id] = new Date(dateee); // Jan 1, 2050;
 
 // alert(targetDate[id]);
   
  clock[id].innerHTML = countdown(targetDate[id]).toString();
  clearvar[id] =  setInterval(function(){
	   if(targetDate['{$projects.id}']>new Date())
    clock[id].innerHTML = countdown(targetDate[id]).toString();
	else
	clock[id].innerHTML = 'Closed';
	
    
  }, 1000);
	  
  }
  
/*    clock['{$projects.id}'] = document.getElementById('my{$projects.id}')
    , targetDate['{$projects.id}'] = new Date('{$projects.closed}'); 
 
  clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
 clearvar['{$projects.id}'] =  setInterval(function(){
	 if(targetDate['{$val.id}']>new Date())
    clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
	else
	clock['{$projects.id}'].innerHTML = 'Closed';
    
  }, 1000);*/
  </script> 
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
		  var pid = '{$projects.id}';
		  var dt = '{$projects.closed}';
		   var resultss = {
            id: pid,
            date: dt,
			wprice:'{$projects.wprice}',
			detail_page_top_mid : $('.emitrealbid{$projects.id}').html(),
			detail_page_top_right :  $('.top_bidders{$projects.id}').html(),
			confirmbid :  $('.confirmbid{$projects.id}').html()    
        }
		
	  socket.on('bidAddtime', function(msg){		
	  // meee(msg.id,msg.date);
	  $('.emitrealbid'+msg.id).html(msg.detail_page_top_mid);
	  $('.top_bidders'+msg.id).html(msg.detail_page_top_right);
	  $('.confirmbid'+msg.id).html(msg.confirmbid);
	  meee(msg.id,msg.date);
	  });

	  socket.emit('bidAddtime', resultss);	
	  
	  socket.on('autoBid', function(emits){ 	  
		 var winner = $('.winner').length;
		 if( winner == 0)
		 $('.bid_his'+emits.pID).html('<div class="row winner"><div class="col-md-8"> '+emits.winner+' </div><div class="col-md-4"> $'+emits.wprice+' <span style="font-size:8px">(Autobid)</span></div></div>');
		 else if( winner > 8)
		 {
		 $('.bid_his'+emits.pID+' .winner:last').remove();
		 $('.bid_his'+emits.pID).prepend('<div class="row winner"><div class="col-md-8"> '+emits.winner+' </div><div class="col-md-4"> $'+emits.wprice+' <span style="font-size:8px">(Autobid)</span></div></div>');
		 }
		 else  
		 $('.bid_his'+emits.pID).prepend('<div class="row winner"><div class="col-md-8"> '+emits.winner+' </div><div class="col-md-4"> $'+emits.wprice+' <span style="font-size:8px">(Autobid)</span></div></div>');
		 
		// $('.lcntbid'+emits.pID).html(parseInt($('.lcntbid{$projects.id}').html())+1);
		 $('#wsprice'+emits.pID).val(emits.wprice);
		 $('.wsprice'+emits.pID).html('$'+emits.wprice);
		 $('.wsprices'+emits.pID).html(emits.wprice);
		 		 
		 var increasesec = "{$config['general']['bidincreaseseconds']}";
		 var t = new Date(emits.date);
		 t.setSeconds(t.getSeconds() + parseInt(increasesec));
		 meee(emits.pID,t,emits.wprice);
	 });
     </script> 
<script type="text/javascript">
$(function()
{
  projectLoad();
});</script>