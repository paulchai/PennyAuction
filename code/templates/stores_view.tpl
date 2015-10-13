{include file="common/header-1.tpl" nocache}
<div class="row">
    <div class="container pdtpm30">
        <div class="row">
            <div class="col-md-12 padbtrum30pxon">
                <div class="col-md-6">
                    <div class="col-md-12">
                        Home > stores > {$stores.name}
                    </div>
                </div>
            </div>

            <div class="col-md-12 padbtrum30pxon">

                <div class="col-md-3">
                    <div class="col-md-12">
                        <img src="{if $stores.avatar == ''} {$config['imgpath']}no_img.png {else if $stores.avatar != ''}{$config['imgpath']}stores/{$stores.avatar}{/if}"
                             alt="1" class="img-thumbnail">
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="forstore22"> {$stores.name}</div>
                    <div class="mid_consote">{$stores.description}</div>
                </div>


            </div>


            <div class="col-md-12">
                <div class="col-md-3">

                    <div class="col-md-12 pdtpm30">
                        <div class="whiteborbg3">
                            <div class="whitehead4">{$_phrase.categories}</div>
                            {foreach $category as $key => $val}

                            <div class="checkbox m5mrgpz">
                                <label>
                                    <input type="checkbox" value="{$val.id}">
                                    {$val.name}
                                </label>
                            </div>

                            {/foreach}


                        </div>
                    </div>


                </div>


                <div class="col-md-9">
                    <div class="scnddivbr"></div>

                    <div class="col-md-12">

                        {foreach $projects as $key => $val}

                        <div class="col-md-4 padbtrum30pxon">
                            <a href="{$config.url}/product/view/{$val.id}"> <img
                                    src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}"
                                    style="max-width: 250px;max-height: 200px" alt="1"> </a>

                            <div class="divone21"><a href="{$config.url}/product/view/{$val.id}">{$val.title}</a></div>
                            <div class="col-md-4 ftsiz18">${$val.wprice}</div>
                            <div class="col-md-1">
                                <a href="{$config.url}/product/view/{$val.id}">
                                    <button type="button" class="btn btn-primary pribtnon">Buy Now</button>
                                </a>
                            </div>
                        </div>

                        {/foreach}

                    </div>


                    <div class="col-md-10">{$pagination_html}</div>


                </div>


            </div>
        </div>


    </div>
</div>
{include file="common/footer-1.tpl" nocache}