{include file="common/header-1.tpl" nocache}
<style>
    .dashboard .col-md-8 {
        width: 66.66666667% !important;
    }
</style>
<div class="main_container">
    <div class="row dashboard">
        <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache}</div>
        <div class="col-md-9">
            <form name="setautobid" id="setautobid" action="/dashboard/autobid" method="post" autocomplete="off">

                {if $aData.id > 0}
                <input type="hidden" name="aid" value="{$aData.id}"/>
                {/if}
                <h4 class="ds_brd">{$_phrase.auto_bid}</h4>
                {if $aData.id > 0}
                {else}
                <div class="row">
                    <div class="form-group">
                        <label for="project_id" class="col-md-4">{$_phrase.choose_an_auction} :</label>

                        <div class="col-md-8">
                            <select name="project_id" class="form-control" id="project_id" required>
                                <option value="">{$_phrase.select}{$_phrase.engspace}{$_phrase.product}</option>
                                {foreach $project as $val}
                                <option value="{$val.id}">{$val.title} - #{$val.id}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
                {/if}
                <div class="row">
                    <div class="form-group">
                        <label for="maxbids" class="col-md-4">{$_phrase.maximum_bid_count} :</label>

                        <div class="col-md-8">
                            <input type="text" id="maxbids" name="maxbids"
                                   placeholder="{$_phrase.enter_your_maximum_bid_count}" value="{$aData.maxbids}" maxlength="20"
                                   class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="start_amount" class="col-md-4">{$_phrase.activate_at} ($) * :</label>

                        <div class="col-md-8">
                            <input type="text" id="start_amount" name="start_amount"
                                   placeholder="{$_phrase.enter_your_autobid_start_product_price}" value="{$aData.start_amount}"
                                   maxlength="20" class="form-control" required>
                            <!--<div class="abid_lbl">Auto bid start bid when reach your product current price</div>-->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="bidstategy" class="col-md-4"> {$_phrase.bidding_strategy} :</label>

                        <div class="col-md-8">
                            <input type="hidden" id="bidstategy" name="bidstategy"
                                   value="{$config['general']['autobid_seconds']}" checked="checked"
                                   readonly="readonly">
                            <label> {$_phrase.bid_within_last1} {$config['general']['autobid_seconds']} {$_phrase.bid_within_last2} </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-8">
                        <button class="btn save_btn" type="submit">{$_phrase.set_autoBid}</button>
                        <!--<div class="abid_lbl">{$_phrase.no_autobid_products_at_the_moment}</div>-->
                    </div>
                </div>
            </form>


            {if $aData.id > 0}
            {else}
            <h4 class="ds_brd">{$_phrase.active_autobids}</h4>

            <div class="row mblue_box md_hide">
                <div class="row mblue_box m-top-20">
                    <div class="col-md-2">{$_phrase.title}</div>
                    <div class="col-md-2 text-center">{$_phrase.maxbids}</div>
                    <div class="col-md-2 text-center">{$_phrase.bidsused}</div>
                    <div class="col-md-2 text-center">{$_phrase.bid_amt}</div>
                    <div class="col-md-2 text-center"> {$_phrase.status}</div>
                    <div class="col-md-2 text-center"> {$_phrase.options}</div>
                </div>
            </div>
            {if $Autobids|count <= 0}
            <div class="col-md-12 text-center m-top-20 font-12">{$_phrase.noresultsfound}</div>
            {else}
            {foreach $Autobids as $key => $alist}
            <div class="row mblue_box1" style="background:none">
                <!--<div class="col-md-3"><a href=""><img src="{if $alist.avatar == ''} {$config['imgpath']}no_img.png {else if $alist.avatar != ''}{$config['imgpath']}product/{$alist.avatar}{/if}" title="{$alist.title}" width="65" height="65"></a></div>-->
                <div data-label="Title" class="account_p_lbl col-md-2"><a
                        href="{$config['url']}/product/view/{$alist.id}" title="{$val.ptitle}"> {$alist.title}</a></div>
                <div data-label="Maxbids" class="account_p_lbl col-md-2 text-center"> {$alist.maxbids}</div>
                <div data-label="Bids Used" class="account_p_lbl col-md-2 text-center">{$alist.bids}</div>
                <div data-label="Bid Amount" class="account_p_lbl col-md-2 text-center">${$alist.wprice}</div>
                <div data-label="Status" class="account_p_lbl col-md-2 text-center"> {if $alist.start_amount
                    >$alist.wprice} Starting amount not reached {elseif $alist.start_amount <=$alist.wprice} Active
                    {/if}
                </div>
                <div data-label="Options" class="account_p_lbl  col-md-2 text-center"><a title="View"
                                                                                         onclick="PopupBox('{$config[\'url\']}/dashboard/autobidremove/{$alist.aid}','Are you sure?');"
                                                                                         href="javascript:void(0)">{$_phrase.remove}</a>
                    &nbsp;&nbsp;&nbsp;<a title="View" href="{$config['url']}/dashboard/autobid/{$alist.aid}">{$_phrase.edit}</a>
                </div>
            </div>
            {/foreach}
            {/if}
            <div style="clear:both"></div>
            <h4 class="ds_brd m-top-20">{$_phrase.stopped_autobids}</h4>

            <div class="row mblue_box m-top-20 md_hide">
                <div class="col-md-2">{$_phrase.title}</div>
                <div class="col-md-2 text-center">{$_phrase.maxbids}</div>
                <div class="col-md-2 text-center">{$_phrase.bidsused}</div>
                <div class="col-md-2 text-center">{$_phrase.bid_amt}</div>
                <div class="col-md-2 text-center"> {$_phrase.status}</div>
                <div class="col-md-2 text-center"> {$_phrase.options}</div>
            </div>

            {if $AutobidsClosed|count <= 0}
            <div class="col-md-12 text-center m-top-20 font-12">{$_phrase.noresultsfound}</div>
            {else}
            {foreach $AutobidsClosed as $key => $alist}
            <div class="row mblue_box1" style="background:none">
                <!--<div class="col-md-3"><a href=""><img src="{if $alist.avatar == ''} {$config['imgpath']}no_img.png {else if $alist.avatar != ''}{$config['imgpath']}product/{$alist.avatar}{/if}" title="{$alist.title}" width="65" height="65"></a></div>-->
                <div data-label="Title" class="account_p_lbl col-md-2"><a
                        href="{$config['url']}/product/view/{$alist.id}"
                        title="{$val.ptitle}"> {$alist.title}</a></div>
                <div data-label="Maxbids" class="account_p_lbl col-md-2 text-center"> {$alist.maxbids}</div>
                <div data-label="Bids Used" class="account_p_lbl col-md-2 text-center">{$alist.bids}</div>
                <div data-label="Bid Amount" class="account_p_lbl col-md-2 text-center">${$alist.bidamount}</div>
                <div data-label="Status" class="account_p_lbl col-md-2 text-center"> {if $alist.bids >= $alist.maxbids}
                    Limit reached {elseif $alist.bids < $alist.maxbids} {$_phrase.auction}{$_phrase.engspace}{$_phrase.closed} {/if}
                </div>
                <div data-label="Options" class="account_p_lbl col-md-2 text-center"><a title="View"
                                                                                        onclick="PopupBox('{$config[\'url\']}/dashboard/autobidremove/{$alist.aid}','Are you sure?');"
                                                                                        href="javascript:void(0)">{$_phrase.remove}</a>
                </div>
            </div>
            {/foreach}
            {/if} {/if}
        </div>
    </div>
</div>
<script src="{$config['url']}/bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script>
    $(document).ready(function () {
        $.validator.setDefaults({
            errorElement: "span",
            errorClass: "help-block",
            highlight: function (element, errorClass, validClass) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length || element.prop('type') === 'checkbox' || element.prop('type') === 'radio') {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

        $("#setautobid").validate({
            rules: {
                project_id: "required",
                maxbids: {
                    required: true,
                    number: true
                },
                start_amount: {
                    required: true,
                    number: true
                }
            },
            messages: {
                project_id: "Choose Product",
                maxbids: {
                    required: "Enter maximum bid count",
                    number: "Only bid count in number is accepted"
                },
                start_amount: {
                    required: "Enter Auto bid start product price",
                    number: "Only bid count in number is accepted"
                }
            }
        });
    });
</script>
{include file="common/footer-1.tpl" nocache}