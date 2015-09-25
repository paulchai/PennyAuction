<div class="left_admin_panel clearfix">
<style>
.left_admin_panel .nav li ul li.active {
	background: #248DC1 !important;
    border-bottom: 1px solid #3BBADF !important;
}
</style>
                    <ul class="nav navbar-nav side-nav">
                                <li class="active">
                                    <a href="{$config.url}/admincp/dashboard/">Dashboard</a>
                                </li>
                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#users" id="usertabid" class="ad_llst collapsed"aria-expanded="false">Users<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                                    <ul id="users" class="collapse " aria-expanded="false">
                                         <li class="{$menu.addusersmenu}">
                                            <a href="{$config.url}/admincp/users/add" {$auser}>Add Users</a>
                                        </li>
                                        <li class="{$menu.allusersmenu}">
                                            <a href="{$config.url}/admincp/users/">All Users</a>
                                        </li>
                                        <li class="{$menu.activeusersmenu}">
                                            <a href="{$config.url}/admincp/users/active">Active Users</a>
                                        </li>
                                        <li class="{$menu.moderateusersmenu}">
                                            <a href="{$config.url}/admincp/users/moderate">Moderate Users</a>
                                        </li>
                                        <li class="{$menu.unverifiedusersmenu}">
                                            <a href="{$config.url}/admincp/users/unverified">Unverified Users</a>
                                        </li>
                                         <li class="{$menu.cancelusersmenu}">
                                            <a href="{$config.url}/admincp/users/cancel">Cancelled Users</a>
                                        </li>
                                        <li class="{$menu.searchusersmenu}">
                                            <a href="{$config.url}/admincp/users/search">Search Users</a>
                                        </li>

                                    </ul>
                                </li>
                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#projects" id="auctiontabid" class="ad_llst collapsed"aria-expanded="false">Products<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
                                   <ul id="projects" class="collapse "  aria-expanded="false" >
                                        <li class="{$menu.projectsnewmenu}">
                                            <a href="{$config.url}/admincp/projects/new">New Product</a>
                                        </li>
                                        <li class="{$menu.projectsearchmenu}">
                                            <a href="{$config.url}/admincp/projects/list">All Products</a>
                                        </li>
                                        <li class="{$menu.projectsbulk}">
                                            <a href="{$config.url}/admincp/products/bulkupload">Bulk Import</a>
                                        </li>
                                    </ul>
                                </li>

                              <li>
                                <a href="javascript:void(0);" data-toggle="collapse" data-target="#Storestab" id="storestabid" class="ad_llst collapsed"aria-expanded="false">Stores<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                <ul id="Storestab" class="collapse " aria-expanded="true">
                                    <li class="{$menu.addstore}"> <a href="{$config.url}/admincp/stores/new">Add New Stores</a> </li>
                                    <li class="{$menu.liststores}"> <a href="{$config.url}/admincp/stores/list">Manage Stores</a> </li>
                                  </ul>

                              </li>

                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#General" id="generaltabid" class="ad_llst collapsed"aria-expanded="false">General Settings<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                    <ul id="General" class="collapse " aria-expanded="true">
                                    	<li class="{$menu.categoriesmenu}">
                                            <a href="{$config.url}/admincp/categories/list/" > <i class="fa fa-fw fa-sitemap"></i> Categories</a>
                                        </li>
                                        <li class="{$menu.messagesmenu}">
                                            <a href="{$config.url}/admincp/messages/" > <i class="fa fa-fw fa-inbox"></i> Messages</a>
                                        </li>
                                        <li class="{$menu.reviewsmenu}">
                                            <a href="{$config.url}/admincp/reviews/" > <i class="fa fa-fw fa-edit"></i> Reviews</a>
                                        </li>
                                        <li class="{$menu.disputemenu}">
                                            <a href="{$config.url}/admincp/dispute/" > <i class="fa fa-fw fa-file"></i> Dispute</a>
                                        </li>
                                        <li class="{$menu.referralmenu}">
                                            <a href="{$config.url}/admincp/referral/" > <i class="fa fa-fw fa-money"></i> Referrals</a>
                                        </li>
                                        <li class="{$menu.coupons}">
                                            <a href="{$config.url}/admincp/coupons/" > <i class="fa fa-fw fa-money"></i> Coupons</a>
                                        </li>
                                        <li class="{$menu['transactionmenu']}">
                                            <a href="{$config.url}/admincp/transaction/list/" ><i class="fa fa-fw fa-money"></i> Transactions</a>
                                        </li>
                                         <li class="{$menu['withdrawalmenu']}">
                                            <a href="{$config.url}/admincp/withdrawal/" ><i class="fa fa-fw fa-money"></i> Withdrawal</a>
                                        </li>
                                        <li class="{$menu['blogmenu']}">
                                            <a href="{$config.url}/admincp/blog/" ><i class="fa fa-fw fa-money"></i> Blog</a>
                                        </li>
                                        <li class="{$menu['emailmenu']}">
                                            <a href="{$config.url}/admincp/email/" ><i class="fa fa-fw fa-money"></i> Email Template</a>
                                        </li>
                                    </ul>

                                </li>
                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#settings" id="servertabid" class="ad_llst collapsed"aria-expanded="false">Server Settings <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                    <ul id="settings" class="collapse " aria-expanded="false" >
                                        <li class="{$menu.commonsettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/common">System</a>
                                        </li>
                                        <li class="{$menu.generalsettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/general">General</a>
                                        </li>
                                        <li class="{$menu.paypalsettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/paypal">Paypal</a>
                                        </li>


                                         <li class="{$menu.databasesettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/database">Database</a>
                                        </li>
                                        <li class="{$menu.cardsettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/card">Credit Card</a>
                                        </li>

                                         <li class="{$menu.customeriosettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/customerio">CustomerIO</a>
                                        </li>
                                        <li class="{$menu.facebooksettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/facebook">Facebook</a>
                                        </li>

                                         <li class="{$menu.linkedinsettingsmenu}">
                                            <a href="{$config.url}/admincp/settings/linkedin">LinkedIn</a>
                                        </li>



                                    </ul>

                                </li>

                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#language" id="languagetabid" class="ad_llst collapsed"aria-expanded="false">Language Settings <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                    <ul id="language" class="collapse " aria-expanded="false" >
                                        <li class="{$menu.phraselanguagemenu}">
                                            <a href="{$config.url}/admincp/language/phrase">Phrases</a>
                                        </li>
                                        <li class="{$menu.newphraselanguagemenu}">
                                            <a href="{$config.url}/admincp/language/newphrase">New Phrase</a>
                                        </li>
                                         <li class="{$menu.languagelanguagemenu}">
                                            <a href="{$config.url}/admincp/language/language">Select Language</a>
                                        </li>
                                        <li class="{$menu.importlanguagemenu}">
                                            <a href="{$config.url}/admincp/language/import">Import</a>
                                        </li>
                                        <li class="{$menu.exportlanguagemenu}">
                                            <a href="{$config.url}/admincp/language/export">Export</a>
                                        </li>
                                    </ul>

                                </li>

                                <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#Template" id="templatetabid" class="ad_llst collapsed"aria-expanded="false">Templates<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                    <ul id="Template" class="collapse " aria-expanded="false" >
                                       <li class="{$menu.templatemenu}">
                                            <a href="{$config.url}/admincp/template/"><i class="fa fa-fw fa-file"></i>Template</a>
                                        </li>
                                    </ul>

                                </li>

                               <!-- <li class="">
                                    <a href="javascript:;" data-toggle="collapse" data-target="#Masters" id="masterstabid" class="ad_llst collapsed"aria-expanded="false">Masters<span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>

                                    <ul id="Masters" class="collapse " aria-expanded="false" >
                                       <li class="{$menu.managebidmastermenu}">
                                            <a href="{$config.url}/admincp/masters/managebid"><i class="fa fa-fw fa-file"></i>Manage Bid Packages</a>
                                        </li>
                                         <li class="{$menu.bonusmastermenu}">
                                            <a href="{$config.url}/admincp/masters/bonus"><i class="fa fa-fw fa-file"></i>User Bonus</a>
                                        </li>
                                        <li class="{$menu.bonussettingsmastermenu}">
                                            <a href="{$config.url}/admincp/masters/bonussettings"><i class="fa fa-fw fa-file"></i>Bonus Settings</a>
                                        </li>
                                        <li class="{$menu.depositmastermenu}">
                                            <a href="{$config.url}/admincp/masters/deposit"><i class="fa fa-fw fa-file"></i>Manage Deposits</a>
                                        </li>
                                        <li class="{$menu.vouchermastermenu}">
                                            <a href="{$config.url}/admincp/masters/voucher"><i class="fa fa-fw fa-file"></i>Manage Voucher</a>
                                        </li>
                                        <li class="{$menu.newsmastermenu}">
                                            <a href="{$config.url}/admincp/masters/news"><i class="fa fa-fw fa-file"></i>Manage News</a>
                                        </li>
                                        <li class="{$menu.gatewaymastermenu}">
                                            <a href="{$config.url}/admincp/masters/gateway"><i class="fa fa-fw fa-file"></i>Payment Gateways</a>
                                        </li>
                                        <li class="{$menu.emailtemplatemastermenu}">
                                            <a href="{$config.url}/admincp/masters/emailtemplate"><i class="fa fa-fw fa-file"></i>Manage Email Templates</a>
                                        </li>
                                        <li class="{$menu.newslettermastermenu}">
                                            <a href="{$config.url}/admincp/masters/newsletter"><i class="fa fa-fw fa-file"></i>Manage Email Newsletter</a>
                                        </li>
                                        <li class="{$menu.modulesmastermenu}">
                                            <a href="{$config.url}/admincp/masters/modules"><i class="fa fa-fw fa-file"></i>Manage Modules</a>
                                        </li>

                                    </ul>

                                </li>-->

                            </ul>

                </div>