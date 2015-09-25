{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

  {include file="/admincp/left-nav.tpl" nocache}  
  
  <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
        <div class="aw_thead">Phrases</div>
        <div class="aw_thead1">
            <div>Home</div>
            <div><i class="fa fa-long-arrow-right"></i></div>
            <div>Phrases</div>           
        </div>
                <!-- Page Heading -->
               <!-- <div class="row">
                    <div class="col-lg-12">
                        
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-edit"></i> Phrases <i class="fa fa-hand-o-right"></i> <i class="fa fa-settings"></i> 
                                
                            </li>
                        </ol>
                    </div>
                </div>-->
                <!-- /.row -->
                <div class="row">
                       <div class="col-lg-12">
                        
                          
                        </div>
                        
                                 <div class="row">
                                 <div class="col-lg-12">
                                  <div class="col-lg-4">Phrases Identifier</div>
                                  <div class="col-lg-4">Phrases Text</div>
                                   <div class="col-lg-4">Action</div>
                                 </div>  
                                 </div>  
                                                       
                               	  {foreach $phrases as $key => $val} 
                                  <div class="row">                            
                                       <div class="col-lg-12">
                                        <div class="col-lg-4">{$val.name}</div>
                                        <div class="col-lg-4">{$val.value}</div>
                                        <div class="col-lg-4"><a href="{$config.url}/admincp/language/edit/{$val.name}">Edit</a></div>
                                       </div>
                                    </div>   
                                  {/foreach}
                         
                          <div class="col-lg-12">
                          {$pagination_html}   
                           </div>    
                           

                          
                        

                    

                </div>	
                

               
                <!-- /.row -->
</div>
           </div>
           </div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
$('#languagetabid').click();
</script>