  <div class="col-md-4"> 
		<div class="user1"> 
		<p>User Panel</p></div>
		<div class="user2">
		<ul>
		<li class="{if $pageofjs_Dash == '/dashboard'}active{/if}"><a href="{$config.url}/dashboard"><span><img src="{$config['url']}/images/dashboard.png"/></span>Dash board</a></li>
		<li class="{if $pageofjs_Dash == '/profile_settings'}active{/if}"><a href="{$config.url}/profile_settings"><span><img src="{$config['url']}/images/editpro.png" /></span>Edit Profile</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/messages'}active{/if}"><a href="{$config.url}/dashboard/messages"><span><img src="{$config['url']}/images/mymessage.png" /></span>My Messages</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/password'}active{/if}"><a href="{$config.url}/dashboard/password"><span><img src="{$config['url']}/images/psw.png" /></span>Change Password</a></li>
		<li class="{if $pageofjs_Dash == '/package/'}active{/if}"><a href="{$config.url}/package/"><span><img src="{$config['url']}/images/butpck.png" /></span>Buy Package</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/watchlist'}active{/if}"><a href="{$config.url}/dashboard/watchlist"><span><img src="{$config['url']}/images/myfav.png" /></span>My WatchList</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/Myaddress'}active{/if}"><a href="{$config.url}/dashboard/Myaddress"><span><img src="{$config['url']}/images/shiping.png" /></span>Shipping/Billing Address</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/mybids'}active{/if}"><a href="{$config.url}/dashboard/mybids"><span><img src="{$config['url']}/images/bid.png" /></span>My Bids</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/wonauctions'}active{/if}"><a href="{$config.url}/dashboard/wonauctions"><span><img src="{$config['url']}/images/wonauc.png" /></span>WonAuctions</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/transactions'}active{/if}"><a href="{$config.url}/dashboard/transactions"><span><img src="{$config['url']}/images/transacton.png" /></span>My Transactions</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/autobid'}active{/if}"><a href="{$config.url}/dashboard/autobid"><span><img src="{$config['url']}/images/autobid.png" /></span>Autobid</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/referral'}active{/if}"><a href="{$config.url}/dashboard/referral"><span><img src="{$config['url']}/images/referal.png" /></span>Referals</a></li>
		<li class="{if $pageofjs_Dash == '/dashboard/buynow'}active{/if}"><a href="{$config.url}/dashboard/buynow"><span><img src="{$config['url']}/images/buynow.png" /></span>Buy Now Transactions</a></li>
		</ul>

		</div>

	</div>