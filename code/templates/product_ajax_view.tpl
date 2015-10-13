<style type="text/css">
    .ab6 {
        margin-bottom: 5px;
        font-size: 20px;
    }

    .ab7 {
        margin-top: 35px;
        margin-bottom: 14px;
    }

    .ab8 {
        color: #c63b3b;
        font-size: 24px;
        padding: 20px;
        padding-bottom: 0;
    }

    .ab9 {
        color: #474747;
        font-size: 20px;
        font-weight: 600;
        text-align: center;
        font-family: 'Open Sans', sans-serif;
        padding: 30px 0;
        padding-top: 13px;
        padding-bottom: 13px;
    }

    .ba1 {
        margin-bottom: 10px;
    }

</style>

<div class="pric_l pric_l{$projects.id}">
    <div class="rtext rtext{$projects.id}">$<span class="format">{$projects.wprice}</span></div>
    <div style="font-size: large;color:red;">
        {if $placedbid || $projects.user_has_bid}
        {if $projects.met_reserve_price} {$_phrase.reserve_price_met} {else} {$_phrase.reserve_price_not_met}{/if}
        {/if}
    </div>
    <br/>

    <div class="gray_txt">{if $projects.market_status == 'open' or $projects.market_status == 'draft'}<h3
            class="countdown" id="my{$projects.id}">{$projects.day}</h3>{else} {$_phrase.auction}{$_phrase.engspace}{$_phrase.closed}{/if}
    </div>
    <div class="proc_title">{$projects.title}</div>


    {if $seated and $projects.auctionType == 'seated'}

    <div class="ab6">Total Seats:{$projects.seats}</div>
    <div class="ab6">{$projects.seatsLeft} Seats left</div>
    <div class="ab6">Only ${$projects.seatAmount} to join and play</div>
    <div class="ab6 ab7">Auction starts at :<span class="ab1">{$projects.stime}</span></div>
    <div class="ab6 ba1">Auction ends at :<span class="ab1">{$projects.ctime}</span></div>


    {if $projects.market_status == 'open' and $projects.seat_started ==0}

    {if $projects.seatsbooked>0}
    <button class="btn bid_now" onclick="window.location='{$config[\'url\']}/product/stand/{$projects.id}'">Stand</button>
    {elseif $projects.seatsLeft>0}
    <button class="btn bid_now" onclick="window.location='{$config[\'url\']}/product/reserve/{$projects.id}'">Reserve
    </button>
    {/if}

    {else}
    {if $projects.market_status == 'open' and $projects.seatsbooked>0}
    <button class="btn bid_now" data-toggle="modal" data-target="#confirmbid ">{$_phrase.bid_button}</button>
    {/if}
    {/if}


    {else}
    {if $projects.market_status == 'open'}
    <button class="btn bid_now" data-toggle="modal" data-target="#confirmbid ">{$_phrase.bid_button}</button>
    {/if}
    {/if}


    <div class="gray_txt">
        <div>{$_phrase.value_price} ${$projects.mprice}</span></div>
        <div>{$_phrase.bids_credit} ${$config.general['eachbidpay']}</div>
        {if $bid_credits > 0}
        <div>{$_phrase.buynow_price} $<span class="format">{$projects.bprice}</span></div>
        <div>{$_phrase.bids_credit_spent} ${$bid_credits}</div>
        {/if}
    </div>


    {if $projects.market_status == 'open' and $projects.buynow}
    <div class="dashed_sep cgapr"></div>
    <!--<button class="btn btn-primary" data-toggle="modal" data-target="#buybid ">Buy Now ${$projects.bprice}</button>-->
    {if ($projects.auctionType == 'seated' and $projects.seatsbooked>0 and $projects.seat_started ==1) ||
    $projects.auctionType != 'seated'}
    <button class="btn btn-primary" onclick="window.location='{$config[\'url\']}/product/buynow/{$projects.id}/ship'">
        {$_phrase.buy_now} $<span class="format">{$projects.bprice - $bid_credits}</span></button>
    {/if}
    {/if}
</div>
<div class="bid_history bid_history{$projects.id}">
    <div class="bid_hh">{$_phrase.bid_history}</div>
    <div class="bid_his bid_his{$projects.id}"  style="max-height:400px;overflow-y:auto;"> {if $bcnt == 0}
        <ul>
            <li>
                <p class="no_data proc_title">{$_phrase.no_bids_yet}</p>
            </li>
        </ul>
        {else}
        {foreach $bids as $key => $val}
        <div class="winner">{$val.name} <!--2014-12-17 03:29:39--> ${$val.proposed_amount}</div>
        {/foreach}
        <div class="total_bids">
            {$_phrase.total_bid}{$_phrase.s} : <span class="lcntbid lcntbid{$projects.id}">{$bcnt}</span>
            <span class="pull-right"></span>
        </div>
        {/if}
    </div>
</div>