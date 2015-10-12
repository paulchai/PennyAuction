{include file="/common/header-1.tpl" nocache}
 <link href="{$config['url']}/assets/css/custom.css" rel="stylesheet">

    <!-- Owl Carousel Assets -->
    <link href="{$config['url']}/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="{$config['url']}/owl-carousel/owl.theme.css" rel="stylesheet">
<style>
.row .row {
  width: auto;
}
#owl-demo .item img{
     display: block;
     width:100%;
	 max-width:880px;
     margin: 0px auto;
}
 
.ontimwid {
	width:6%;
 }
@media screen and (max-width: 990px){
.ipm0px{
	padding:10px;
}
}
@media screen and (max-width: 390px){
.fotdi6{
	min-height: 63px !important;
}
.futexcen1{
	  padding-left: 112px;
}
}
@media screen and (max-width: 770px) {
#owl-demo .item img{
	width:100%;
	margin-left:0;
}
	
}
@-moz-document url-prefix() { 
.ontimwid {
	width:-1px !important;
 }
  }
</style>

<div class="col-md-12" style="margin-top:-21px;">
  <div class="col-md-2 ftmdpro ontimwid" ></div>
  <div class="col-md-12">
<div id="demo">
        <div class="container">
          <div class="row">
        
            <div class="span12">
             
              <div id="owl-demo" class="owl-carousel">

                <div class="item"><img src="{$config['url']}/image/Banner_1.png" alt="The Last of us"></div>
                <div class="item"><img src="{$config['url']}/image/Banner_2.png" alt="The Last of us"></div>
                 <div class="item"><img src="{$config['url']}/image/Banner_3.png" alt="The Last of us"></div>

              </div>
            </div>
          </div>
        </div>
    </div>
    </div>
</div>
<script type="text/javascript">
function update(obj) {
  var date = new Date()

  var hours = date.getHours();
  if (hours < 10) hours = '0'+hours
  document.getElementById('hour').innerHTML = hours

  var minutes = date.getMinutes()
  if (minutes < 10) minutes = '0'+minutes
  document.getElementById('min').innerHTML = minutes

  var seconds = date.getSeconds()
  if (seconds < 10) seconds = '0'+seconds
  document.getElementById('sec').innerHTML = seconds
}
</script>

  <div class="row">
    <div class="col-md-12 fotdi6">

<div class="col-md-6 pull-left futexcen1" style="margin-top: 8px;">{$pagetitle}</div>
<div class="col-md-3 pull-right auto_width" style="margin-top: 8px;"><span>{$_phrase.sortby}:</span> 
<select onchange="searchitems(this)">
  <option  value="01" {if $get.sort == '01'}selected {/if} >{$_phrase.time}: {$_phrase.newlylisted}</option>
  <option  value="02" {if $get.sort == '02'}selected {/if}>{$_phrase.time}: {$_phrase.endingsoonest}</option>
  <option   value="03" {if $get.sort == '03'}selected {/if}>{$_phrase.price}: {$_phrase.lowestfirst}</option>
  <option  value="04" {if $get.sort == '04'}selected {/if}>{$_phrase.price}: {$_phrase.highestfirst}</option>
</select>
</div>

</div>
      <div class="col-md-12"> {assign var="proj" value=$projects.project}
      {include file="projects-new.tpl" nocache}
      
      {if $projects.project|count == 0} <p class="text-center" style="margin-bottom:10px">{$_phrase.noresultsfound} {/if} </p> </div>
    </div>

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

<script>
    $(document).ready(function() {

      var time = 5; // time in seconds

      var $progressBar,
          $bar, 
          $elem, 
          isPause, 
          tick,
          percentTime;

        //Init the carousel
        $("#owl-demo").owlCarousel({
          slideSpeed : 500,
          paginationSpeed : 500,
          singleItem : true,
          afterInit : progressBar,
          afterMove : moved,
          startDragging : pauseOnDragging
        });

        //Init progressBar where elem is $("#owl-demo")
        function progressBar(elem){
          $elem = elem;
          //build progress bar elements
          buildProgressBar();
          //start counting
          start();
        }

        //create div#progressBar and div#bar then prepend to $("#owl-demo")
        function buildProgressBar(){
          $progressBar = $("<div>",{
            id:"progressBar"
          });
          $bar = $("<div>",{
            id:"bar"
          });
          $progressBar.append($bar).prependTo($elem);
        }

        function start() {
          //reset timer
          percentTime = 0;
          isPause = false;
          //run interval every 0.01 second
          tick = setInterval(interval, 10);
        };

        function interval() {
          if(isPause === false){
            percentTime += 1 / time;
            $bar.css({
               width: percentTime+"%"
             });
            //if percentTime is equal or greater than 100
            if(percentTime >= 100){
              //slide to next item 
              $elem.trigger('owl.next')
            }
          }
        }

        //pause while dragging 
        function pauseOnDragging(){
          isPause = true;
        }

        //moved callback
        function moved(){
          //clear interval
          clearTimeout(tick);
          //start again
          start();
        }

        //uncomment this to make pause on mouseover 
        // $elem.on('mouseover',function(){
        //   isPause = true;
        // })
        // $elem.on('mouseout',function(){
        //   isPause = false;
        // })
    });
    </script>

{include file="/common/footer-1.tpl" nocache}	