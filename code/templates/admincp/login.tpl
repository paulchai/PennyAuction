{include file="/admincp/header.tpl"}
<div class="main_container login_wrapper">
	<div class="panel panel-primary">
		<div class="panel-heading">LOG IN TO ADMIN PANEL</div>
		<div class="panel-body">
          <form action="{$config['url']}/admin/login/save" method="post"  enctype="multipart/form-data"  >
			<div class="row">
				<div class="col-md-3">User Name<span class="pull-right">:</span></div>
				<div class="col-md-9">
                     <input type="text" id="username" name="username" value="admin@auctionsoftware.com" placeholder="Enter username"  class="form-control">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">Password<span class="pull-right">:</span></div>
				<div class="col-md-9">
					<input type="password" id="password" name="password" value="chennai"  class="form-control">
				</div>
			</div>
			<div class="vsep"></div>
			<div class="row">
				<div class="col-md-9 fget_psd">
					<!--<a href="">Forget your password?</a>-->
				</div>
				<div class="col-md-3">
                	<input type="submit" value="Login" name="id" class="btn btn-primary" />					
				</div>
			</div>
          </form>
		</div>
	</div>
</div>	
{include file="/admincp/footer.tpl"}