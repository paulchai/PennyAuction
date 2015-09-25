{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">

            {if $get.storeid>0}
            {include file="/admincp/stores_view.tpl" nocache}
            {else}
            <div class="aw_thead">All Products</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Products</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>All Products</div>
            </div>
            {/if}
            <div class="row">
                <form class="admin_form" data-parsley-validate method="get" enctype="multipart/form-data"
                      action="{$config.url}/admincp/projects/list">

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input class="form-control" id="title" name="title" value="{$search.title}">
                            <input type="hidden" class="form-control" name="storeid" value="{$stores.id}">
                        </div>
                        <div class="form-group">
                            <label>Product ID</label>
                            <input class="form-control" value="{$search.id}" name="id">
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" name="status" id="status">
                                <option value="" {if $search.status==''} selected {/if}>All</option>
                                <option value="open" {if $search.status=='open'} selected {/if}>Open</option>
                                <!--<option value="seated"  {if $search.status == 'seated'} selected {/if}>Seated</option>-->
                                <option value="closed" {if $search.status=='closed'} selected {/if}>Closed</option>
                                <option value="sold" {if $search.status=='sold'} selected {/if}>Sold</option>
                                <option value="future" {if $search.status=='future'} selected {/if}>Future</option>
                                <option value="delete" {if $search.status=='delete'} selected {/if}>Deleted</option>

                            </select>
                        </div>


                        <div class="form-group">
                            <label for="auctiontype">Auction Type</label>
                            <select class="form-control" name="auctiontype" id="auctiontype">
                                <option value="" {if $search.auctiontype==''} selected {/if}>All</option>
                                <option value="penny" {if $search.auctiontype=='penny'} selected {/if}>penny</option>
                                <option value="seated" {if $search.auctiontype=='seated'} selected {/if}>seated</option>
                                <option value="stores" {if $search.auctiontype=='stores'} selected {/if}>stores</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <br/>
                            <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Search</button>
                        </div>
                    </div>
                </form>
            </div>
            {include file="/admincp/project-list.tpl" nocache}
            <!-- /.row -->
        </div>
    </div>
</div>

{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    var storeiDD = '{$get.storeid}';
    if (storeiDD > 0)
        $('#storestabid').click();
    else
        $('#auctiontabid').click();
</script>