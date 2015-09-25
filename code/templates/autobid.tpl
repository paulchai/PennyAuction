{include file="common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache}
<div class="row dashboard user_panel"> {include file="left-nav-dashboard.tpl" nocache}
  <div class="col-md-9" style="width:65%">
   <div class="dash"></div>
      <div class="abutop">Autobid</div>
    <form name="setautobid" action="/dashboard/autobid" method="post" data-parsley-validate required>
      {if $aData.id > 0}
      <input type="hidden" name="aid" value="{$aData.id}" />
      {/if}
     
      <div class="row"> 
        <!--<div class="form-group">
            <label for="inputEmail" class="col-md-4" >Auction Types* :</label>
            <div class="col-md-8">
              <select class="form-control">
                <option>Select Auction Type</option>
                <option>Penny Auction</option>
                <option>Peak Auction</option>
              </select>
            </div>
          </div>--> 
      </div>
      {if $aData.id > 0}
      {else}
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Choose an auction* :</label>
          <div class="col-md-8">
            <select name="project_id" class="form-control" id="loadmake" required>
              <option value="">Select Product</option>
              
                
                
                
                                
                         {foreach $project as $val}
                
                
                
                
                
              <option value="{$val.id}">{$val.title}</option>
              
                
                
                
                
                         {/foreach}
              
              
              
              
              
            </select>
          </div>
        </div>
      </div>
      {/if}
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Maximum bid count :</label>
          <div class="col-md-8">
            <input type="text" id="autobid_amt" name="maxbids" placeholder="Enter your maximum bid count" value="{$aData.maxbids}" maxlength="20" class="form-control" required>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" >Activate at ($) * :</label>
          <div class="col-md-8">
            <input type="text" id="autobid_start_amount" name="start_amount" placeholder="Enter your Autobid start product price" value="{$aData.start_amount}" maxlength="20" class="form-control" >
            <!--<div class="abid_lbl">Auto bid start bid when reach your product current price</div>--> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4" > Bidding Stategy :</label>
          <div class="col-md-8">
            <input type="radio" id="strategy" name="bidstategy"  value="{$config['general']['autobid_seconds']}"  checked="checked" readonly="readonly">
            <label> Bid within last {$config['general']['autobid_seconds']} seconds </label>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-8">
          <button class="btn save_btn" type="submit">Set AutoBid</button>
          <!--<div class="abid_lbl">No Autobid products at the moment</div>--> 
        </div>
      </div>
    </form>
    {if $aData.id > 0}
    {else}
    <h4 class="ds_brd">Active Auto-bids</h4>
    <div class="row mblue_box">
      <div class="m-top-20">
        <div class="ship_add">Title</div>
        <div class="ship_add">Maxbids</div>
        <div class="ship_add">Bids used </div>
        <div class="ship_add">Bid Amt </div>
        <div class="ship_add"> Status</div>
        <div class="ship_add"> Options</div>
      </div>
    </div>
    {if $Autobids|count <=  0}
    <div class="col-md-12 text-center m-top-20 font-12">No Results Found</div>
    {else}
    {foreach $Autobids as $key => $alist}
    <div class="row mblue_box1"  style="background:none"> 
      <!--<div class="col-md-3"><a href=""><img src="{if $alist.avatar == ''} {$config['imgpath']}no_img.png {else if $alist.avatar != ''}{$config['imgpath']}product/{$alist.avatar}{/if}" title="{$alist.title}" width="65" height="65"></a></div>-->
      <div class="ship_add"><a href="{$config['url']}/product/view/{$alist.id}" title="{$val.ptitle}"> {$alist.title}</a></div>
      <div class="ship_add"> {$alist.maxbids}</div>
      <div class="ship_add">{$alist.bids}</div>
      <div class="ship_add">${$alist.bidamount}</div>
      <div class="ship_add"> {if $alist.start_amount > $alist.wprice} Starting amount not reached  {elseif $alist.start_amount <=$alist.wprice} Active {/if}</div>
      <div class="ship_add"> <a title="View" href="{$config['url']}/dashboard/autobidremove/{$alist.aid}">Remove</a> &nbsp;&nbsp;&nbsp;<a title="View" href="{$config['url']}/dashboard/autobid/{$alist.aid}">Edit</a></div>
    </div>
    {/foreach}
    {/if}
    <div style="clear:both"></div>
    <h4 class="ds_brd m-top-20">Stopped Auto-bids</h4>
    <div class="row mblue_box">
    <div class="m-top-20">
      <div class="ship_add">Title</div>
      <div class="ship_add">Maxbids</div>
      <div class="ship_add">Bids used </div>
      <div class="ship_add">Bid Amt </div>
      <div class="ship_add"> Status</div>
      <div class="ship_add"> Options </div>
    </div> </div>
    {if $AutobidsClosed|count <=  0}
    <div class="col-md-12 text-center m-top-20 font-12">No Results Found</div>
    {else}
    {foreach $AutobidsClosed as $key => $alist}
    <div class="row mblue_box1"  style="background:none"> 
      <!--<div class="col-md-3"><a href=""><img src="{if $alist.avatar == ''} {$config['imgpath']}no_img.png {else if $alist.avatar != ''}{$config['imgpath']}product/{$alist.avatar}{/if}" title="{$alist.title}" width="65" height="65"></a></div>-->
      <div class="ship_add"><a href="{$config['url']}/product/view/{$alist.id}" title="{$val.ptitle}"> {$alist.title}</a></div>
      <div class="ship_add"> {$alist.maxbids}</div>
      <div class="ship_add">{$alist.bids}</div>
      <div class="ship_add">${$alist.bidamount}</div>
      <div class="ship_add"> {if $alist.bids >= $alist.maxbids} Limit reached  {elseif  $alist.bids < $alist.maxbids} Auction Closed {/if}</div>
      <div class="ship_add"> <a title="View" href="{$config['url']}/dashboard/autobidremove/{$alist.aid}">Remove</a> </div>
    </div>
    {/foreach}
    {/if} {/if} </div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 