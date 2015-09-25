<!--<link rel="stylesheet" href="{$config['url']}/css/stores.css" type="text/css" />
<link rel="stylesheet" href="{$config['url']}/css/admincp/breadcrum.css" type="text/css">-->
<style>
.ondi {
  border: 1px solid #CCCCCC;
  height: 186px;
  width: 100%;
}
.check {
  width: 100px;
}
.mrgleftne5px {
  margin-left: 10px;
}
.pdtlli3 {
  padding-top: 10px;
}
.pd3letyqi {
  padding-left: 15px !important;
    margin-bottom: 10px;
}
.mngr3fs{
	margin-bottom:8px;
}
.thrdiv {
  position: absolute;
  left: 152px;
  bottom: 55px;
  font-size: 18px;
}
.togiv {
  background-color: #dbdbdb;
  width: 82px;
  height: 24px;
  padding-top: 0px;
  margin-top: 10px;
}
.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  outline: none;
  background: white;
  cursor: inherit;
  display: block;
}
	.frdiv {
  background-color: #dbdbdb;
  width: 82px;
  height: 24px;
  padding-top: 1px;
}
.eigdiv {
  margin-left: -28px;
  margin-top: 17px;
}
</style>

<div class="aw_thead">Stores</div>
<div class="aw_thead1">
  <div>Home</div>
  <div><i class="fa fa-long-arrow-right"></i></div>
  <div>Stores</div>
  <div><i class="fa fa-long-arrow-right"></i></div>
  <div>View Store</div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="col-md-5">
      <div class="circle"> <img src="{if $stores.avatar == ''} {$config['imgpath']}no_img.png {else if $stores.avatar != ''}{$config['imgpath']}stores/{$stores.avatar}{/if}" style="max-width:130px" alt="1" class="img-thumbnail"> </div>
      <p class="thrdiv"> {$stores.name} <span><img src="{$config['url']}/image/editer.png" /></span></p>
      <!--<div class="browse"> <span class="btn btn-default btn-file togiv" > Browse...
                  <input type="file">
                  </span> </div>-->
    <!--<div class="col-md-12 eigdiv">
                  <div class="col-md-8"> <span> Cover Banner: <a href="#">Image.jpeg<img src="images/delete.png" style="padding-left: 4px;"></a></span> </div>
                  <div class="col-md-4 "> <span class="btn btn-default btn-file frdiv"> Browse...
                    <input type="file">
                    </span> </div>
                </div>-->
    </div>
    <div class="col-md-7">
      <div class="btn-group" role="group" aria-label="..."> <a href="{$config['url']}/admincp/projects/new?storeid={$stores.id}" title="{$val.ptitle}">
        <button type="submit" class="btn btn-success mngr3fs" style="margin-top: 30px;"> <i class="fa fa-search"></i> Add New Products </button>
        </a> </div>
      <div class="Checkbox ondi">
                  <p class="pd3letyqi pdtlli3" style="font-weight:800;">Select Categories you are interested</p>
                  <form role="form" style="float: left; margin-left:8px;">
                    <label class="checkbox-inline check mrgleftne5px">
                      <input type="checkbox" value="" style="">
                      Electronics</label>
                    <label class="checkbox-inline check" style="width:27%">
                      <input type="checkbox" value="">
                      TV.Home Theatre<br>
                    </label>
                    <label class="checkbox-inline check">
                      <input type="checkbox" value="">
                      Laptop</label>
                    <label class="checkbox-inline check">
                      <input type="checkbox" value="">
                      Mobiles</label>
                    <label class="checkbox-inline check pdtlli3">
                      <input type="checkbox" value="">
                      Sports</label>
                    <label class="checkbox-inline check pdtlli3" style="width:27%">
                      <input type="checkbox" value="">
                      Home Appliances</label>
                    <label class="checkbox-inline check pdtlli3">
                      <input type="checkbox" value="">
                      Cricket</label>
                    <label class="checkbox-inline check pdtlli3">
                      <input type="checkbox" value="">
                      Others</label>
                  </form>
                </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12"  style="border-bottom: 1px solid #ccc;margin-bottom: 15px;padding-bottom: 10px;">
    <p> About Store<span><img src="{$config['url']}/image/editer.png" style="margin-left: 5px;" /></span></p>
    <p style="color: #98b9fe;">{$stores.description}</p>
  </div>
</div>
