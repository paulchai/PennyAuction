{include file="/common/header-1.tpl" nocache}<div class="row dashboard">
		<div class="col-md-3 db_left_nav">
				  {include file="left-nav-dashboard.tpl" nocache}
				</div>
			<div class="col-md-8" style="margin-bottom:10px;">
			<h4 class="ds_brd">Dashboard</h4>
		<div class="yu_curntly">You currently have $ {$users.balance} ledger balance in your account.</div>
		<div class="yu_curntly">You currently have $ {$users.reserve_amount} available balance in your account.</div>
		<div class="">
			<div class="dgray_box" onclick="window.location='{$config.url}/package/'">
				<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon1.png" alt="" /></div>
				<div class="db_bbox">Buy Packages</div>
			</div>	
			<div class="dgray_box" onclick="window.location='{$config.url}/dashboard/wonauctions'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon2.png" alt="" /></div>
				<div class="db_bbox">Won Auction</div>
			</div>
			<div class="dgray_box"  onclick="window.location='{$config.url}/dashboard/watchlist'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon3.png" alt="" /></div>
				<div class="db_bbox"> My Watchlist</div>
			</div>
			<div class="dgray_box"  onclick="window.location='{$config.url}/dashboard/referral'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon4.png" alt="" /></div>
			<div class="db_bbox">Earn Daily Bonus</div>
			</div>
		</div>
		</div> </div>
{include file="/common/footer-1.tpl" nocache}		