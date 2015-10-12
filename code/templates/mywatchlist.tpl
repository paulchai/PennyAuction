{include file="common/header-1.tpl" nocache}
<div class="row dashboard">
  <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
  <div class="col-md-9">
    <h4 class="ds_brd">My Watchlist</h4>
  
      {if $save}
        <div class="row">
             <div class="bg bg-success padding-20">  
                <i class="fa fa-warning"></i>
                 Watchlist Successfully Deleted!.
             </div>
        </div>  

      {/if}
      <div class="row mblue_box md_hide">
            <div class="col-md-2 text-center">Image  </div>     
            <div class="col-md-3 text-center">   Title   </div>          
            <div class="col-md-5 text-center"> {$_phrase.end}{$_phrase.engspace}{$_phrase.time}    </div>     
            <div class="col-md-2 text-center">Delete</div>
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
                  <div data-label="Image" class="account_p_lbl col-md-2 text-center" style="clear:both;">
                  
                  <a href="{$config['url']}/product/view/{$val.id}"><img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="auto" height="65"></a>
                  
                  </div>     
                  <div data-label="Title" class="account_p_lbl col-md-3 text-center"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.title}</a></div>           
                  <div data-label="End Time" class="account_p_lbl col-md-5 text-center">{$val.date_closed}</div>     
                  <div data-label="Delete " class="account_p_lbl col-md-2 text-center"><a href="javascript:void(0)" onclick="deletewatchlist({$val.id})" class="" title="Delete"><i class="fa fa-trash"></i></a></div>
                 
                </div>
              {/foreach}
              
              <div class="clearfix"></div>
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

<script> 
                  function deletewatchlist(pids)
                  {
					  
					  var r = confirm('Are you sure');
					  if(r)
					  {
						window.location = '{$config.url}/dashboard/watchlist/'+pids;  
					  }
                  
                  } </script>
{include file="common/footer-1.tpl" nocache} 
{literal}
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
</script>
{/literal}
