{include file="/admincp/header.tpl" nocache}
<link rel="stylesheet" href="{$config['url']}/css/stores.css" type="text/css"/>
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Manage Stores</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Stores</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Manage Store</div>
            </div>
            <!-- Page Heading -->

            <!--<div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li class="active"> <i class="fa fa-shopping-cart"></i> Stores </li>
            </ol>
          </div>
        </div>
        <div class="col-lg-12 asclr">  Stores > Add New Store  </div>-->
            <!-- /.row -->

            <!-- Karthik-->

            <div class="row">

                <div class="col-lg-12 pdbyan" style="padding-top:20px;">
                    <form method="get">
                        <input type="hidden" name="scmd" value="search">
                    <div class="col-lg-5">
                        <div class="font18pxne">Store Name</div>
                        <div>
                            <div class="form-group">
                                <input type="text" name="sname" value="{$get.sname}" class="form-control" id="exampleInputName2" placeholder=""
                                       style="width:65%">
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-3">
                        <div class="font18pxne">Store Category</div>
                        <div>
                            <select class="fordropdownon" name="scid">

                                <option value="0"> All </option>
                                {foreach $category as $key => $val}

                                <option value="{$val.id}" {if $get.scid == $val.id} selected {/if} > {$val.name} </option>

                                {/foreach}
                            </select>

                        </div>

                    </div>
                    <div class="col-lg-1">
                        <div style="margin-top:29px;">

                            <button type="submit" class="btn btn-success">Search</button>

                        </div>

                    </div>  </form>

                    <div class="col-lg-12 table-responsive">
                        <table style="width:100%">
                            <tr>
                                <th class="pdlstp10">Store Name</th>
                                <th>Status</th>
                                <th>Date Added</th>
                                <th>Date Closed</th>
                                <th>Items</th>
                                <th>Sold</th>
                                <th>Balance</th>
                                <th>Action</th>
                            </tr>
                            {foreach $stores as $val}
                            <tr>
                                <td class="pdlstp10 clddr3f8"> <a href="{$config['url']}/admincp/projects/list?storeid={$val.id}"> {$val.name} </a></td>
                                <td>{$val.status}</td>
                                <td>{$val.date_added}</td>
                                <td>{$val.date_closed}</td>
                                <td>0</td>
                                <td>0</td>
                                <td></td>
                                <td class="clddr3f8"> <a href="{$config['url']}/admincp/stores/edit/{$val.id}"> Edit </a> | <a href="{$config['url']}/admincp/stores/delete/{$val.id}">delete</a> </td>
                            </tr>
                            {/foreach}
                        </table>

                    </div>

                    <div class="col-lg-12">
                        <nav>
                            {$pagination_html}
                        </nav>
                    </div>


                </div>


                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#storestabid').click();
</script>