<style>
    .infm {
        width: 100%;
        height: 206px;
    }

    .infm2 {
        max-width: 100%;
        max-height: 182px;
    }

    .row .row {
        width: auto;
    }
</style>

<script src="{$config.url}/js/countdown.js"></script>
<script>  var clock = [];
var targetDate = [];
var clearvar = []; </script>
<div class="row home_aproduct ftmdpro" style="margin-top:5px">
    {foreach $proj as $key => $val}

    <div class="col-xs-6 col-sm-6 col-md-3 onlycenr2">
        <div class="thumbnail">
            <div class="two">{$val.ptitle}</div>
            <a class="pull-left infm" href="{$config[\'url\']}/product/view/{$val.id}">
                <img class="media-object infm2"
                     src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}"
                     alt="{$val.title}"/> </a>

            <div class="fotdi3"> $ <span id="price{$val.id}" class="wprice{$val.id}">{$val.wprice}</span></div>
            <div class="fotdi4 pro_time" id="my{$val.id}">00 : 00 : 00</div>
            <script>
                clock['{$val.id}'] = document.getElementById('my{$val.id}');
                targetDate['{$val.id}'] = new Date('{$val.closed}');

                clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
                clearvar['{$val.id}'] = setInterval(function () {
                    if (targetDate['{$val.id}'] > new Date())
                        clock['{$val.id}'].innerHTML = countdown(targetDate['{$val.id}']).toString();
                    else
                        clock['{$val.id}'].innerHTML = 'Closed';
                }, 1000);
            </script>

            {if $val.status == 'open'}
            {if $pageofjs != '/shop' AND $pageofjs != '/future'}
            <button type="button" class="finbum" onclick="window.location = '{$config[\'url\']}/product/bid/{$val.id}'">
                {$_phrase.bid_now}
            </button>
            {elseif $pageofjs == '/shop'}
            <button type="button" class="finbum"
                    onclick="window.location = '{$config[\'url\']}/product/buynow/{$val.id}/ship'">{$_phrase.buynow}
            </button>
            {/if}
            {elseif $pageofjs == '/future'}
            <button type="button" class="finbum"
                    onclick="window.location = '{$config[\'url\']}/product/buynow/{$val.id}/ship'">{$_phrase.view_details}
            </button>
            {elseif $val.status == 'sold'}
            <button type="button" class="finbum" onclick="window.location = '{$config[\'url\']}/product/view/{$val.id}'">
                {$_phrase.sold}
            </button>
            {elseif $val.status != 'sold'}
            <button type="button" class="finbum" onclick="window.location = '{$config[\'url\']}/product/view/{$val.id}'">
                {$_phrase.closed}
            </button>
            {/if}
            <div class="fotdi7">
                <div class="fotdi5">{$_phrase.description}</div>
                <div style="height: 19px;overflow:hidden;color:#428bca;line-height: 20px;">{$val.description}</div>
            </div>

        </div>
    </div>
    {/foreach}
</div>