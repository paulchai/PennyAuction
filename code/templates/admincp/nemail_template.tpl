{include file="/admincp/header.tpl" nocache}
<div class="main_container admin_wrapper">

    {include file="/admincp/left-nav.tpl" nocache}

    <div class="right_admin_panel clearfix">
        <div class="admin_rwrap">
            <div class="aw_thead">Blogs</div>
            <div class="aw_thead1">
                <div>Home</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Email Template</div>
                <div><i class="fa fa-long-arrow-right"></i></div>
                <div>Add / Edit</div>
            </div>
            <!-- Page Heading -->
            <!--<div class="row">
              <div class="col-lg-12">
                <ol class="breadcrumb">
                  <li class="active"> <i class="fa fa-laptop"></i> Blogs <i class="fa fa-hand-o-right"></i> <i class="fa fa-edit"></i> {if $projects.id == 0 or $projects.id == ''} Add {else} Edit {/if}<i class="fa fa-hand-o-right"></i> {$projects.title} </li>
                </ol>
              </div>
            </div>-->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12"> {if $error == 'saved'}
                    <div class="alert alert-success"><strong>Saved!</strong> {$blogs.title} was successfully changed.
                    </div>
                    {elseif $error != ''}
                    <div class="alert alert-danger"><strong>{$error}</strong></div>
                    {/if}
                </div>
                <div class="col-lg-12">
                    <form method="POST" enctype="multipart/form-data" class="admin_form" data-parsley-validate
                          name="add-product" id="add-product" action="/admincp/blog/save">
                        <input type="hidden" value="{$blogs.id}" name="id"/>

                        <div class="form-group">
                            <label>Title</label>
                            <input name="title" data-parsley-group="block1" required id="product_name" maxlength="99"
                                   value="{$blogs.title}" onKeyUp="return limitlength(this,99,'info_label')" type="text"
                                   class="form-control">
                        </div>


                        <div class="form-group">
                            <label>Description</label>
        <textarea class="form-control" name="description" id="product_info" data-parsley-group="block1" required
                  rows="15" col="55" value="" onkeyup="limitlengths(this, 500,'product_info_label')">{$blogs.description}
        </textarea>
                        </div>
                        <div class="form-group">
                            <label>Upload File</label>
                            <input name="blog_image" id="file" type="file"> {$blogs.image}
                        </div>

                        <input name="submit_user_profile" class="btn btn-warning" value="Reset" title="Reset" class="fl"
                               type="reset">
                        <input name="admin_product_add" class="btn btn-success" value="Add" title="Add" class="fl"
                               type="submit"></form>
                </div>

            </div>
        </div>
    </div>
</div>
{include file="/admincp/footer.tpl" nocache}