{include file="common/header.tpl" nocache}
<div class="container">
   <div class="dash_heads">
      <ul>
         <li><a href="#" title="Home">Home</a></li>
         <li><a><img src="{$config['dpath']}images/arr_bg.png" width="13" height="11" alt="Arrow"></a></li>
      </ul>
   </div>

   {include file="left-nav.tpl" nocache}
   
   <div class="my_message_right">
      <div class="message_common_border">
         <h1 style="width:168px;" title="Add Product">{$_phrase.add}{$_phrase.engspace}{$_phrase.product}</h1>
         <p style="width:551px;">&nbsp;</p>
      </div>
      <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate name="add-product" id="add-product" action="/product/save">
         <div class="message_common">
            <div class="login_middle_common_profil">
               <div class="user_name_common">
                  <p>{$_phrase.productname}<span class="red">*</span>  :</p>
                  <div class="text_feeld">
                     <h2>
                        <input name="title" data-parsley-group="block1" required id="product_name" maxlength="99" value="" onkeyup="return limitlength(this,99,'info_label')" type="text">
                     </h2>
                  </div>
                  <label class="errore_msg fl clr"><span class="red"></span></label>
               </div>
               <div class="user_name_common">
                  <p>{$_phrase.product}{$_phrase.engspace}{$_phrase.category}<span class="red">*</span> :</p>
                  <div class="text_feeld">
                     <h2>
                        <select name="cid" data-parsley-group="block1" required  style="width:270px; height:30px;" id="product_category">
                            <option value="">{$_phrase.please}{$_phrase.engspace}{$_phrase.select}{$_phrase.engspace}{$_phrase.category}</option>
                           {foreach $category as $key => $val}
                             <option value="{$val.id}">{$val.name}</option>
                           {/foreach}
                        </select>
                     </h2>
                  </div>
                  <label class="errore_msg fl clr"><span class="red"></span></label>
               </div>
               <div class="user_name_common">
                  <p>Tags  :</p>
                  <div class="text_feeld">
                     <h2>
                        <input name="tags" id="tags" maxlength="100" value="" type="text" data-parsley-group="block1" required>
                     </h2>
                  </div>
                  <div class="info_label">Enter keywords (Example: social,marketing,stickers,promotion,1234)</div>
                  <label class="errore_msg fl clr"><span class="red"></span></label>
               </div>
               <div class="user_name_common">
                  <p>Photo<span class="red">*</span> :</p>
                  <div class="pro_image"></div>
                  <div>
                     <input name="product_image" type="file" class="file-upload">
                     <label class="errore_msg fl clr"><span class="red"></span><br></label>
                     <span style="margin:0 0 0 5px;">
                        <p style="width:250px;text-align:left;font-weight:bold;font-size:11px;">Maximum Size: 2Mb Format: jpeg, png, gif  Resolution: 200 * 200 Pixels </p>
                     </span>
                  </div>
                  <div class="user_name_common">
                     <p>{$_phrase.product}{$_phrase.engspace}{$_phrase.description}<span class="red">*</span>  :</p>
                     <div class="text_feeld">
                        <h2>
                           <textarea name="description" id="product_info" data-parsley-group="block1" required class="resizetextarea" data-parsley-maxlength="500" data-parsley-length="[100, 500]" value="" onkeyup="limitlengths(this, 500,'product_info_label')"></textarea>
                           <label class="errore_msg fl clr">
                              <span class="red"></span>
                              <div class="info_label" id="product_info_label">Max Length: 500 </div>
                           </label>
                        </h2>
                     </div>
                     <label class="errore_msg fl clr"><span class="red">   </span></label>
                  </div>
                  
                 
                  <div class="user_name_common" id="shipping_inf">
                     <p>{$_phrase.buynow_price} :</p>
                     <div class="text_feeld">
                        <h2>
                           <input name="bprice" id="bprice" data-parsley-group="block1" required maxlength="20"  placeholder="0.00"  value="" type="text">
                        </h2>
                     </div>
                  </div>
                  <div class="user_name_common" id="shipping_inf">
                     <p>{$_phrase.market}{$_phrase.engspace}{$_phrase.price} :</p>
                     <div class="text_feeld">
                        <h2>
                           <input name="mprice" id="mprice" data-parsley-group="block1" required maxlength="20"  placeholder="0.00"  value="" type="text">
                        </h2>
                     </div>
                  </div>
                  
                  <div class="user_name_common" id="buynow_clk">
                     <p>Enhancement :</p>
                     <div class="text_feeld">
                        <h2>
                           <input style="float:left;" name="buynow" id="buy" value="1" type="checkbox">
                           <span>Buy Now</span>  
                        </h2>
                        <h2>
                           <input style="float:left;" name="feature" id="buy" value="1" type="checkbox">
                           <span>Featured</span>  
                        </h2>
                        
                     </div>
                  </div>
                  <div class="user_name_common" id="shippingfee-field">
                     <p>{$_phrase.shipping}{$_phrase.engspace}{$_phrase.amount}  :</p>
                     <div class="text_feeld">
                        <h2>
                           <input name="shipping_fee" id="shipping_fee"  data-parsley-group="block1" required maxlength="12" value="" type="text">
                        </h2>
                        <div class="info_label" style="float:left;width:100%;clear:both;">Eg : 25.25</div>
                     </div>
                  </div>
                  <div class="user_name_common" id="shipping_inf">
                     <p>{$_phrase.shipping}{$_phrase.engspace}{$_phrase.information}  :</p>
                     <div class="text_feeld">
                        <h2>
                           <input name="shipping_description" id="shipping_info" data-parsley-group="block1" required maxlength="20" value="" type="text">
                        </h2>
                     </div>
                  </div>
                  <div class="user_name_common" id="shipping_inf">
                     <p>Start Date  :</p>
                     <div class="text_feeld">
                        <h2>
                           <input data-date-format="MM d, yyyy" name="date_added" id="date_added"  class="date-picker form-control" data-parsley-group="block1" required maxlength="20" value="" type="text">
                        </h2>
                     </div>
                  </div>
                  <div class="user_name_common" id="shipping_inf">
                     <p>Ending Date  :</p>
                     <div class="text_feeld">
                        <h2>
                           <input data-date-format="MM d, yyyy" name="date_closed" id="date_closed"  class="date-picker form-control" data-parsley-group="block1" required maxlength="20" value="" type="text">
                        </h2>
                     </div>
                  </div>
                 
                  <label class="errore_msg fl clr"><span class="red"></span></label>
                  
                  <div class=" buton_green">
                     <div class="grand_total_btn_cp">
                        <div class="save_left"></div>
                        <div class="save_mid">
                           <input name="submit_user_profile" value="Reset" title="Reset" class="fl" type="reset">
                        </div>
                        <div class="save_right"></div>
                     </div>
                     <div class="profil_butoon" style="padding-left:10px;">
                        <div class="res_left"></div>
                        <div class="res_mid"><a><input name="admin_product_add" value="Add" title="Add" class="fl" type="submit"></a></div>
                        <div class="res_right"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </form>
   </div>
</div>
{include file="common/footer.tpl" nocache}
 <script language="javascript" type="text/javascript">
          $(function() { $('.myp').addClass('act_class'); } );
          $(function()
{
   Date.dayNames = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    Date.format = 'mm/dd/yyyy';
    $("#date_added").datePicker({ clickInput: false, 
        createButton: false, 
        showYearNavigation: false, 
        showHeader:2
    }).bind(
        'focus click keydown',
        function()
        {
          $("#date_added").dpRerenderCalendar();
          $("#date_added").dpSetStartDate('01/01/2011');
            //$(obj).dpSetStartDate($("#funddater_"+curid).val());
            $("#date_added").dpDisplay();
      }
   );
   
    $("#date_closed").datePicker({ clickInput: false, 
        createButton: false, 
        showYearNavigation: false, 
        showHeader:2
    }).bind(
        'focus click keydown',
        function()
        {
          $("#date_closed").dpRerenderCalendar();
          $("#date_closed").dpSetStartDate($("#date_added").val());
            //$(obj).dpSetStartDate($("#funddater_"+curid).val());
            $("#date_closed").dpDisplay();
      }
   );
   
});
     </script>
   
<script type="text/javascript">
$(function()
{
  projectLoad();
});</script>