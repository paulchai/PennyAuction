{include file="/common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="container-fluid" style="margin-top:30px">

                <!-- Page Heading -->
                
                
                <!-- /.row -->

                <div class="row">
                 
                </div>    
                <div class="row">
                  <div class="col-lg-12 m-top-20">
               <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th colspan="4">Blogs</th>
                                       
                                       
                                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                 {foreach $blog as $key => $val}   
                                    <tr>
                                        <td colspan="4"><a href="{$config.url}/blog/{$val.id}">{$val.title}</a><br />
                                        {$val.description_short}..<br />
                                        Posted By {$val.first_name} {$val.last_name} on {$val.date_add}</td>
                                         
                                       
                                    </tr>
                                 {/foreach}
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>
 </div>
                </div>
               
                <!-- /.row -->
</div>
           
{include file="/common/footer-1.tpl" nocache}
