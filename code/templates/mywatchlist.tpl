{include file="common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="row dashboard user_panel">
   {include file="left-nav-dashboard.tpl" nocache}
  <div class="col-md-9" style="width:65%">
   <div class="dash"></div>
      <div class="abutop">My Watchlist</div>
   
      {if $save}
        <div class="row">
             <div class="bg bg-success padding-20">  
                <i class="fa fa-warning"></i>
                 Watchlist Successfully Deleted!.
             </div>
        </div>  

      {/if}
      <div class="row mblue_box">
            <div class="col-md-3">Image  </div>     
            <div class="col-md-3">   Title   </div>          
            <div class="col-md-4"> End Time    </div>     
            <div class="col-md-2">Delete</div>
          </div>

           {if $mywatchlist|count <=  0}
            <div class="row mblue_box1">
              <div class="col-md-12 text-center m-top-20 font-12">
                 No Watchlist Items Found
              </div>   
           </div>
           {else}
              {foreach $mywatchlist as $key => $val}
                <div class="row mblue_box1">
                  <div class="col-md-3"><a href="{$config['url']}/product/view/{$val.id}"><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"></a></div>     
                  <div class="col-md-3"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>           
                  <div class="col-md-4">{$val.date_closed}</div>     
                  <div class="col-md-2"><a href="{$config.url}/dashboard/watchlist/{$val.id}" class="" title="Delete"><i class="fa fa-trash-o"></i></a></div>
                </div>
              {/foreach}
              {if $pagination_html != '<ul class="pagination"></ul>'}
               <div class="row mblue_box1">
                  <div class="col-md-12">
                    {$pagination_html}
                  </div>
               </div>
               {/if}
            {/if}   

  </div>
</div>
{include file="common/footer-1.tpl" nocache} 
{literal}
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
</script>
{/literal}
