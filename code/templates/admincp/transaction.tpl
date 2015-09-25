{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Transactions</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Search</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Transactions</div>
            </div>

            <div class="row m-top-20">
                <form class="admin_form" data-parsley-validate method="get" enctype="multipart/form-data"
                      action="{$config.url}/admincp/transaction/list">

                    <div class="col-lg-4">

                        <div class="form-group">
                            <label for="userid">User Id</label>
                            <input class="form-control" name="userid" id="userid" value="{$search.userid}">

                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" name="status" id="status">
                                <option value="" {if $search.status==''} selected {/if}>All</option>
                                <option value="bid" {if $search.status=='bid'} selected {/if}>Bid</option>
                                <option value="package" {if $search.status=='package'} selected {/if}>Packages</option>
                                <option value="winner" {if $search.status=='winner'} selected {/if}>Winner</option>
                                <option value="sold" {if $search.status=='sold'} selected {/if}>Sold</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="projectid">Product Id</label>
                            <input class="form-control" value="{$search.projectid}" name="projectid" id="projectid">
                        </div>


                        <div class="form-group">
                            <label for="id">Transaction Id</label>
                            <input class="form-control" value="{$search.id}" name="id" id="id">
                        </div>


                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="from_date">From Date</label>
                            <input class="form-control date_picker" value="{$search.from_date}" name="from_date" id="from_date">
                        </div>


                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="to_date">To Date</label>
                            <input class="form-control date_picker" value="{$search.to_date}" name="to_date" id="to_date">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <br/>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col-md-6"><label>Net Revenue</label> : ${$total}</div>
                <div class="col-md-6"><a href="{$config.url}{$dlink}" class="text-blue">Download Report</a></div>
            </div>
            {include file="/admincp/transaction-list.tpl" nocache}

            <a href="/admincp/transaction/download?{$fquery}" class="btn btn-success btn-right"> Download Report </a>
            <!-- /.row -->
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#generaltabid').click();
    $(function () {
        Date.dayNames = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
        Date.format = 'mm/dd/yyyy';
        $("#from_date").datePicker({
            clickInput: false,
            createButton: false,
            showYearNavigation: false,
            showHeader: 2
        }).bind(
                'focus click keydown',
                function () {
                    $("#from_date").dpRerenderCalendar();
                    $("#from_date").dpSetStartDate('01/02/2012');
                    //$(obj).dpSetStartDate($("#funddater_"+curid).val());
                    $("#from_date").dpDisplay();
                }
        );

        $("#to_date").datePicker({
            clickInput: false,
            createButton: false,
            showYearNavigation: false,
            showHeader: 2
        }).bind(
                'focus click keydown',
                function () {
                    $("#to_date").dpRerenderCalendar();
                    $("#to_date").dpSetStartDate($("#from_date").val());
                    //$(obj).dpSetStartDate($("#funddater_"+curid).val());
                    $("#to_date").dpDisplay();
                }
        );
    });
</script>
<script type="text/javascript" src="{$config.url}/bower_components/datatables/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="{$config.url}/bower_components/datatables/media/css/jquery.dataTables.css"/>
<script type="text/javascript">
    $(function () {
        /*$("#transaction_history").DataTable();*/
    });
</script>