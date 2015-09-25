{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Coupons</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Settings</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Coupons</div>
        </div> 
  <!-- Page Heading -->
  
 <!-- <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li class="active"> <i class="fa fa-user"></i> Users <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> Coupons </li>
      </ol>
    </div>
  </div>-->
  <!-- /.row -->
  
  <div class="row"> </div>
  <style>
 
.noborder td
 {
	border:none !important; 
 }
 </style>
  <div class="table-responsive">
    <h4> {if $cdetails.id > 0} Update {else} Generate {/if} Coupons </h4>
    <form name="couponform" data-parsley-validate id="couponform">
      {if $cdetails.id > 0}
      <input type="hidden" name="cmd" value="edit" />
      <input type="hidden" name="code" value="{$cdetails.code}" />
      {/if}
      <table class="table noborder">
        <tr>
          <td> Discount Based On: </td>
          <td><input type="radio" name="type" value="dollar" checked="checked"  onclick="offertype('dollar')"  />
            <label>Dollar </label>
            <input onclick="offertype('percent')" type="radio" name="type" value="percentage" />
            <label>Percentage </label></td>
        </tr>
        
        <!--  <tr>  <td> Percentage Off (%) </td>   <td> <input type="text" class="noparsely" name="percent" value="" required /> % </td>   </tr>-->
        
        <tr>
          <td class="textchnage"> Dollar Amount Off (USD)</td>
          <td><input type="text" name="amount" value="{$cdetails.amount}" data-parsley-type="number" data-parsley-group="block1" required /></td>
        </tr>
        {if $cdetails.id == ''}
        <tr>
          <td> Generate Code </td>
          <td>             <input type="text" name="code" value="" data-parsley-group="block1" required />
            <a href="javascript:void(0)" onclick="randomString()"> Click to Generate Code </a></td>
        </tr>
        {else}
        <tr>
          <td> Coupon Code </td>
          <td> {$cdetails.code} </td>
        </tr>  {/if} 
        <tr>
          <td colspan="2"><button type="button" class="btn btn-success" id="addcoupon"> SAVE COUPON </button></td>
        </tr>
      </table>
    </form>
  </div>
  {if $cdetails.id == ''}
  <div class="table-responsive">
    <h4> Coupon Codes </h4>
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <th>Codes</th>
          <th>Type</th>
          <th>Offer</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      
      {foreach $coupons as $val}
      <tr>
        <td>{$val.code} </td>
        <td> {$val.type} </td>
        <td> {if $val.type =='dollar'} USD {$val.amount} {elseif $val.type =='percentage'} {$val.amount}%{/if} </td>
        <td><a href="{$config['url']}/admincp/coupons/edit/{$val.code}">Edit</a> &nbsp;&nbsp; <a href="{$config['url']}/admincp/coupons/delete/{$val.code}" onclick='return confirm("Do you want to delete coupon?")'>Delete</a></td>
      </tr>
      {/foreach}
        </tbody>
      
    </table>
    {$pagination_html} </div>
  {/if}
  
  <!-- /.row --> 
</div>
</div>
</div>
<script language="javascript" type="text/javascript">

function randomString() {
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var string_length = 8;
	var randomstring = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	}
	document.couponform.code.value = randomstring;
}

function offertype(par1)
{
	if(par1 == 'percent')
	$('.textchnage').html("Percentage Off (%)");
	else
	$('.textchnage').html("Dollar Amount Off (USD)");
}

</script> 
{include file="/admincp/footer.tpl" nocache} 
<script>
$('#generaltabid').click();

$('#addcoupon').click(function()
{
	if(true === $('#couponform').parsley().validate('block1'))
	{
		//alert('yes');
		
		$.ajax(
		{			
			type : "POST",
			url : "/admincp/coupons",
			data : $('#couponform').serialize(),
			dataType:'json',
			success:function(data)
			{
				if(data == 'coupon')
				alert('Coupon Code exists. Try another code');
				else if(data == 'update')
				{
					 window.location = '../';
				}
				else
				window.location = window.location;
				
			}			
			
		})
		
	}
	
});

var coupontype = '{$cdetails.type}';
if(coupontype != '')
{
	//alert(coupontype);
	$('input[value="'+coupontype+'"]').prop('checked',true);
}
</script>