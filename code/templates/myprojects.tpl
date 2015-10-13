{include file="common/header.tpl" nocache}
<div class="container">
  <div class="dash_heads">
    <ul>
      <li><a href="#" title="Home">Home</a></li>
      <li><a><img src="{$config['dpath']}images/arr_bg.png" width="13" height="11" alt="Arrow"></a></li>
    </ul>
  </div>
  {include file="left-nav.tpl" nocache}
  <div class="my_message_right" id="mybids_page">
    <div class="message_common_border">
      <h1 title="MY PRODUCTS">My Products</h1>
      <p>&nbsp;</p>
    </div>
    <div class="buton_green">
      <div class="profil_butoon">
        <div class="res_left"></div>
        <div class="res_mid"><a title="Add product">
          <input type="button" name="submit_user" value="Add product" onClick="location.href='{$config.url}/product/post'">
          </a> </div>
        <div class="res_right"></div>
      </div>
      <div class="message_common">
        <div class="form_cont_top"> </div>
        <div class="forms_common">
          <div class="title_cont_watchilist">
            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table-top">
              <thead class="md_hide">
                <tr>
                  <th width="100" align="center"> <b>{$_phrase.image}</b> </th>
                  <th width="100" align="center"> <b>{$_phrase.title}</b> </th>
                  <th width="150" align="center"> <b>Start date-Closed date</b> </th>
                  <th width="100" align="center" colspan="3"> <b>Action</b> </th>
                  <th width="100" align="center"></th>
                  <th width="100" align="center"> <b> {$_phrase.status}</b> </th>
                </tr>
              </thead>
              <tbody>
              
              {if $projects|count <=  0}
              <tr>
                <td colspan="8" align="center">No Products Found</td>
              </tr>
              {else}
              {foreach $projects as $key => $val}
              <tr>
                <td data-label="" class="account_p_lbl" width="100" align="center"><h3> <img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}product/{$val.avatar}{/if}" title="{$val.title}" width="65" height="65"> </h3></td>
                <td data-label="" class="account_p_lbl" width="100" align="center"><a href="{$config['url']}/product/view/{$val.id}" title="{$val.ptitle}"> {$val.ptitle}</a></td>
                <td data-label="" class="account_p_lbl" width="400" align="center"><h2>{$val.date_added} - {$val.closed}</h2></td>
                
                <!--<td width="50" align="center"><a href="http://unieauction.com{$config.path}/editproduct/424 " title="Product Edit" class="editicon">{$_phrase.edit}</a> &nbsp; </td>-->
                <td data-label="" class="account_p_lbl" width="50" align="center" colspan="2"><a href="/product/remove/{$val.id}" class="deleteicon" title="Delete">{$_phrase.delete}</a></td>
                <td width="" align="center"></td>
                <td width="" align="center"></td>
                <td width="50" align="center">{if $val.status == 1} Active {else $val.status != 1} Inactive{/if}</td>
              </tr>
              {/foreach}
              {/if}
                </tbody>
            </table>
          </div>
          <div class="user" style="display:none;">344</div>
        </div>
        {$pagination_html} </div>
    </div>
  </div>
</div>
{include file="common/footer.tpl" nocache} 
<script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
     </script> 
<script type="text/javascript">
$(function()
{
  projectLoad();
});</script>