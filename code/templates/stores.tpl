{include file="common/header-1.tpl" nocache} <div class="row">
	<div class="container">
		<div class="row">
			<div class="col-md-12 eleftn1">
				Stores
			</div>

			<div class="col-md-12">

				{foreach $stores as $val}
				<div class="col-md-3 divforcol4" style="margin-left:50px;">
					<div>
						<div class="btptptmg">
							<a href="{$config['url']}/stores/view?storeid={$val.id}">	<img src="{if $val.avatar == ''} {$config['imgpath']}no_img.png {else if $val.avatar != ''}{$config['imgpath']}stores/{$val.avatar}{/if}"  alt="1" class="img-thumbnail"></a></div>
						<div>{$val.name}</div>
						<div class="col-md-12" style="min-height: 150px;max-height: 150px">{$val.description}</div>
						<div class="col-md-12">
							<div class="col-md-8"></div>
							<div class="col-md-4"><a href="{$config['url']}/stores/view?storeid={$val.id}"><button type="button" class="btn btn-primary pribtnon">View</button></a></div>

						</div>
					</div>
				</div>

				{/foreach}
		</div>

			<div class="col-lg-12 text-center">
				<nav>
					{$pagination_html}
				</nav>
			</div>

				</div>
	</div>  </div>
	{include file="common/footer-1.tpl" nocache}