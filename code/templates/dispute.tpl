{include file="common/header-1.tpl" nocache} <div class="row funka3">
 <!--<div class="col-md-2 lef_col ">
                 <div class="white_box">
    <div class="whead">{$_phrase.welcome}</div>
    <div class="b_lbl">We Support below Types in our Release 1</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is Penny Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>What is  Peak Auction?</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reserve Bidding</div>
  </div>
  <div class="white_box">
    <div class="whead">Bidding Type</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Beginner</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Penny Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Peak Auction</div>
    <div class="wb_lbl"><i class="fa fa-caret-right"></i>Reverse Auction</div>
  </div>
  <div class="reg_try"> <img src="{$config.url}/images/reg_try.png" alt="" /> </div>
            </div>-->
            <style>
			.mnm3{
	text-align: center;
  font-size: 20px;
}
			textarea.form-control {
  height: auto;
  min-height: 180px;
  margin-top: 5px;
}
.panel-default{
	border-color:transparent;
}
.panel-default > .panel-heading{
	  background-color: #B8B8B8;
  color: white;
	
}
.rev_head {
  font-family: 'Open Sans';
  font-size: 24px;
  padding: 15px 0 10px;
  border-bottom: none;
  color: #7A7878;
  font-weight: 600;
  margin-bottom: 10px;
}
.funka3{
	min-height:347px;
}
			</style>
            <div class="col-md-1"></div>
		<div class="col-md-7">
			{if $action_sent}
    <div class="row">
      <div class="bg bg-success padding-20  m-top-40"> <i class="fa fa-warning"></i> Your dispute sent. </div>
    </div>
    {/if}
				<div class="col-md-12"><h3 class="rev_head">{$_phrase.report}{$_phrase.engspace}{$_phrase.a}{$_phrase.engspace}{$_phrase.dispute}</h3></div>
				 <form method="post" data-validate="parsley" enctype="multipart/form-data" id="review-form" action="{$config.url}/dispute">
                 
								<div class="row">
                                <div class="col-md-9">
                                <input name="subject"  data-parsley-group="block1" required id="subject" maxlength="99" value="" onkeyup="return limitlength(this,99,'info_label')" type="text" class="form-control" placeholder="Subject">
                                </div></div>
				
				
								<div class="row">
                                <p>&nbsp;</p>
                                <div class="col-md-9">
					<textarea class="form-control" rows="4"  name="message" id="message" class="form-control" required placeholder="Explain Dispute..."></textarea> 
				</div></div>
				<div class="row" style="margin-top:10px;">
						<div class="col-md-4"><button class="btn btn-primary">{$_phrase.submit}xxx</button></div>
						
					</div>
				</form>
			</div>
			<!--div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading mnm3">
						{$_phrase.writeareview}
					</div>
					<div class="panel-body" style="background: #F4F4F4;  color: #7B7B7B;">
						<div style="margin-top:6px; margin-bottom:9px;">
							Dear User or Visitor,
						</div>
						<div>
							<div class="col-md-2"></div>We encourage all of our customers to share their thoughts, so if you'd like to be featured in one of our customer review posts and tell us what’s on your mind!
						</div>
						<div class="col-md-12 text-center" style="margin-top:15px;"><button class="btn btn-primary" data-toggle="modal" data-target="#review_form">{$_phrase.clickheretoreview}</button></div>
					</div>
				</div>
				    
				</div-->
			
			</div>
			

<div class="ds modal fade fcorn-register reg" id="review_form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-header csgray_box">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="close_buttons_register">x</button>
                <h4 class="modal-title blue_txt">{$_phrase.writeyourreview}</h4>
         </div>

          <form method="post" data-validate="parsley" enctype="multipart/form-data" id="review-form" action="{$config.url}/dashboard/review/">
            <div class="form-wrapper"> 
                    
                    <div class="row">
                        <div class="col-md-6">{$_phrase.reviewheadline} ({$_phrase.ifyoucouldsayitinonesentence})</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"><input name="subject"  data-parsley-group="block1" required id="subject" maxlength="99" value="" onkeyup="return limitlength(this,99,'info_label')" type="text" class="gui-input"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">{$_phrase.writeyourreview} ({$_phrase.minimum}{$_phrase.engspace}120{$_phrase.engspace}{$_phrase.chige}{$_phrase.character}{$_phrase.s})</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <textarea name="message" id="message" class="gui-input" required></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">{$_phrase.rateourservice}</div>
                        <div class="ratings col-md-3">
                                   <input id="input-27" class="rating"  name="rating">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-3"><input type="submit" class="btn btn-primary" value="Submit"></div>
                       
                    </div>
            </div>
          </form>
</div>       
	{include file="common/footer-1.tpl" nocache}

	<script type="text/javascript">
$(function(){
    $('.main_container').addClass('review');
})

</script>
   
<script type="text/javascript">
$(function()
{
  $("#input-27").on("rating.change", function(event, value, caption) {
            $("#input-27").rating("refresh", {disabled:true, showClear:false});
            $("#input-27").val(value);
        });
});</script>