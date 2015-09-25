<div class="white_box" id="horiz-menu">

					 <div class="wb_bll" data-toggle="collapse" data-target="#lmy-nav"><span>User Panel </span><span class="up_dicon"><i class="fa fa-chevron-right"></i></span></div>
					<div id="lmy-nav" class="navbar-collapse collapse user2" role="navigation">
					<div class="wb_lbl"><a href="{$config.url}/dashboard"><span class="img_up"><img src="{$config.url}/images/db1.png" alt="" /></span>Dashboard<i class="fa fa-chevron-circle-right"></i></a></div>
                     <div class="wb_lbl"><a href="{$config.url}/profile_settings"><span class="img_up"><img src="{$config.url}/images/db2.png" alt="" /></span>Edit profile<i class="fa fa-chevron-circle-right"></i></a></div>
				     <div class="wb_lbl"><a href="{$config.url}/dashboard/messages"><span class="img_up"><img src="{$config.url}/images/db3.png" alt="" /></span>My Messages<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href="{$config.url}/dashboard/password"><span class="img_up"><img src="{$config.url}/images/db4.png" alt="" /></span>Change password<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href="{$config.url}/package/"><span class="img_up"><img src="{$config.url}/images/db5.png" alt="" /></span>Buy Package<i class="fa fa-chevron-circle-right"></i></a></div>
				     <div class="wb_lbl"><a href=" {$config.url}/dashboard/watchlist"><span class="img_up"><img src="{$config.url}/images/db6.png" alt="" /></span>My Watchlist<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href=" {$config.url}/dashboard/Myaddress" customurl="dashboard/Address"><span class="img_up"><img src="{$config.url}/images/db7.png" alt="" /></span>Shipping/Billing Address<i class="fa fa-chevron-circle-right"></i></a></div>
                     <div class="wb_lbl"><a href=" {$config.url}/dashboard/mybids"><span class="img_up"><img src="{$config.url}/images/db8.png" alt="" /></span>My Bids<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href=" {$config.url}/dashboard/wonauctions"><span class="img_up"><img src="{$config.url}/images/db10.png" alt="" /></span>penny won auctions<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href=" {$config.url}/dashboard/transactions"><span class="img_up"><img src="{$config.url}/images/db11.png" alt="" /></span>My transactions<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl disabled"><a href=" {$config.url}/dashboard/autobid"><span class="img_up"><img src="{$config.url}/images/db12.png" alt="" /></span>AutoBid<i class="fa fa-chevron-circle-right"></i></a></div>
					
                    
                   {if $seated}  <div class="wb_lbl disabled"><a href=" {$config.url}/dashboard/seated"><span class="img_up"><img src="{$config.url}/images/seat.png" alt="" /></span>Seated Auction<i class="fa fa-chevron-circle-right"></i></a></div>  {/if}
					
                     <div class="wb_lbl"><a href=" {$config.url}/dashboard/referral"><span class="img_up"><img src="{$config.url}/images/db13.png" alt="" /></span>Referral<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href=" {$config.url}/dashboard/buynow"><span class="img_up"><img src="{$config.url}/images/db14.png" alt="" /></span>Buy Now Transactions<i class="fa fa-chevron-circle-right"></i></a></div>
					 <div class="wb_lbl"><a href=" {$config.url}/dashboard/withdrawal"><span class="img_up"><img src="{$config.url}/images/db11.png" alt="" /></span>Withdrawals<i class="fa fa-chevron-circle-right"></i></a></div>
					</div>
				</div>
				
				
<script type="text/javascript" charset="utf-8">
//<![CDATA[
var path = window.location.href; // Just grabbing a handy reference to it
$('#horiz-menu .wb_lbl a').each(function() {
		var thishref = this.href;
		var customurl = $(this).attr('customurl');
		//alert(customurl);
		if (path.toLowerCase().indexOf(thishref.toLowerCase()) >= 0 || (customurl && path.toLowerCase().indexOf(customurl.toLowerCase()) >= 0))
		{
		$('#horiz-menu .wb_lbl a').removeClass('active');
        $(this).addClass('active');
		}

});
//]]>
</script>