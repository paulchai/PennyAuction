{include file="/admincp/header.tpl" nocache}
<link rel="stylesheet" type="text/css" href="{$config.url}/css/jquery.datetimepicker.css"/>
<div class="main_container admin_wrapper"> {include file="/admincp/left-nav.tpl" nocache}
    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">{$action} Product</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Products</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>{$action} Product</div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    {if $error == 'saved'}
                    <div style="display:none;">
                        <iframe src="{$config.url}/product/view/{$projects.id}"></iframe>
                    </div>
                    <div class="alert alert-success"> <!--<strong>Saved!</strong>--> Product saved successfully
                    </div>
                    {elseif $error != ''}
                    <div class="alert alert-danger"><strong>{$error}</strong></div>
                    {/if}
                </div>
                <form method="POST" enctype="multipart/form-data" class="admin_form"
                      name="add-product" id="add-product" action="/admincp/products/save" autocomplete="off">
                    <div class="col-lg-6">
                        <input type="hidden" value="{$projects.id}" name="id"/>
                        <input type="hidden" value="{$get.storeid}" name="storeid" id="storeid"/>
                        <input type="hidden" value="{$projects.category_id}" name="cid" id="cid"/>

                        <div class="form-group">
                            <label for="product_name">Product Name</label>
                            <input name="title" id="product_name"
                                   value="{$projects.title}" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="product_category">Category</label>
                            <select class="form-control" name="mcid" id="product_category">
                                <option value="">Please Select Category</option>
                                {foreach $category as $key => $val}
                                {if $val.parent_id == 0}
                                <option value="{$val.id}" {if $projects.category_id== $val.id}selected{/if}>{$val.name}</option>
                                {/if}
                                {/foreach}
                            </select>
                            <select class="form-control exclude" style="margin-top:20px" name="scid">
                                <option value="">Please Select Sub Category</option>
                                {foreach $category as $key => $val}
                                {if $val.parent_id > 0}
                                <option value="{$val.id}" {if $projects.category_id== $val.id}selected{/if} style="display:none" pid="{$val.parent_id}">{$val.name}</option>
                                {/if}
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tags">Tag</label>
                            <input class="form-control" name="tags" id="tags" value="{$projects.tags}" type="text"/>
                        </div>
                        <div class="form-group">
                            <label>Photo</label>
                            <br/>
                            {if $image == ""}
                            <div class="pro_image">
                                <img src="{$config.url}/uploads/no_img.png" alt="No Image" width="82" title="No Image" height="83"/>
                            </div>
                            {else/}
                            {foreach $image as $key2 => $val2}
                            <div class="pro_image pro_image_{$val2.id}"><img
                                    src="{if $val2.avatar == '' or $val2.avatar == null} {$config.url}/uploads/no_img.png {else if $val2.avatar != ''}{$config['imgpath']}product/{$val2.avatar}{/if}"
                                    width="82" title="{$projects.title}" height="83" alt="{$val2.title}">
                                <input type="hidden" name="image_id[]" value="{$val2.id}"/>
                                <input type="hidden" name="image[]" value="{$val2.image}"/>
                                <input type="hidden" name="avatar[]" value="{$val2.avatar}"/>
                                <a href="javascript:void(0);" onclick="$('.pro_image_{$val2.id}').remove();">
                                    Delete </a></div>
                            {/foreach}
                            {/if}
                            <div id="dvPreview" style="padding:10px;"></div>
                            <div>
                                <input name="product_image" type="file" class="file-upload fileupload-input" multiple>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="product_info">Product Description</label>
                            <textarea class="form-control count_numbers" name="description" id="product_info"
                                      style="height:300px;">{$projects.description}</textarea>
                        </div>
                    </div>
                    <div class="col-md-6"> {if $seated}
                        <div class="form-group">
                            <label for="auctionType">Auction Type</label>
                            <select class="form-control" name="auctionType"
                                    style="width:270px; height:30px;" id="auctionType">
                                <option value="">Select Auction Type</option>
                                <option value="penny">Penny Auction</option>
                                <option value="seated">Seated Auction</option>
                                {if $get.storeid>0 || $projects.auctionType == 'stores'}
                                <option value="stores" selected="selected">Stores</option>
                                {/if}
                            </select>
                        </div>
                        <div class="form-group seated">
                            <label>Total Seats : </label>
                            <input name="seats" id="seats" class="form-control"
                                   required maxlength="20" placeholder="0.00" value="{$projects.seats}" type="text">
                        </div>
                        <div class="form-group seated">
                            <label>Seat Amount : </label>
                            <input name="seatAmount" id="seatAmount" class="form-control"
                                   required maxlength="20" placeholder="0.00"
                                   value="{$projects.seatAmount}" type="text">
                        </div>
                        {/if}
                        <div class="form-group penny">
                            <label>Buynow price ($) :</label>
                            <input name="bprice" id="bprice" class="form-control"
                                   maxlength="20" placeholder="0.00" value="{$projects.bprice}" type="text">
                        </div>
                        <div class="form-group penny">
                            <label>Reserve price ($) :</label>
                            <input name="rprice" id="rprice" class="form-control"
                                   maxlength="20" placeholder="0.00" value="{$projects.rprice}" type="text">
                        </div>
                        <div class="form-group">
                            <label>Market price ($) :</label>
                            <input name="mprice" id="mprice" class="form-control"
                                   placeholder="0.00" value="{$projects.mprice}" type="text">
                        </div>
                        <div class="form-group penny">
                            <label for="buynow">Enhancement</label>

                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <input style="float:left;" name="buynow" id="buynow" value="1" type="checkbox" {if
                                           $projects.buynow} checked {/if} data-parsley-group="block1" class="">
                                    &nbsp;Buy Now
                                </div>
                                <div class="col-lg-6" style="display:none">
                                    <input style="float:left;" name="feature" id="feature" value="1" type="checkbox" {if
                                           $projects.feature} checked {/if} data-parsley-group="block1" class="">
                                    &nbsp;Featured
                                </div>
                            </div>
                        </div>
                        <div class="form-group m-top-10"><br/>
                            <label for="shipping_fee">Shipping Amount ($) :</label>
                            <input name="shipping_fee" id="shipping_fee" class="form-control"
                                   maxlength="12" value="{$projects.shipping_price}" type="text">
                        </div>
                        <div class="form-group">
                            <label for="shipping_info">Shipping Information</label>
                            <input type="text" name="shipping_description" class="form-control" id="shipping_info"
                                   value="{$projects.shipping_description}"/>
                        </div>
                        <div class="form-group">
                            <label for="datetimepicker_mask" style="padding-right: 14px;">Start Date</label>
                            <input name="date_added" id="datetimepicker_mask"
                                   class="form-control"
                                   placeholder="MM/DD/YYYY HH:MM:SS"
                                   maxlength="20" value="{$projects.start}" type="text">
                        </div>
                        <div class="form-group">
                            <label for="enddate">Ending Date</label>
                            <input name="date_closed" id="enddate"
                                   class="form-control enddate"
                                   placeholder="MM/DD/YYYY HH:MM:SS"
                                   maxlength="20" value="{$projects.close}" type="text">
                        </div>
                        <input name="submit_user_profile" class="btn btn-warning" value="Reset" title="Reset"
                               type="reset">
                        <button name="admin_product_add" class="btn btn-success" title="Add" type="button"
                                onclick="postProduct()"> Add
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">

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
<script src="{$config.url}/bower_components/moment/moment.js"></script>
<script src="{$config.url}/js/jquery.datetimepicker.js"></script>
<script src="{$config.url}/bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script src="{$config.url}/bower_components/ckeditor/ckeditor.js"></script>
<script>
    $('#auctiontabid').click();

    var serverdate = '{$serverdate}';
    d = servdate = new Date(serverdate);
    //alert(d.getHours());
    var logic = function (currentDateTime) {
        // 'this' is jquery object datetimepicker

        // alert(d.getDate());
        if (currentDateTime.getDate() == servdate.getDate()) {
            this.setOptions({
                minTime: addZero(servdate.getHours()) + ':' + addZero(servdate.getMinutes())
            });
        } else
            this.setOptions({
                minTime: '00:00'
            });
    };

    function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
    var s = '{$projects.start}';
    var pid = '{$projects.id}';
    if (pid > 0)
        d = new Date(s);
    /*else
     s = d;*/

    //alert(d.getHours());
    jQuery('#datetimepicker_mask').datetimepicker({
        // value: s,
        onChangeDateTime: logic,
        onShow: logic,
        format: 'm/d/Y H:i:s',
        step: 1,
        // mask:'9999/19/39 29:59',
        // value: new Date(s),
        //defaultSelect:true,
        defaultTime: addZero(d.getHours()) + ':' + addZero(d.getMinutes()),
        minTime: addZero(d.getHours()) + ':' + addZero(d.getMinutes()),
        minDate: new Date(serverdate)
    });

    var e = '{$projects.close}';

    if (pid > 0)
        d = new Date(e);
    /*else
     s = d;*/

    jQuery('.enddate').datetimepicker({
        // value: e,
        onChangeDateTime: logic,
        onShow: logic,
        format: 'm/d/Y H:i:s',
        step: 1,
        // mask:'9999/19/39 29:59',
        // value: new Date(e),
        defaultTime: addZero(d.getHours()) + ':' + addZero(d.getMinutes()),
        minTime: addZero(d.getHours()) + ':' + addZero(d.getMinutes()),
        minDate: new Date(serverdate)
    });


    CKEDITOR.replace('product_info');


    $(document).ready(function () {
        navigator.sayswho = (function () {
            var ua = navigator.userAgent, tem,
                    M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
            /* if(/trident/i.test(M[1])){
             tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
             return 'IE '+(tem[1] || '');
             }*/

            if (M[1] === 'Safari') {
                $('.fileupload-input').removeAttr("multiple");
            }
            M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
            if ((tem = ua.match(/version\/(\d+)/i)) != null) M.splice(1, 1, tem[1]);
            return M.join(' ');
        })();
    });

    $(function () {
        $("#dvPreview").html("");
        $(".fileupload-input").change(function () {
            $(".pro_image").detach();
            if (typeof (FileReader) != "undefined") {
                var dvPreview = $("#dvPreview");
                dvPreview.html("");
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    if (regex.test(file[0].name.toLowerCase())) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var img = $("<img />");
                            img.attr("style", "height:100px;width: 100px;margin:10px");
                            img.attr("src", e.target.result);
                            dvPreview.append(img);
                        };
                        reader.readAsDataURL(file[0]);
                    } else {
                        alert(file[0].name + " is not a valid image file.");
                        dvPreview.html("");
                        return false;
                    }
                });
            } else {
                alert("This browser does not support HTML5 FileReader.");
            }
        });
    });


    $('.seated').hide();
    $('.seated input').addClass('noparsely');

    var id = '{$projects.id}';
    if (id > 0) {
//$('.penny').hide();
        //$('.seated input').addClass('noparsely');
        var auctionType = '{$projects.auctionType}';
        if (auctionType == 'seated')
            $('.seated').show();
        //else
        //$('.penny').show();

        $('#auctionType').val(auctionType);

    }


    $('#auctionType').change(function () {
        $('.seated').hide();
        //$('.penny').hide();
        $('#add-product').find('.noparsely').removeClass('noparsely');
        var atype = $(this).val();
        if (atype == 'seated') {
            $('.seated').show();
            //$('.penny input').addClass('noparsely');

        }
        else {
            //$('.penny').show();
            $('.seated input').addClass('noparsely');
        }


    });


    $('select[name="mcid"]').on('change', function () {
        $('select[name="scid"] option').hide();
        $('select[name="scid"] option:first').show();
        $('select[name="scid"] option[selected]').removeAttr('selected');
        var scatLength = $('select[name="scid"] option[pid="' + $(this).val() + '"]').length;
        if (scatLength > 0) {
            $('select[name="scid"]').show();
            $('select[name="scid"]').removeClass('exclude');
            $('select[name="scid"] option[pid="' + $(this).val() + '"]').show();
            // console.log($(this).val());
            $('select[name="scid"] option[pid="' + $(this).val() + '"]:first').attr('selected', true);
        }
        else {
            $('select[name="scid"]').addClass('exclude');
            $('select[name="scid"]').next('ul').find('li').html('');
            $('select[name="scid"]').hide();
        }

    });


    if (id > 0) {

        var scid = $('select[name="scid"]').val();
        if (scid > 0) {
            mccat = $('select[name="scid"] option[value="' + scid + '"]').attr('pid');
            $('select[name="mcid"]').val(mccat);

            $('select[name="scid"] option[pid="' + mccat + '"]').show();
            //  $('select[name="mcid"]').trigger("change");
            //  $('select[name="scid"]').val(scid);
        }

    }
    function postProduct() {
        var scid = $('select[name="scid"]').val();
        var mcid = $('select[name="mcid"]').val();

        //alert(scid);
        if (scid > 0)
            $('#cid').val(scid);
        else
            $('#cid').val(mcid);

        $('#add-product').submit();

    }

</script>
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
        $.validator.addMethod('le', function (value, element, param) {
            return parseFloat(value) <= parseFloat($(param).val());
        });
        $.validator.addMethod('ge', function (value, element, param) {
            return parseFloat(value) >= parseFloat($(param).val());
        });
        $.validator.addMethod('greaterThanStartDate', function (value, element, param) {
            return moment(value, "MM/DD/YYYY HH:mm:ss") > moment($(param).val(), "MM/DD/YYYY HH:mm:ss");
        });
        $("#add-product").validate({
            rules: {
                title: {
                    required: true,
                    maxlength: 99
                },
                mcid: "required",
                product_category: "required",
                tags: {
                    required: true,
                    maxlength: 100
                },
                description: {
                    required: true
                },
                auctionType: {
                    required: true
                },
                bprice: {
                    required: true,
                    number: true,
                    maxlength: 20
                },
                rprice: {
                    required: true,
                    number: true,
                    maxlength: 20,
                    le: '#bprice'
                },
                mprice: {
                    required: true,
                    number: true,
                    maxlength: 20,
                    ge: "#bprice"
                },
                shipping_fee: {
                    required: true,
                    number: true,
                    maxlength: 20
                },
                shipping_description: {
                    required: true
                },
                date_added: "required",
                date_closed: {
                    required: true,
                    greaterThanStartDate: "#datetimepicker_mask"
                }
            },
            messages: {
                title: {
                    required: "Enter Product name",
                    maxlength: "Enter not more than 99 character"
                },
                mcid: "Choose category",
                product_category: "Choose Category",
                tags: {
                    required: "Enter tag",
                    maxlength: "Enter not more than 100 character"
                },
                description: {
                    required: "Enter description"
                },
                auctionType: {
                    required: "Choose Auction Type"
                },
                bprice: {
                    required: "Enter buy now price",
                    number: "Enter only number",
                    maxlength: "Enter no more than 20 character"
                },
                rprice: {
                    required: "Enter Reserve price",
                    number: "Enter only number",
                    maxlength: "Enter no more than 20 character",
                    le: "Must be lesser than Buy now price"
                },
                mprice: {
                    required: "Enter Market price",
                    number: "Enter only number",
                    maxlength: "Enter no more than 20 character",
                    ge: "Must be greater than Buy now price"
                },
                shipping_fee: {
                    required: "Enter Shipping fee",
                    number: "Enter only number",
                    maxlength: "Enter no more than 20 character"
                },
                shipping_description: {
                    required: "Enter Shipping information"
                },
                date_added: "Please Enter start date",
                date_closed: {
                    required: "Please Enter End date",
                    greaterThanStartDate: "Should not be lesser than start date"
                }
            }
        });
    });
</script>