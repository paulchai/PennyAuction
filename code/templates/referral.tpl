{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">{$_phrase.referral}</h4>
      <div class="row mblue_box md_hide">
        <div class="col-md-6 text-center">{$_phrase.referral}{$_phrase.engspace}{$_phrase.link} </div>
        <div class="col-md-6 text-center">{$_phrase.referralbonusperusersignup}</div>
      </div>
      <div class="row mblue_box1" style="margin-bottom:10px;">
        <div data-label="Referral Link" class="account_p_lbl col-md-6 text-center">{$config['url']}/register/{$referrallink} </div>
        <div data-label="Referral Bonus per user Signup" class="account_p_lbl col-md-6 text-center"> ${$config['referral_bonus']}</div>
        
       <div class="row col-md-6" style="text-align:center">  <!--<div> <h2> {$_phrase.share}{$_phrase.space}{$_phrase.your}{$_phrase.engspace}{$_phrase.referral}{$_phrase.engspace}{$_phrase.link} </h2> </div>-->
        <span class='st_sharethis_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='ShareThis'></span> <span class='st_facebook_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='facebook'></span> <span class='st_twitter_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='Tweet'></span> <span class='st_linkedin_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='LinkedIn'></span> <span class='st_pinterest_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='Pinterest'></span> <span class='st_email_large' st_image ="http://www.auctionsoftware.com/wp-content/uploads/2014/09/banner_middle.png"  st_url = "{$config['url']}/register/{$referrallink}" st_title="Auction Software" st_summary="Start your own auction website with the Industry  most Powerful, Secure & Highly featured Auction Script. We provide a complete solution for starting your own auction script websites." displayText='Email'></span> </div> </div>
      <div class="row mblue_box md_hide">
        <div class="col-md-2">{$_phrase.image} </div>
        <div class="col-md-3">{$_phrase.name} </div>
        <div class="col-md-3">{$_phrase.email} </div>
        <div class="col-md-2">{$_phrase.joined}</div>
         <div class="col-md-2">{$_phrase.status}</div>
      </div>
      {if($referral|count>0)}
      {foreach $referral as $refer}
      <div class="row mblue_box1">
        <div data-label="Image" class="account_p_lbl col-md-2" style="clear: both;"><a href=""><img width="50" height="50" src="{if $refer.avatar == ''} {$config['imgpath']}no_img.png {else if $refer.avatar != ''}{$config['url']}/uploads/profile/{$refer.avatar}{/if}" title="" alt="" align="center"></a></div>
        <div data-label="Name" class="account_p_lbl col-md-3"><a href="">{$refer.first_name} {$refer.last_name} </a></div>
        <div data-label="Email" class="account_p_lbl col-md-3"> {$refer.email} </div>
        <div data-label="Joined" class="account_p_lbl col-md-2"> {$refer.added} </div>
        <div data-label="Status" class="account_p_lbl col-md-2"> {if $refer.status == 1} 
             Approved
             {elseif $refer.status == 0}
              Pending 
             {/if} </div>
      </div>
      {/foreach}
      {else}
     <div class="col-md-12 text-center m-top-20 font-12">  No referrals found </div> 
      {/if}  {$pagination_html} </div>
  </div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "5a91affa-b85c-4f7f-b59a-f54ade10d67a",shorten:false, doNotHash: true, doNotCopy: false, hashAddressBar: false});</script>
{include file="common/footer.tpl" nocache}