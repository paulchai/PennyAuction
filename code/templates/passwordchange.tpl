{include file="common/header-1.tpl" nocache}
<div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache}</div>
    <div class="col-md-9">
        <h4 class="ds_brd">{$_phrase.change}{$_phrase.engspace}{$_phrase.password}</h4>

        <form action="/dashboard/changepassword" method="post" id="change_password" name="change_password"
              accept-charset="utf-8" data-parsley-validate>
            {if $save}
            <div class="row">
                <div class="bg bg-success padding-20">
                    <i class="fa fa-warning"></i>
                    Password Successfully Changed!.
                </div>
            </div>

            {/if}
            <div class="row">
                <div class="form-group">
                    <label for="old_password" class="col-md-3">Old Password:</label>

                    <div class="col-md-5">
                        <input type="password" id="old_password" name="old_password" title="Old Password"
                               data-parsley-required-message="Enter old password"
                               data-parsley-group="block1" class="form-control" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="new_password" class="col-md-3">New Password:</label>

                    <div class="col-md-5">
                        <input type="password" id="new_password" name="new_password" title="New Password"
                               data-parsley-required-message="Enter new password"
                               data-parsley-group="block1" maxlength="20" required class="form-control">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="confirm_password" class="col-md-3">Confirm Password :</label>

                    <div class="col-md-5">
                        <input type="password" id="confirm_password" name="confirm_password" title="Confirm Password"
                               data-parsley-required-message="Re-enter new password"
                               data-parsley-group="block1" maxlength="20" required data-parsley-equalto="#new_password"
                               class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-2">
                    <button type="button" id="changepassword" class="btn save_btn">{$_phrase.save}</button>
                </div>
            </div>
        </form>
    </div>
</div>
{include file="common/footer-1.tpl" nocache}
{literal}
<script language="javascript" type="text/javascript">
    $(function () {
        $('.myp').addClass('act_class');
    });
    $('#changepassword').click(function () {
        if (true === $('#change_password').parsley().validate('block1')) {
            $.ajax(
                    {
                        type: 'POST',
                        url: '/dashboard/changepassword',
                        data: {isajax: 1, password: $('#old_password').val()},
                        dataType: 'json',
                        success: function (data) {
                            if (data == 1)
                                $('#change_password').submit();
                            else
                                $('#old_password').next('ul').html('<li class="parsley-required">Old Password is in-correct</li>');
                        }
                    });
        }
    });
</script>
{/literal}
