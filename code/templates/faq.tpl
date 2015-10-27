{include file="common/header-1.tpl" nocache}
<style>
.ft25 {
  font-size: 26px;
  font-weight: bold;
}
body{
     font-family: 'Open Sans';	
}
</style>

 <div class="row">
		<div class="col-md-12 about_us">
        <div class="col-md-3" style="margin-top: 45px;">
        <div class="premi2"><a href="/about">{$_phrase.about}{$_phrase.engspace}{$_phrase.us}</a></div>
        <div class="premi2"><a href="/how_it_works">{$_phrase.howpennyauctionwork}</a></div>
        <div class="premi2"><a href="/faq" class="active2">{$_phrase.faq}{$_phrase.s}</a></div>
        <div class="premi2"><a href="/contact">{$_phrase.contact}{$_phrase.engspace}{$_phrase.us|upper}</a></div>
        </div>
        <div class="col-md-9">
			<div class="ft25 title_about">{$_phrase.frequentlyaskedquestions}</div>

            {if !$cusdisable}
      <p>1.What is the minimun budget to start ?
        </p><p class="answer">Minimum budget to start with our project is 750$.</p>
      <p></p>
      
      <p>2.What are all the subscriptions available in PennyAuction?
        </p><p class="answer">There are four subscription models availabale to start your business in your budget.</p>
        <p class="answer">
          </p><ul class="answer">
            <li>Startup Model.</li>
            <li>Business Model.</li>
            <li>Enterprise Model.</li>
            <li>Cloud Model.</li>
          </ul>
          <p class="answer">To know more about features of individual models, please <a href="http://www.auctionsoftware.com/buy-now/">{$_phrase.clickhere}.</a></p>
        <p></p>
      <p></p>
           <p>For more details, please visit our site</p>
      <a href="http://www.{$_phrase.domain}">www.{$_phrase.domain}</a>
     {/if}
            
            
            
            		
			
		
		  
		
		
		
		  	</div>
            </div>
	</div>
	{include file="common/footer-1.tpl" nocache}