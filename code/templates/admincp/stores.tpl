{include file="/admincp/header.tpl" nocache}
<link rel="stylesheet" href="{$config['url']}/css/stores.css" type="text/css" />
<div class="main_container admin_wrapper"> {include file="/admincp/left-nav.tpl" nocache}
  <div class="right_admin_panel clearfix">
    <div class="admin_rwrap">
      <div class="aw_thead">Stores</div>
      <div class="aw_thead1">
        <div>Home</div>
        <div><i class="fa fa-long-arrow-right"></i></div>
        <div>Stores</div>
        <div><i class="fa fa-long-arrow-right"></i></div>
        <div>Add New Store</div>
      </div>
      <!-- Page Heading --> 
      
      <!--<div class="row">
        <div class="col-lg-12">
          <ol class="breadcrumb">
            <li class="active"> <i class="fa fa-shopping-cart"></i> Stores </li>
          </ol>
        </div>
      </div>
      <div class="col-lg-12 asclr">
  Stores > Add New Store
  </div>--> 
      <!-- /.row --> 
      
      <!-- Karthik-->
      
      <div class="row">      
      <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/admincp/stores/addEdit">
      <input type="hidden" name="storeid" value="{$stores.id}" />
      <input type="hidden" name="avatar" value="{$stores.avatar}" />
      <input type="hidden" name="image" value="{$stores.image}" />
        <div class="col-lg-12">
          <div class="col-lg-12">
            <div class="font26pxone pdbyan">Add New Stores</div>
          </div>
        </div>
        <div class="col-lg-12 pdbyan">
          <div class="col-lg-6">
            <div class="font18pxne">Store Name</div>
            <div>
              <div class="form-group">
                <input type="text" name="name" value="{$stores.name}" class="form-control" id="exampleInputName2" placeholder="" style="width:65%">
              </div>
            </div>
            <div class="font18pxne">About Store</div>
            <div>
              <textarea class="form-control" name="description"  rows="3" style="width:65%">{$stores.description}</textarea>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="font18pxne pdbyan">Store Logo</div>
            <div class="pdbyan">

              <img src="{if $stores.avatar == ''} {$config['imgpath']}no_img.png {else if $stores.avatar != ''}{$config['imgpath']}stores/{$stores.avatar}{/if}" style="max-width:256px" alt="1">

              </div>
            <div>
              <input type="file" name="stores" value="Browse">
            </div>
          </div>
        </div>
        
        <!--<div class="col-lg-12">
  <div class="col-lg-12"> 
  <div class="font18pxne">Cover Banner</div></div>
  <div class="col-lg-4"><input type="text" class="form-control" id="exampleInputName2" placeholder=""></div>
  <div class="col-lg-4 pdbyan" style="margin-top: 5px;"><input type="file"></div>
  <div class="col-lg-11">(Upload 851 pixels wide, 315 pixels tall and less than 200 kilobytes).</div>
  
  
  </div>-->
        
        <div class="col-lg-12">
          <div>
            <div class="col-md-9 pdbyan" style="padding-top:25px;font-weight: bold;">Select Categories you are interested: </div>
          </div>
          <div>
            <div class="col-md-12 pdbyan">
              <select class="form-control" name="categories[]" id="Categories" multiple="multiple" style="height:200px;width:65%">
                
          {foreach $category as $key => $val}
           
                <option value="{$val.id}"> {$val.name} </option>
                
           {/foreach}
          
              </select>
            </div>
          </div>
        </div>
        <div class="col-lg-12 pdlstp10">
          <div class="col-lg-1">
            <button type="submit" class="btn btn-success">ADD</button>
          </div>
          <div class="col-lg-2 ">
            <button type="reset" class="btn btn-default dftbtmon">CANCEL</button>
          </div>
        </div>
        </form>
      </div>
      <!-- /#page-wrapper --> 
      
    </div>
  </div>
</div>
{include file="/admincp/footer.tpl" nocache} 
<script language="javascript" type="text/javascript">
  var cids = [{$stores.cids}];
  $('#Categories').val(cids);

  $('#storestabid').click();
</script>