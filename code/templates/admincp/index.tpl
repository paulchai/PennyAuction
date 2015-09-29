{include file="/admincp/header.tpl" nocache}



            <div class="main_container admin_wrapper">
            
            {include file="/admincp/left-nav.tpl" nocache}
                
                <div class="right_admin_panel clearfix">
                <div class="admin_rwrap">
                <div class="aw_thead">AUCTIONS</div>
                <div class="row">
                    <a href="{$config.url}/admincp/projects/open"><div class="col-md-3 db_dbox">
                        <div class="adb_lbl">
                            <div>{$project.open}</div>
                            <div>Live <br/> Auctions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/projects/sold"><div class="col-md-3 db_dbox1">
                        <div class="adb_lbl">
                            <div>{$project.sold}</div>
                            <div>Won <br/> Auctions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon1.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/projects/future"><div class="col-md-3 db_dbox2">
                        <div class="adb_lbl">
                            <div>{$project.future}</div>
                            <div>Future <br/> Auctions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon2.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/projects/closed"><div class="col-md-3 db_dbox3">
                        <div class="adb_lbl">
                            <div>{$project.closed}</div>
                            <div>Closed <br/> Auctions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon3.png" alt="" />
                        </div>
                    </div>
                    </a>
                </div>
                <div class="aw_thead">USERS</div>
                <div class="row">
                    <a href="{$config.url}/admincp/users/active"><div class="col-md-3 db_dbox4">
                        <div class="adb_lbl">
                            <div>{$users.active}</div>
                            <div>Active<br/> Users</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon4.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/users/moderate"><div class="col-md-3 db_dbox5">
                        <div class="adb_lbl">
                            <div>{$users.moderate}</div>
                            <div>Moderate <br/>Users</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon5.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/users/unverified"><div class="col-md-3 db_dbox6">
                        <div class="adb_lbl">
                            <div>{$users.unverified}</div>
                            <div>Unverified <br/>Users</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon6.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/users/cancel"><div class="col-md-3 db_dbox7">
                        <div class="adb_lbl">
                            <div>{$users.cancel}</div>
                            <div>Cancelled<br/>Users</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon7.png" alt="" />
                        </div>
                    </div>
                    </a>
                </div>
                <div class="aw_thead">TRANSACTIONS</div>
                <div class="row">
                    <a href="{$config.url}/admincp/transaction/sold"><div class="col-md-3 db_dbox8">
                        <div class="adb_lbl">
                            <div>{$trans.sold}</div>
                            <div>Sold <br/> Transactions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon8.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/transaction/package"><div class="col-md-3 db_dbox9">
                        <div class="adb_lbl">
                            <div>{$trans.package}</div>
                            <div>Package  <br/> Transactions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon9.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/transaction/winner"><div class="col-md-3 db_dbox10">
                        <div class="adb_lbl">
                            <div>{$trans.winner}</div>
                            <div>Total<br/> Winners</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon10.png" alt="" />
                        </div>
                    </div>
                    </a>
                    <a href="{$config.url}/admincp/transaction/bid"><div class="col-md-3 db_dbox11">
                        <div class="adb_lbl">
                            <div>{$trans.bid}</div>
                            <div>Bid  <br/> Transactions</div>
                        </div>
                        <div class="adb_lbl1">
                        <img src="/images/admincp/dashboard_icon11.png" alt="" />
                        </div>
                    </div>
                    </a>
                </div>
                </div>
                </div>
                
            </div>

           
{include file="/admincp/footer.tpl" nocache}
