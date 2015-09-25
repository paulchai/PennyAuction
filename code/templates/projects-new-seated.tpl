<style>
.infm {
	width: 100%;
	height: 206px;
}
.infm2 {
	max-width:100%;
	max-height: 182px;
	margin:auto;
}
.row .row {
	width: auto;
}
.ab1 {
	font-size: 14px;
	font-weight: 600;
	color: #ff7e00;	
}
.ab2 {
	color: #939393;
	font-size: 18px;
	margin-top: 5px;
}
.ab3 {
	clear: both;
	color: #525252;
	font-size: 16px;
}
.ab4 {
	text-align:center;
	display: block !important;
	padding: 4px;
	margin-bottom: 20px !important;
	line-height: 1.42857143 !important;
	background-color: #fff !important;
	border: 1px solid #ddd !important;
	border-radius: 0px !important;
 -webkit-transition: border .2s ease-in-out;
 -o-transition: border .2s ease-in-out;
 transition: border .2s ease-in-out;
	min-height: 414px;
	max-height: 490px;
}
.ab4 .finbum {
	width: 120px;
	padding: 5px 10px;
}
</style>
<div class="row home_aproduct ftmdpro" style="margin-top:5px"> {foreach $proj as $key => $val}
  <div class="col-xs-6 col-sm-6 col-md-3 onlycenr2">
    <div class="ab4">
      <div class="two">{$val.ptitle}</div>
      <div class="col-md-12">
        <div class="col-md-8">Total Seats={$val.seats}</div>
        <div class="col-md-4"><img src="{$config['url']}/images/chair.png" class="img-responsive" /></div>
      </div>
      <a class="pull-left infm" href="{$config['url']}/product/view/{$val.id}" > <img class="media-object infm2" src="{if $val.avatar == ''}{$config['imgpath']}no_img.png    {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" alt="{$val.title}"    /> </a>
      <div class="ab3">
        <div >{$val.seatsLeft} Seats Left!</div>
        <div>Only ${$val.seatAmount} to join and play!</div>
      </div>
      <button type="button" class="finbum" onclick="window.location = '{$config['url']}/product/view/{$val.id}'">View Auction</button>
      <div class="fotdi7">
        <div class="ab2">Auction starts at:</div>
        <div class="ab1">{$val.stime}</div>
      </div>
      <div class="">
        <div class="ab2">Auction ends at:</div>
        <div class="ab1">{$val.ctime}</div>
      </div>
    </div>
  </div>
  {/foreach} </div>
