function searchProject() {

    //start
    $('#user_search').submit();
    return false;
    //end

    params = 'dummy=1&' + $('#user_search').serialize()/*+'&cid='+$('.mdropdown').val()*/;
    if ($('.subslice2').length == 0) {
        // alert(ILBASE+'/search?'+params);
        //  lreload(ILBASE+'/search?'+params);
        //window.location = ILBASE+'/search?'+params;
        $('#user_search').submit();
    }
    $.ajax({
        type: "POST",
        url: ILBASE + "/search",
        data: params,
        dataType: 'json',
        success: function (data) {

            $('.subslice2').html(data.html);
        }
    });
}
function numberformat() {

    $('.format').each(function () {
        // alert(parseFloat($(this).html()));
        $(this).html(format(parseFloat($(this).html()), ''));
    })

}

$(function () {
    $('.floatpoint').each(function () {
        $(this).keyup(function () {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        })
    });

    /* numberformat();*/


    $('input[name="zipcode"],input[name="phone"],input[name="zip"]').keyup(function () {
        this.value = this.value.replace(/[^0-9]/g, '');

    });

    $('input[name="zipcode"],input[name="phone"],input[name="zip"]').each(function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    $('.count_numbers').each(function () {
        $(this).parent().find('label').css('width', '100%').append('<span style="float:right;width:50%;text-align:right;font-weight:normal;"> <font class="cnter"> ' + $(this).val().length + '</font> of ' + $(this).attr('data-parsley-maxlength') + ' characters</span>');
        $(this).on('keypress', function () {
            $(this).parent().find('.cnter').html($(this).val().length);
            if ($(this).val().length > parseInt($(this).attr('data-parsley-maxlength'))) {
                // $(this).parent().find('.cnter').html($(this).attr('data-parsley-maxlength'));
                return false;
            }
        });
        $(this).on('change', function () {
            $(this).parent().find('.cnter').html($(this).val().length);
            if ($(this).val().length > parseInt($(this).attr('data-parsley-maxlength'))) {
                //$(this).parent().find('.cnter').html($(this).attr('data-parsley-maxlength'));
                return false;
            }

        });
    });
});
function addtowatchlist(id) {
    params = {id: id};


    $.ajax({
        type: "POST",
        url: "/product/watchlist",
        data: params,
        dataType: 'json',
        success: function (data) {

            if (!data.access) {
                lreload('/login')
            }
            else if (data.isadded) {
                alert('Its already in watchlist');
            }
            else {
                alert('Added in your watchlist!');
            }
        }
    });
}
function lreload(obj) {
    window.location = obj;
}

function projectLoad() {
    $(".file-upload").on("change", function () {
        var id = $(this).attr('id');

        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader)
            return; // no file selected, or no FileReader support

        if (/^image/.test(files[0].type)) { // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
            reader.onloadend = function () { // set image data as back
                $('.pro_image').css("background-image", "url(" + this.result + ")");
            }
        }
    });
}

function format(n, currency) {
    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
}

function loginauto(tis) {
    // alert(1);
    var logintype = $(tis).val();
    //alert (logintype);
    if (logintype == 'buyer') {
        $('#autologinuserid').val('developscriptbuyer');
        $('#autologin').submit();
    }
    if (logintype == 'seller') {
        $('#autologinuserid').val('buyer@gmail.com');
        $('#autologin').submit();
    }
    else if (logintype == 'admin') {
        $('#autologinuserid').val('admin');
        $('#autologin').attr('action', ILBASE + "/admin/login/save").submit();
    }

//  $('#autologin').submit();
}

function searchitems(tis) {
    var m = $(tis).val();
    $('#sort').val(m);
    searchProject();
    //alert(m);

}

function PopupBox(link, content) {
    var r = confirm(content);
    if (r) {
        window.location.href = link;
    } else {
        return false;
    }
}
