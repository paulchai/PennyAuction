{include file="register_popup.tpl" nocache} 


<div class="container-fluid">
  <div class="row bid">
    <div class="col-md-12">
      <div class="col-md-6 col-md-offset-3 adj1">
     <label>Have you Questions?</label>
        <p><!--YOU CAN ACCESS TO ALL OUR PLATFORMS-->Contact : 

<span onclick="window.location='mailto:support@beaconneqt.com'" style="cursor:pointer">support@beaconneqt.com</span></p>
        <!--<div class="bton">
          <button type="button" class="btn btn-primary">CallUs Now</button>
          <button type="button" class="btn btn-warning">Send a Message</button>
        </div>-->
      </div>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div class="row set">
      <div class="col-md-6 col-md-offset-3"> <a href=""><img src="{$config['url']}/assets/img/twit.png" /></a> <a href=""><img src="{$config['url']}/assets/img/link.png" /></a> <a href=""><img src="{$config['url']}/assets/img/fb.png" /></a> <a href=""><img src="{$config['url']}/assets/img/ebay.png" /></a></div>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12 footer1">
      <div class="col-md-6 col-md-offset-3 footer2">
        <label>Allright reserved.Copyrighted Beaconneqt 2015</label>
      </div>
    </div>
    
  </div>
</div>


<!-- Demo --> 

<script src="{$config['url']}/js/jquery-1.10.2.min.js"></script> 
<script src="{$config['url']}/js/common.js"  type="text/javascript"></script>
<script src="{$config['url']}/js/register.js"  type="text/javascript"></script>
<script src="{$config['url']}/owl-carousel/owl.carousel.js"></script> 
<script src="{$config['url']}/js/bootstrap.js"  type="text/javascript"></script>
<script src="{$config['url']}/js/parsley.js"  type="text/javascript"></script>
<style>
    #owl-demo .item img{
        display: block;
        width: 100%;
        height: auto;
    }
    </style>
<style>
    #owl-demo_3 .item img{
        display: block;
        width: 100%;
        height: 220px;
    }
    </style>
<style>
    #owl-demo_4 .item img{
        display: block;
        width: 100%;
		background:none !important;
    }
    </style>
<script>
    $(document).ready(function() {
      $("#owl-demo").owlCarousel({

      navigation : false,
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem : true,
	  pagination : true,
        paginationNumbers : true,
     });
	  $("#owl-demo_3").owlCarousel({

      navigation : false,
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem : true,
	           });
	   $("#owl-demo_4").owlCarousel({

      navigation : true,
      slideSpeed : 300,
	  pagination : false,
	  items : 1,
      paginationSpeed : 400,
      singleItem : true,
	   navigationText : ['', ''],
	    itemsScaleUp : true,
	           });
	  
	    $("#owl-demo1").owlCarousel({
    navigation:false,
    afterInit : function(elem){
      var that = this
      that.owlControls.prependTo(elem)
    }
  });
//<img src="{$config['url']}/assets/img/leftarr.PNG" alt="The Last of us">
//<img src="{$config['url']}/assets/img/rightarr.PNG" alt="The Last of us">
      $("#owl-demo_1").owlCarousel({
        autoPlay: 3000,
        items : 4,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3]
      });
 $("#owl-demo_2").owlCarousel({
        autoPlay: 3000,
        items : 4,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3]
      });

     
    });
    </script> 
    
    <script>
	
	var regerror = '{$register_error}';
	
	
	if(regerror !='')
	{
	//	alert(regerror);
	$('#reg_myModal').modal('show');
	}
	  </script>

<!--<script src="{$config['url']}/assets/js/bootstrap-collapse.js"></script> 
<script src="{$config['url']}/assets/js/bootstrap-transition.js"></script> 
<script src="{$config['url']}/assets/js/bootstrap-tab.js"></script> --> 
<!--<script src="{$config['url']}/assets/js/google-code-prettify/prettify.js"></script> 
<script src="{$config['url']}/assets/js/application.js"></script> --> 

<!--SLIDER2-->
<style>
   
    #owl-demo .item img{
        display: block;
        width: 100%;
        height: auto;
    }
    </style>
<!--SLIDER3-->
<style>
    
    #owl-demo_1 .item img{
		border:1px solid #122a38;
        display: block;
        width: 100%;
        height: auto;
    }
    </style>
<style>
    #owl-demo_2 .item{
        margin: 3px;
    }
    #owl-demo_1 .item img{
        display: block;
        width: 100%;
        height: auto;
    }
    </style>

</body></html>