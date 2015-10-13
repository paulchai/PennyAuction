{include file="common/header-1.tpl" nocache}
<script src="{$config.url}/js/countdown.js"></script>
<script>  var clock = [];
var targetDate = [];
var clearvar = [];
</script>
<style type="text/css">
    .mfrs1 {
        margin-top: 5px;
    }
</style>
<div class="row">
    <!--<div class="col-md-2 left_col">
      <div class="white_box">
        <div class="whead">Welcome</div>
        <div class="b_lbl">We Support below Types in our Release 1</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is Penny Auction?</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is  Peak Auction?</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reserve Bidding</div>
      </div>
      <div class="white_box">
        <div class="whead">Bidding Type</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>Beginner</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>Penny Auction</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>Peak Auction</div>
        <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reverse Auction</div>
      </div>
      <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt=""> </div>
    </div>-->

    <div class="col-md-12">

        {if $highbid}
        <div class="row">
            <div class="bg bg-success padding-20  m-top-40"><i class="fa fa-warning"></i> {$_phrase.congratulations}! {$_phrase.c_highest_bidder}
            </div>
        </div>
        {/if}
        {if $winbid}
        <div class="row">
            <div class="bg bg-success padding-20  m-top-40"><i class="fa fa-warning"></i> {$_phrase.congratulations}! {$_phrase.c_won_this_product}
            </div>
        </div>
        {/if}
        {if $soldhim}
        <div class="row">
            <div class="bg bg-success padding-20  m-top-40"><i class="fa fa-warning"></i> {$_phrase.congratulations}! {$_phrase.c_bought_this_product}
            </div>
        </div>
        {/if}
        {if $placedbid}
        <div class="row">
            <div class="bg bg-success padding-20  m-top-40"><i class="fa fa-warning"></i> {$_phrase.your}{$_phrase.engspace}{$_phrase.bid}{$_phrase.engspace}{$_phrase.amount|lower}
                ${$placedbidamount} {$_phrase.was|lower}{$_phrase.engspace}{$_phrase.successfully}{$_phrase.engspace}{$_phrase.submitted}.
            </div>
        </div>
        {/if}

        {if $projects.seatsbooked>0 and $projects.seat_started ==0}
        <div class="row">
            <div class="bg bg-success padding-20  m-top-40"><i class="fa fa-warning"></i> You have reserved seat for
                this auction.
            </div>
        </div>
        {/if}

        {if $projects.market_status == 'open'}
        <div class="watch_list"><a href="javascript:void(0);" onclick="addtowatchlist({$projects.id})"><i
                class="fa fa-eye"></i>&nbsp;+&nbsp;{$_phrase.watchlist}</a></div>
        {/if}
        <div class="row proc_r">
            <div class="col-md-4">

                <div>
                    <div class="proc_title" style="padding:0;padding-bottom: 30px;">{$projects.title}</div>

                    <ul class="owl-carousel main-preview" id="owl-images"> {foreach $images as $key => $val}
                        <li class="item text-center" style="height: 350px;"><img
                                src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}"
                                style="max-width:256px;max-height: 340px;" alt="1"></li>
                        {/foreach}
                    </ul>
                </div>
            </div>
            <div class="clearfix col-md-8 rblue_box"> {include file="product_ajax_view.tpl" nocache}</div>
        </div>
        <div class="lgr_box">
            <div class="row gray_txt">
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <div><b>{$_phrase.auction|upper}{$_phrase.s|upper}{$_phrase.engspace}{$_phrase.detail|upper}{$_phrase.s|upper}</b></div>
                    <div>{$_phrase.auction_id} : {$projects.id}</div>
                    <div>{$_phrase.auction_type} : {if $projects.auctionType !=''} {$projects.auctionType} {else}Beginner{/if}
                    </div>
                    <div>{$_phrase.tag} : {$projects.tags}</div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4 bdr">
                    <div>
                        <b>
                            {$_phrase.price|upper}{$_phrase.engspace}{$_phrase.detail|upper}{$_phrase.s|upper}
                        </b>
                    </div>
                    <div>{$_phrase.price_starting_from} : $ {$projects.sprice}</div>
                    <div>{$_phrase.start}{$_phrase.engspace}{$_phrase.time} : {$projects.stime}</div>
                    <div>{$_phrase.end}{$_phrase.engspace}{$_phrase.time} : {$projects.ctime}</div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <div>
                        <b>
                            {$_phrase.shipping|upper}{$_phrase.engspace}{$_phrase.detail|upper}{$_phrase.s|upper}
                        </b>
                    </div>
                    <div>{$_phrase.shipping_fee} :$ {$projects.shipping_price}</div>
                    <div>{$_phrase.shipping}{$_phrase.engspace}{$_phrase.information} : {$projects.shipping_description}</div>
                </div>
            </div>
            <div class="row gray_txt spd_desc">
                <div>
                    <b>
                        {$_phrase.product|upper}{$_phrase.engspace}{$_phrase.description|upper}
                    </b>
                </div>
                <p> {$projects.description} </p>
            </div>
        </div>
    </div>
</div>
<div class="modal confirmbid fade" id="buybid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>

            <div class="modal-body">
                <div class="confirmbid_header">Confirm Your Buy Now</div>
                <div class="proc_title">{$projects.title}</div>
                <div><img src="{$config.url}images/sam_product.png" alt=""></div>
                <div class="clearfix pro_row">
                    <div class="pull-left ctxt_lbl">{$_phrase.time_left} :</div>
                    <div class="pull-left mfrs1"> {if $projects.market_status == 'open' or $projects.market_status ==
                        'draft'}
                        <h3 class="countdown" id="my{$projects.id}">{$projects.day}</h3>
                        {else} {$_phrase.auction}{$_phrase.engspace}{$_phrase.closed}{/if}
                    </div>
                </div>
                <div class="clearfix pro_row">
                    <div class="pull-left ctxt_lbl">{$_phrase.bid_history} :</div>
                    <div class="pull-left sbid sbid{$projects.id} mfrs1"><font
                            class="sbid sbid{$projects.id}">{$bcnt}</font> {$_phrase.bid}{$_phrase.s}
                    </div>
                </div>
                <div class="clearfix pro_row">
                    <div class="pull-left ctxt_lbl">{$_phrase.quantity} :</div>
                    <div class="pull-left mfrs1">1 ( 1 {$_phrase.left})</div>
                </div>
                <div class="clearfix pro_row">
                    <div class="pull-left ctxt_lbl">{$_phrase.buynow_price} :</div>
                    <div class="pull-left max_bid mfrs1">
                        <div>${$projects.bprice}</div>
                    </div>
                </div>
                <button class="btn bid_now" data-toggle="modal" data-target="#buybid "
                        onclick="window.location = '{$config[\'url\']}/product/buy/{$projects.id}'">{$_phrase.buynow}
                </button>
            </div>

        </div>
    </div>
</div>
<div class="modal confirmbid  fade" id="confirmbid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="/product/confirm/" method="post" enctype="multipart/form-data">
                <input type="hidden" name="wsprice" id="wsprice{$projects.id}" value="{$projects.wsprice}"/>
                <input type="hidden" name="id" value="{$projects.id}"/>

                <div class="modal-body">
                    <div class="confirmbid_header">{$_phrase.confirmbid_head}</div>
                    <div class="proc_title">{$projects.title}</div>
                    <div><img src="{$config.url}images/sam_product.png" alt=""></div>
                    <div class="clearfix pro_row">
                        <div class="pull-left ctxt_lbl">{$_phrase.time_left} :</div>
                        <div class="pull-left mfrs1"> {if $projects.market_status == 'open' or $projects.market_status
                            == 'draft'}
                            <h3 class="countdown" id="my1{$projects.id}">{$projects.day}</h3>
                            {else} {$_phrase.auction}{$_phrase.engspace}{$_phrase.closed}{/if}
                        </div>
                    </div>
                    <div class="clearfix pro_row">
                        <div class="pull-left ctxt_lbl">{$_phrase.bid_history} :</div>
                        <div class="pull-left mfrs1"><font class="sbid">{$bcnt}</font> {$_phrase.bid}{$_phrase.s}</div>
                    </div>
                    <div class="clearfix pro_row">
                        <div class="pull-left ctxt_lbl">{$_phrase.quantity} :</div>
                        <div class="pull-left mfrs1">1 ( 1 {$_phrase.left})</div>
                    </div>
                    <div class="clearfix pro_row">
                        <div class="pull-left ctxt_lbl">{$_phrase.your_max_bid} :</div>
                        <div class="pull-left max_bid mfrs1">
                            <div>$<font class="bamount bamount{$projects.id}">{$projects.wsprice}</font></div>
                        </div>
                    </div>
                    <button class="btn bid_now" data-toggle="modal" data-target="#confirmbid ">
                        {$_phrase.confirmbid_button}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file="common/footer-1.tpl" nocache}

<script>


    function meee(id, dateee, price) {
        // id = '126';
        // alert(dateee);
        clearInterval(clearvar[id]);
        clock[id] = document.getElementById('my' + id)
                , targetDate[id] = new Date(dateee); // Jan 1, 2050;

        clock[id].innerHTML = countdown(targetDate[id]).toString();
        clearvar[id] = setInterval(function () {
            if (targetDate['{$projects.id}'] > new Date()) {
                clock[id].innerHTML = countdown(targetDate[id]).toString();
                document.getElementById('my1' + id).innerHTML = countdown(targetDate[id]).toString();
            }
            else
                clock[id].innerHTML = '00H:00M:00S';
        }, 1000);
    }

    /* clock['{$projects.id}'] = document.getElementById('my{$projects.id}')
     , targetDate['{$projects.id}'] = new Date('{$projects.closed}');

     clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
     clearvar['{$projects.id}'] =  setInterval(function(){
     if(targetDate['{$val.id}']>new Date())
     clock['{$projects.id}'].innerHTML = countdown(targetDate['{$projects.id}']).toString();
     else
     clock['{$projects.id}'].innerHTML = 'Closed';

     }, 1000);*/
</script>
<script language="javascript" type="text/javascript">
    $(function () {
        $('.myp').addClass('act_class');
    });
    var pid = '{$projects.id}';
    var dt = '{$projects.closed}';
    var resultss = {
        id: pid,
        date: dt,
        price: '{$projects.wprice}',
        pric_l: $('.pric_l{$projects.id}').html(),
        bid_history: $('.bid_history{$projects.id}').html()
    };
    console.log(resultss);
    socket.on('bidAddtime', function (msg) {

        $('.pric_l' + msg.id).html(msg.pric_l);
        $('.bid_history' + msg.id).html(msg.bid_history);
        $('.sbid' + msg.id).html($('.lcntbid' + msg.id).html());
        $('.bamount' + msg.id).html(parseFloat(parseFloat(msg.price) + parseFloat({$config['general']['bidincrement']})).toFixed(2));
        numberformat();
        meee(msg.id, msg.date, msg.price);

    });

    socket.emit('bidAddtime', resultss);

    socket.on('autoBid', function (emits) {
        console.log(emits);
        var winner = $('.winner').length;
        if (winner == 0)
            $('.bid_his' + emits.pID).html('<div class="winner">' + emits.winner + '  $' + emits.wprice + '  (Autobid)</div>');
        else if (winner > 8) {
            $('.bid_his' + emits.pID + ' .winner:last').remove();
            $('.bid_his' + emits.pID).prepend('<div class="winner">' + emits.winner + '  $' + emits.wprice + '  (Autobid)</div>');
        }
        else
            $('.bid_his' + emits.pID).prepend('<div class="winner">' + emits.winner + '  $' + emits.wprice + ' (Autobid)</div>');

        $('.lcntbid' + emits.pID).html(parseInt($('.lcntbid{$projects.id}').html()) + 1);
        $('#wsprice' + emits.pID).val(emits.wprice);
        $('.pric_l .rtext' + emits.pID).html('$' + emits.wprice);
        $('.bamount' + emits.pID).html(parseFloat(parseFloat(emits.wprice) + parseFloat({$config['general']['bidincrement']})).toFixed(2));

        var increasesec = "{$config['general']['bidincreaseseconds']}";
        var t = new Date(emits.date);
        t.setSeconds(t.getSeconds() + parseInt(increasesec));
        meee(emits.pID, t, emits.wprice);
    });

</script>
<script type="text/javascript">
    $(function () {
        projectLoad();
        var sync1 = $(".main-preview");


        sync1.owlCarousel({
            singleItem: true,
            slideSpeed: 500,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
            pagination: false,
            responsiveRefreshRate: 200
        });


    });
</script>
{if $bidshow}
<script type="text/javascript">
    $(function () {
        $('#confirmbid').modal();
    });
</script>
{/if}
{if $buyshow}
<script type="text/javascript">
    $(function () {
        $('#buybid').modal();
    });
</script>
{/if}
