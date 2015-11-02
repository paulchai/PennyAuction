{include file="/common/header-1.tpl" nocache}<div class="row dashboard">
		<div class="col-md-3 db_left_nav">
				  {include file="left-nav-dashboard.tpl" nocache}
				</div>
			<div class="col-md-8" style="margin-bottom:10px;">
			<h4 class="ds_brd">{$_phrase.dashboard}</h4>
		<div class="yu_curntly">{$_phrase.youcurrentlyhave} $ {$users.balance} {$_phrase.ledgerbalance}{$_phrase.engspace}{$_phrase.inyouraccount}.</div>
		<div class="yu_curntly">{$_phrase.youcurrentlyhave} $ {$users.reserve_amount} {$_phrase.availablebalance}{$_phrase.engspace}{$_phrase.inyouraccount}.</div>
		<div class="">
			{if !$cusdisable} <div class="dgray_box" onclick="window.location='{$config.url}/package/'">
				<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon1.png" alt="" /></div>
				<div class="db_bbox">{$_phrase.buypackage}{$_phrase.s}</div>
			</div>	{/if}
			<div class="dgray_box" onclick="window.location='{$config.url}/dashboard/wonauctions'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon2.png" alt="" /></div>
				<div class="db_bbox">{$_phrase.won}{$_phrase.engspace}{$_phrase.auction}</div>
			</div>
			<div class="dgray_box"  onclick="window.location='{$config.url}/dashboard/watchlist'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon3.png" alt="" /></div>
				<div class="db_bbox"> {$_phrase.my}{$_phrase.engspace}{$_phrase.watchlist}</div>
			</div>
			{if !$cusdisable} <div class="dgray_box"  onclick="window.location='{$config.url}/dashboard/referral'">
			<div class="db_ibox" style="padding-top: 15px;"><img src="{$config.url}/images/db_icon4.png" alt="" /></div>
			<div class="db_bbox">{$_phrase.earn}{$_phrase.engspace}{$_phrase.daily}{$_phrase.engspace}{$_phrase.bonus}</div>
			</div>{/if}
		</div>
		</div> </div>
<!--<script>
	// create instance
	window.onload = function() {
		// setup CountUp object
		jackpotamount1 = new CountUp('jackpotamount', {$jackpot}, {$jackpot}, 0, 2.5);
		userjackpot = new CountUp('userjackpot', {$jackpot}, {$userbalance.jackpot}, 0, 2.5);
		userjackpot.start();
	}

</script>-->
{include file="/common/footer-1.tpl" nocache}		