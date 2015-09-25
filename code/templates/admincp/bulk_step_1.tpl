{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Bulk Import</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Products</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Bulk Import</div>
            </div>
            <!-- Page Heading -->
            <!--<div class="row">
              <div class="col-lg-12">
                <ol class="breadcrumb">
                  <li class="active"> <i class="fa fa-laptop"></i> Products <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> Bulk Import </li>
                </ol>
              </div>
            </div>-->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12rem"> {if $error == 'saved'}
                    <div style="display:none;">
                        <iframe src="{$config.url}/product/view/{$projects.id}"></iframe>
                    </div>
                    <div class="alert alert-success"><strong>Saved!</strong> {$users.first_name} profile was
                        successfully changed.
                    </div>
                    {elseif $error != ''}
                    <div class="alert alert-danger"><strong>{$error}</strong></div>
                    {/if}
                </div>
                {if $csv|count ==0}
                <form enctype="multipart/form-data" action="{$config.url}/admincp/products/bulkupload" name="ilform"
                      accept-charset="UTF-8" method="post">
                    <table cellpadding="12" class="table-condensed" cellspacing="0" border="0" width="100%">
                        <tbody>
                        <tr class="alt1">
                            <td><input type="file" name="bulk_import" style="width:250px; font-family: verdana"></td>
                        </tr>
                        <tr>
                            <td>.csv (comma separated values) document format only</td>
                        </tr>
                        <tr class="alt2_top">
                            <td><a>
                                <button type="button"
                                        onclick="window.location='{$config.url}/admincp/products/samplecsv'"
                                        class="btn btn-success" style="font-size:14px"> Download Sample CSV
                                </button>
                            </a></td>
                        </tr>
                        <tr class="alt2_top">
                            <td><input type="submit" value=" Next step " class="btn btn-warning" {upload_style}=""
                                       style="font-size:14px"></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                {/if}


                {if $csv|count >0}
                <table cellpadding="12" class="table-condensed" cellspacing="0" border="0" width="100%">
                    <tbody>
                    <tr class="alt2_top">
                        <td>
                            <form enctype="multipart/form-data" action="{$config.url}/admincp/products/bulkupload"
                                  name="ilform" accept-charset="UTF-8" method="post">
                                <input type="hidden" name="csv" value="{$csvname}"/>
                                <input type="submit" value="SUBMIT PRODUCTS NOW" class="btn btn-success"
                                       style="font-size:14px">
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>project_title</th>
                            <th>Catgeory</th>
                            <th>Tag</th>
                            <th>Photo</th>
                            <th>Product Description</th>
                            <th>Buynow price</th>
                            <th>Reserve price</th>
                            <th>Market price</th>
                            <th>Is Buy Now</th>
                            <th>Is Featured</th>
                            <th>Shipping Amount</th>
                            <th>Shipping Information</th>
                            <th>Start Date</th>
                            <th>Ending Date</th>
                        </tr>
                        </thead>
                        <tbody>

                        {foreach $csv as $val}
                        <tr>
                            <td>{$val.project_title}</td>
                            <td>{$val.Catgeory}</td>
                            <td>{$val.Tag}</td>
                            <td><img src="{$val.Photo}" width="50" height="50" alt="1"/></td>
                            <td>{$val.Product_Description}</td>
                            <td>{$val.Buynow_price}</td>
                            <td>{$val.Reserve_price}</td>
                            <td>{$val.Market_price}</td>
                            <td>{$val.Is_Buy_Now}</td>
                            <td>{$val.Is_Featured}</td>
                            <td>{$val.Shipping_Amount}</td>
                            <td>{$val.Shipping_Information}</td>
                            <td>{$val.Start_Date}</td>
                            <td>{$val.Ending_Date}</td>
                        </tr>
                        {/foreach}
                        </tbody>

                    </table>
                </div>
                {/if}
            </div>
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#auctiontabid').click();
    $(function () {

        Date.dayNames = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
        Date.format = 'mm/dd/yyyy';
        $("#date_added").datePicker({
            clickInput: false,
            createButton: false,
            showYearNavigation: false,
            showHeader: 2
        }).bind(
                'focus click keydown',
                function () {
                    $("#date_added").dpRerenderCalendar();
                    $("#date_added").dpSetStartDate();
                    //$(obj).dpSetStartDate($("#funddater_"+curid).val());
                    $("#date_added").dpDisplay();
                }
        );

        $("#date_closed").datePicker({
            clickInput: false,
            createButton: false,
            showYearNavigation: false,
            showHeader: 2
        }).bind(
                'focus click keydown',
                function () {
                    $("#date_closed").dpRerenderCalendar();
                    $("#date_closed").dpSetStartDate($("#date_added").val());
                    //$(obj).dpSetStartDate($("#funddater_"+curid).val());
                    $("#date_closed").dpDisplay();
                }
        );

    });
</script>