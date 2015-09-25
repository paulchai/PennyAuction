{include file="/common/header-1.tpl" nocache} 
<!--<script src="{$config.url}/js/countdown.js"></script> 
<script>  var clock = [];  var targetDate = [];  var clearvar = []; </script> -->
{include file="common/topnav.tpl" nocache}
<div class="input-group em_search pull-left;">
  <form action="{$config['url']}/search" method="get"  role="search" enctype="multipart/form-data" id="loginform"  >
    <input type="hidden" value="live" name="page" />
    <select class="input-group-addon btn btn-info selc" name="cid" id="cidval">
      <option>{$_phrase.all_categories}</option>
      
    
                            {foreach $category as $key => $val}
                            
    
      <option value="{$val.id}"  {if $cid_search == $val.id} selected {/if}>{$val.name}</option>
      
    
                            {/foreach} 
                        
  
    </select>
    <!-- /btn-group -->
    <input type="text" name="search" class="form-control selip"  value="{$search_search}" id="searchval">
    <button type="submit" class="input-group-addon btn btn-info srch_btn"> <i class="fa fa-search"></i> </button>
  </form>
</div>
<div class="row">

 <form action="{$config['url']}/search" method="get" id="leftnavs"  role="search" enctype="multipart/form-data">
 <input type="hidden" name="cid" id="cids" value="All Categories" />
 <input type="hidden" name="search" id="searchs" value="{$search_search}" />
  <div class="col-md-3 search_left">
    <div class="search_section">
      <h3 class="search_lbl">By Category</h3>
      {foreach $category as $key => $val}
      <div><a href="javascript:void(0);" onclick="categorysearch({$val.id})">{$val.name}</a></div>
      {/foreach} 
      <!--<div><a href="">Home Appliances(76)</a></div>
					<div><a href="">Mobiles(50)</a></div>
					<div><a href="">Laptops(48)</a></div>
					<div><a href="">Electricals(8)</a></div>
					<div><a href="">Electronics(6)</a></div>
					<div><a href="">Others(60)</a></div>--> 
    </div>
    <div class="search_section custom-radio">
      <h3 class="search_lbl" style="margin-top:10px">Auction</h3>
      <div class="check_row">
        <label class="radio-label">
          <input type="radio" name="page" value="live" class="radio-input" checked>
          <span class="info"></span>Bid Now </label>
      </div>
      <div class="check_row">
        <label class="radio-label">
          <input type="radio" name="page" value="shop" class="radio-input">
          <span class="info"></span>Buy Now </label>
      </div>
    </div>
    <div class="search_section custom-check">
      <h3 class="search_lbl">Shipping</h3>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name="shipping[]" value="-1" class="check-input">
          <span class="info"></span>Free Shipping </label>
      </div>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name="shipping[]" value="0" class="check-input">
          <span class="info"></span>€0-50 </label>
      </div>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name="shipping[]"  value="50" class="check-input">
          <span class="info"></span>€50-100 </label>
      </div>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name="shipping[]" value=">100" class="check-input">
          <span class="info"></span>above €100 </label>
      </div>
    </div>
    <div class="search_section custom-check">
      <h3 class="search_lbl">Price </h3>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name='price[]' value="0" class="check-input">
          <span class="info"></span>€0-50 </label>
      </div>
      <!--<div class="check_row">
        <label class="check-label">
          <input type="checkbox" name='price[]' value="100" class="check-input">
          <span class="info"></span>€50-100 </label>
      </div>-->
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name='price[]' value="100" class="check-input">
          <span class="info"></span>€100-200 </label>
      </div>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name="price[]" value="200" class="check-input">
          <span class="info"></span>€200-300 </label>
      </div>
      <div class="check_row">
        <label class="check-label">
          <input type="checkbox" name='price[]' value=">300" class="check-input">
          <span class="info"></span>above 300 </label>
      </div>
    </div>
  </div> </form>
  
  
  <div class="col-md-9 search_right">
    <div class="row">
    {assign var="proj" value=$projects.project}
     <div class="searchresult"> 
      {include file="/projects.tpl" nocache} 
     </div>
 </div>
  </div>
</div>
<script> 

$('.head-search').hide();

	$('#leftnavs input').click(function()
	{
		$('#searchs').val($('#searchval').val());
		$('#cids').val($('#cidval').val());
		//$('#leftnavs').submit();
		searchProjectAjax();
	
	});
	
	function categorysearch(catid)
	{
	  $('#searchs').val($('#searchval').val());	
	  $('#cids').val(catid);
	  $('#cidval').val(catid);
	  searchProjectAjax();
	}

</script> 
{include file="/common/footer-1.tpl" nocache} 