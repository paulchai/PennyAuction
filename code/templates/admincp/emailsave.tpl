{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}


  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Emial Template</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Emial</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Add / Edit</div>
        </div>

  <div class="row">
    <div class="col-lg-12"> {if $error == 'saved'}
      <div class="alert alert-success"> <strong>Saved!</strong> {$emails.event} was successfully changed. </div>
      {elseif $error != ''}
      <div class="alert alert-danger"> <strong>{$error}</strong> </div>
      {/if}</div>
      <div class="col-lg-12">
   <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/admincp/email/save">
     <input type="hidden" value="{$emails.id}" name="id" />

       <div class="form-group">
           <label>Event</label>
           <input name="events" data-parsley-group="block1" required id="event" maxlength="99" value="{$emails.event}" type="text" class="form-control">
       </div>

      <div class="form-group">
        <label>Subject</label>
        <input name="subjects" data-parsley-group="block1" required id="subject" maxlength="99" value="{$emails.subject}"  type="text" class="form-control">
      </div>


      <div class="form-group">
        <label>Message</label>
        <textarea class="form-control" name="message" id="product_info" data-parsley-group="block1" required rows="15" col="55"  value="" >{$emails.message}
        </textarea>
      </div>


      <input name="submit_user_profile" class="btn btn-warning" value="Reset" title="Reset" class="fl" type="reset">
      <input name="admin_product_add" class="btn btn-success" value="Add" title="Add" class="fl" type="submit"></form>
    </div>

  </div>
 </div>
</div>
</div>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function()
    {
        $('#generaltabid').click();
    });

</script>
<script src="{$config.dpath}js/admincp/ckeditor/ckeditor.js"></script>

<script src="{$config.dpath}js/admincp/ckeditor/jquery.js"></script>

<script type="text/javascript">
      CKEDITOR.replace('message');
</script>


{include file="/admincp/footer.tpl" nocache}


