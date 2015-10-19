{include file="/common/header-1.tpl" nocache}
<link href="{$config['url']}/assets/css/custom.css" rel="stylesheet">

<!-- Owl Carousel Assets -->
<link href="{$config['url']}/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="{$config['url']}/owl-carousel/owl.theme.css" rel="stylesheet">
<style>
    .row .row {
        width: auto;
    }

    #owl-demo .item img {
        display: block;
        width: 100%;
        height: auto;
    }

    #owl-demo .item img {
        width: 100%;
        max-width: 880px;
        margin: 0 auto;
    }

    .ontimwid {
        width: 6%;
    }

    @media screen and (max-width: 990px) {
        .ipm0px {
            padding: 10px;
        }
    }

    @media screen and (max-width: 390px) {
        .fotdi6 {
            min-height: 63px !important;
        }

        .futexcen1 {
            padding-left: 112px;
        }
    }

    @media screen and (max-width: 770px) {
        #owl-demo .item img {
            width: 100%;
            margin-left: 0;
        }

    }

    @-moz-document url-prefix() {
        .ontimwid {
            width: -1px !important;
        }
    }
</style>

<div class="col-md-12" style="margin-top:-21px;">
    <div id="demo">
        <div class="row">

            <div class="span12">

                <div id="owl-demo" class="owl-carousel">

                    {foreach from=$banners item=banner}
                    <li><div class="item"><img src="{$config['url']}/image/{$banner}" alt="The Last of us"></div></li>
                    {/foreach}

                </div>
            </div>
        </div>
    </div>
</div>

<div class="row ftmdpro">
    <div class="col-md-12 fotdi6">

        <div class="col-md-6 pull-left futexcen1" style="margin-top: 8px;"> {$_phrase.live}{$_phrase.engspace}{$_phrase.auction}{$_phrase.s}</div>
        <div class="col-md-3 pull-right auto_width" style="margin-top: 8px;"><span>{$_phrase.sortby}:</span>
            <select onchange="searchitems(this)">
                <option value="01" {if $get.sort=='01'}selected {/if} >{$_phrase.time}: {$_phrase.newlylisted}</option>
                <option value="02" {if $get.sort=='02'}selected {/if}>{$_phrase.time}: {$_phrase.endingsoonest}</option>
                <option value="03" {if $get.sort=='03'}selected {/if}>{$_phrase.price}: {$_phrase.lowestfirst}</option>
                <option value="04" {if $get.sort=='04'}selected {/if}>{$_phrase.price}: {$_phrase.highestfirst}</option>
            </select>
        </div>

    </div>
    <div class="col-md-12 ipm0px">
        {assign var="proj" value=$projects.open_project}
        {include file="projects-new.tpl" nocache}
        {if $projects.open_project|count==16}
        <div class="two cursor" onclick="window.location='{$config[\'url\']}/live'" style="margin:0;margin-bottom:10px">
            {$_phrase.viewall}
        </div>
        {/if}
    </div>
</div>


{if $seated  and  $projects.seated_project|count>0}
<div class="row ftmdpro">
    <div class="col-md-12 fotdi6">

        <div class="col-md-6 pull-left futexcen1" style="margin-top: 8px;">{$_phrase.seated_auction}</div>
        <!--<div class="col-md-3 pull-right auto_width" style="margin-top: 8px;"><span>{$_phrase.sortby}:</span>
        <select onchange="searchitems(this)">
          <option value="01" {if $get.sort == '01'}selected {/if} >{$_phrase.time}: {$_phrase.newlylisted}</option>
          <option  value="02" {if $get.sort == '02'}selected {/if}>{$_phrase.time}: {$_phrase.endingsoonest}</option>
          <option value="03" {if $get.sort == '03'}selected {/if}>{$_phrase.price}: {$_phrase.lowestfirst}</option>
          <option  value="04" {if $get.sort == '04'}selected {/if}>{$_phrase.price}: {$_phrase.highestfirst}</option>
        </select>
        </div>-->

    </div>


    <div class="col-md-12 ipm0px">
        {assign var="proj" value=$projects.seated_project}
        {include file="projects-new-seated.tpl" nocache}
        {if $projects.open_project|count==16}
        <div class="two cursor" onclick="window.location='{$config[\'url\']}/live'" style="margin:0;margin-bottom:10px">
            {$_phrase.viewall}
        </div>
        {/if}
    </div>
</div> {/if}


<script>

    function meee(id, dateee, price) {

        clearInterval(clearvar[id]);
        clock[id] = document.getElementById('my' + id);
        targetDate[id] = new Date(dateee); // Jan 1, 2050;

        clock[id].innerHTML = countdown(targetDate[id]).toString();
        document.getElementById('price' + id).innerHTML = price;
        clearvar[id] = setInterval(function () {

            if (targetDate[id] > new Date())
                clock[id].innerHTML = countdown(targetDate[id]).toString();
            else
                clock[id].innerHTML = '00H:00M:00S';
        }, 1000);

    }

    socket.on('bidAddtime', function (msg) {
        meee(msg.id, msg.date, msg.price);

    });

    socket.on('autoBid', function (emits) {

        var increasesec = "{$config['general']['bidincreaseseconds']}";
        var t = new Date(emits.date);
        t.setSeconds(t.getSeconds() + parseInt(increasesec));
        meee(emits.pID, t, emits.wprice);
        $('.wprice' + emits.pID).html(emits.wprice);
        //meee(msg.id,msg.date,msg.price);

    });

</script>

<script>
    $(document).ready(function () {

        var time = 5; // time in seconds

        var $progressBar,
                $bar,
                $elem,
                isPause,
                tick,
                percentTime;

        //Init the carousel
        $("#owl-demo").owlCarousel({
            slideSpeed: 500,
            paginationSpeed: 500,
            singleItem: true,
            afterInit: progressBar,
            afterMove: moved
        });

        //Init progressBar where elem is $("#owl-demo")
        function progressBar(elem) {
            $elem = elem;
            //build progress bar elements
            buildProgressBar();
            //start counting
            start();
        }

        //create div#progressBar and div#bar then prepend to $("#owl-demo")
        function buildProgressBar() {
            $progressBar = $("<div>", {
                id: "progressBar"
            });
            $bar = $("<div>", {
                id: "bar"
            });
            $progressBar.append($bar).prependTo($elem);
        }

        function start() {
            //reset timer
            percentTime = 0;
            isPause = false;
            //run interval every 0.01 second
            tick = setInterval(interval, 10);
        }

        function interval() {
            if (isPause === false) {
                percentTime += 1 / time;
                $bar.css({
                    width: percentTime + "%"
                });
                //if percentTime is equal or greater than 100
                if (percentTime >= 100) {
                    //slide to next item
                    $elem.trigger('owl.next')
                }
            }
        }

        //pause while dragging 
        function pauseOnDragging() {
            isPause = true;
        }

        //moved callback
        function moved() {
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
<!--<script>
    // create instance
    window.onload = function() {
        // setup CountUp object
        jetportamount = new CountUp('jetportamount', 0, {$jetport}, 0, 2.5);
        jetportamount.start();
        if ($('userjetport').length > 0) {
            userjetport = new CountUp('userjetport', {$userbalance.jetport}, {$userbalance.jetport}, 0, 2.5);
        }

    }

</script>-->
{include file="/common/footer-1.tpl" nocache}	