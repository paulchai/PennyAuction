{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Categories</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Categories</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>List</div>
            </div>

            <!-- Page Heading -->

            <!--<div class="row">
              <div class="col-lg-12">
                <ol class="breadcrumb">
                  <li class="active"> <i class="fa fa-sitemap"></i> Categories <i class="fa fa-hand-o-right"></i> <i class="fa fa-list"></i> List </li>
                </ol>
              </div>
            </div>-->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12"><a name="admin_product_add" href="{$config.url}/admincp/categories/add"
                                          class="btn btn-success btn-right" value="Add New Category" title="Add">Add New
                    Category</a> <br/><br/></div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Categories</th>
                                <th>Category ID</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            {foreach $categories as $key => $val}
                            <tr>
                                <td>{for $foo=1 to {$val.depth}} -- {/for}{$val.name}</td>
                                <td>{$val.id}</td>
                                <td>{$val.description}</td>
                                <td><a href="{$config.url}/admincp/categories/edit/{$val.id}">Edit</a><br>
                                    <a href="javascript:void(0);"
                                       onclick="PopupBox('{$config.url}/admincp/categoriesdelete/{$val.id}','Are you sure you want to delete this?.It will delete subcategories  and close the projects belong to this category')">Delete</>
                                </td>
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
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}
<script language="javascript" type="text/javascript">
    $('#generaltabid').click();
</script>