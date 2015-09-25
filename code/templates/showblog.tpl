{include file="/common/header-1.tpl" nocache}
{include file="common/topnav.tpl" nocache} 
<div class="container-fluid"  style="margin-top:30px">

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
                                        <th colspan="4"><a href="{$config.url}/blog/{$val.id}">{$blog.title}</a></th>
                                       
                                       
                                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <tr>
                                        <td colspan="4">

                                        Posted By {$blog.first_name} {$blog.last_name} on {$blog.date_add}<br />

                                        {if $blog.image != ''} <img src="{$config.url}/uploads/blog/{$blog.avatar}" style="max-width:100%;" /> <br /> {/if} 


                                        {$blog.description}</td>
                                         
                                       
                                    </tr>
                                 
                                </tbody>
                            </table>
                            {$pagination_html}
                        </div>
 </div>
                </div>
               
                <!-- /.row -->
</div>
           
{include file="/common/footer-1.tpl" nocache}
