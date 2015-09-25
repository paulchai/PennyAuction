<script src="{$config.url}/js/countdown.js"></script> 
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script>  
 
 {foreach $proj as $key => $val}
      <div class="col-md-3 item" style="margin-bottom:20px"> {if $pagetitle== 'Future Auctions'}
        <div class="future_rib"><img src="images/future_img.png"></div>
        {/if}
        <!--<div class="watch_list"><a href=""><i class="fa fa-eye"></i></a></div>-->
        <img class="img-responsive" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}" style="width:203px;height:187px">
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
        <div class="last_bidders">Last Bidders:Pandi,Raj</div>
        <div class="col">
          <input type="button" value="BID NOW" onclick="window.location = '{$config['url']}/product/view/{$val.id}'" style="float: left;" class="butt1">
          <input type="button" value="VIEW DETALS" onclick="window.location = '{$config['url']}/product/view/{$val.id}'" style="float: right;" class="butt1">
        </div>
      </div>
      {/foreach}
      
     {if $proj|count == 0}
      <p> No Results found </p>
      {/if}  
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