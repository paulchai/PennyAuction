{include file="common/header-1.tpl" nocache}
<div class="main_container">
    <div class="row dashboard">
        <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache}</div>
        <div class="col-md-9">
            <h4 class="ds_brd">Buy Now Transactions</h4>

            <div class="row mblue_box md_hide">
                <div class="col-md-3">Image</div>
                <div class="col-md-3">Title</div>
                <div class="col-md-3">{$_phrase.end}{$_phrase.engspace}{$_phrase.time}</div>
                <div class="col-md-3">Amount</div>
            </div>
            {if $mybuynow|count <= 0}
            <div class="col-md-12 text-center m-top-20 font-12">{$_phrase.noresultsfound}</div>
            {else}
            {foreach $mybuynow as $key => $val}
            <div class="row mblue_box1">
                <div data-label="Image" class="account_p_lbl col-md-3"><a href=""><img
                        src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}"
                        title="{$val.title}" width="65" height="65"></a></div>
                <div data-label="Title" class="account_p_lbl col-md-3"><a href="{$config['url']}/product/view/{$val.id}"
                                                                          title="{$val.ptitle}"> {$val.title}</a></div>
                <div data-label="End Time" class="account_p_lbl col-md-3">{$val.date_add}</div>
                <div data-label="Amount" class="account_p_lbl col-md-3">${$val.amount} <br/><br/> {if $val.amount>$val.paid and $val.paid>0} (Paid : ${$val.paid} , Discount : ${$val.discount} , Bid Credits
                    :${$val.bidcredits} ) {/if}
                </div>
            </div>
            {/foreach}
            {/if} {$pagination_html}
        </div>
    </div>
</div>
{include file="common/footer-1.tpl" nocache}