<!DOCTYPE html>
<html>
<head>
    <!-- Metas
        ================================================== -->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no"/>
    <meta name="description" content="telecom training"/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>

    <!-- Page Title
        ================================================== -->
    <title>{$config.title}</title>

    <!-- Favicon
        ================================================== -->
    <link rel="shortcut icon" href="{$config['url']}/image/logo.png">

    <!-- Google fonts
        ================================================== -->

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,600,700,800,300'
          rel='stylesheet' type='text/css'/>

    <!-- bootstrap v3.0.2
        ================================================== -->

    <link rel="stylesheet" href="{$config['url']}/bower_components/bootstrap/dist/css/bootstrap.min.css"/>

    <!--font-awesome
        ================================================== -->
    <link rel="stylesheet" href="{$config['url']}/bower_components/components-font-awesome/css/font-awesome.min.css">
    <!-- CSS Custom
        ================================================== -->
    <link rel="stylesheet" type="text/css" href="{$config['url']}/css/styles.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}reset-min.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny_auction.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}registration-form.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}ds-forms.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}theme{$themeno}.css"/>
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}common_responsive.css"/>
    <!--<script>
        var originaur      = window.location.href;
      var duplicateur = originaur.replace('8080', '8880');
      if(window.location.href.indexOf("8080") > -1) {
          //alert(duplicateur);
       window.location.href = duplicateur;
        } </script>-->

    <script src="{$config.url}/socket.io/socket.io.js"></script>
    <script src="{$config['url']}/bower_components/jquery/dist/jquery.js"></script>
    <script src="{$config['url']}/bower_components/countUp.js/countUp.js"></script>
    <!--<script src="{$config['externaljs']}theme.js"></script>-->
    <script>
        var socket = io.connect();
        var ILBASE = '{$config.url}';
        function changetheme(dis) {
            $("#change_theme").submit();
        }
        /*
        window.onload = function() {
            // setup CountUp object
            jackpotamount1 = new CountUp('jackpotamount', {$jackpot}, {$jackpot}, 0, 2.5);
            if ($('#userjackpot').length > 0) {
                userjackpot = new CountUp('userjackpot', {$userbalance.jackpot}, {$userbalance.jackpot}, 0, 2.5);
            }

        }*/
    </script>
    {foreach $external2css as $key => $val}
    <link rel="stylesheet" href="{$config['externalcss']}{$val}.css" type="text/css"/>
    {/foreach}
    <link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny_auction_new.css"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <script src="{$config['externaljs']}country.js"  type="text/javascript"></script>
</head>
<style>
    .oe3 {
        color: white;
        text-decoration: none;
    }

    .oe3:hover {
        color: white;
        text-decoration: none;
    }

    .oe3:active {
        color: white;
        text-decoration: none;
    }
</style>
<body>
<div class="head">
    <div class="fotdi1 ftmdpro">
        <div class="container ft12px1">
            <div class="row top_nav">
                <div class="col-md-6">{$_phrase.version}</div>
                <div class="col-md-6 txt_arht tn_rht">
                    {if !$cusdisable} <span> {$_phrase.viewcolour} &nbsp; </span>
                    <span class="block">
                        <form action="{$config['url']}/index/changetheme"
                              id="change_theme" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="gopage" value="{$config['url']}{$pageofjs}">
                            <select onChange="changetheme(this)" name="themeno" style="color:#000">
                                <option value="0" {if $themeno== 1} selected {/if}>{$_phrase.auctionstone}</option>
                                <option value="4" {if $themeno== 4} selected {/if}>{$_phrase.blackforest}</option>
                                <option value="1" {if $themeno== 1} selected {/if}>{$_phrase.babyblue}</option>
                                <option value="2" {if $themeno== 2} selected {/if}>{$_phrase.glossybyzantium}</option>
                                <option value="3" {if $themeno== 3} selected {/if}>{$_phrase.deepred}</option>
                            </select>
                        </form>
                    </span> &nbsp;| &nbsp;
                    <span class="cursor">{$_phrase.loginas}</span> &nbsp;
    <span class="block">
        <form action="{$config['url']}/login/save" id="autologin" method="post"
              enctype="multipart/form-data">
            <input type="hidden" name="autologin" value="1">
            <input type="hidden" name="username" id="autologinuserid" value="">
            <select onChange="loginauto(this)" name="autologinoption" style="color:#000">
                <option value="0" {if $autologin== 0} selected {/if}>{$_phrase.select}</option>
                <option value="buyer" {if $autologin=='buyer'} selected {/if}>{$_phrase.buyer}</option>
                <option value="admin" {if $autologin=='admin'} selected {/if}>{$_phrase.admin}</option>
            </select>
        </form>
    </span>{/if}
                    <!--<span class="cursor" onClick="window.location='{$config['url']}/admincp'">Admin</span>-->

                    <a href="/contact" class="oe3">{$_phrase.contact_us} </a> &nbsp| &nbsp;
                    <a href="http://www.{$_phrase.domain|lower}" class="oe3"> {$_phrase.backto} {$_phrase.domain}</a> &nbsp| &nbsp;
                    <a href="{$_phrase.other_url}" class="oe3"> {$_phrase.other_lang}</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

    <div class="container ftmdpro">
        <div class="row ftmdpro" style="margin-top:15px; margin-bottom:15px;">
            <div class="col-md-4 logo_img" style="margin-top: -13px;">
                <a href="{$config.url}">
                    <img class="img-responsive" src="{$config['url']}/image/logo.png"/>
                </a>
            </div>
            <div class="col-md-6 search_wrap" style="max-width: 500px;">
                <button type="button" class="navbar-toggle srch_icon" data-toggle="collapse" data-target="#srch_items">
                    <i class="fa fa-search"></i>
                </button>
                <div id="srch_items" class="navbar-collapse collapse">
                    <form action="{$config.url}/search" id="user_search" name="user_search" method="get"
                          enctype="multipart/form-data">
                        <div class="input-group">
                            <input type="text" class="form-control srbt3" value="{$search_search}" name="search"
                                   id="search" maxlength="300" placeholder="{$_phrase.search}">
                            <!--<input type="hidden" value="{$ptitle}" name="page" /> -->
                            <input type="hidden" value="{$ptitle}" name="page"/>
                            <input type="hidden" value="01" name="sort" id="sort"/>
                            <input type="hidden" value="0" class="mdropdown" name="cid"/>
    <span class="input-group-addon srbt srbt4" onClick="searchProject();">
       <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
    </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-2 srtr3">
                {if $loged.userid > 0}
                {$_phrase.yourshare} <span id="usershare">{$userbalance.share}</span> /
                {else}
                {$_phrase.totalshare} <span id="totalshare">{$share}</span> /
                {/if}
                {$_phrase.jackpot}: $
                <span id="jackpotamount">{$jackpot}</span>
            </div>
        </div>
        <div class="row">

            <nav class="navbar navbar-default hifiy ftmdpro" style="z-index:100">
                <div class="container-fluid">

                    <div class="navbar-header mg42min">
                        <button type="button" class="navbar-toggle collapsed bttny2 menu_btn" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="fa fa-bars"></span>
                        </button>

                    </div>


                    <div class="collapse navbar-collapse ftmdpro" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav midqurn" style="font-size:17px;margin-bottom: 0px;">

                            <li class="hty3" style="margin-left: 18px;"><a href="{$config.url}" title="Home">
                                {$_phrase.home}</a></li>
                            <li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/live" title="Live Auctions"> {$_phrase.live}{$_phrase.engspace}{$_phrase.auction}{$_phrase.s}</a></li>
                            <li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/future" title="Future Auctions"> {$_phrase.futureauction} </a></li>
                            <li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/closed" title="Closed Auctions"> {$_phrase.closed}{$_phrase.engspace}{$_phrase.auction}{$_phrase.s}</a></li>
                            <li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/shop" title="Shop Now"> {$_phrase.buy_now}</a></li>
                            <li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/winner" title="Winners">
                                {$_phrase.winner}{$_phrase.s}</a></li>
                            {if !$cusdisable}<li class="l9ie">|</li>
                            <li class="hty3"><a href="{$config.url}/blog" title="Blogs">{$_phrase.blog}{$_phrase.s}</a></li>{/if}
                        </ul>
                        <ul class="nav navbar-nav navbar-right midqurn" style="font-size:17px;">
                            {if $loged.userid > 0}
                            <li class="hty3"><a href="{$config.url}/dashboard/" title="{$loged.first_name}">
                                <span class="glyphicon glyphicon-user"></span> {$loged.first_name}</a></li>
                            <li class="hty3"><a href="{$config.url}/login/logout/" title="Logout">
                                <span class="glyphicon glyphicon-log-in"></span> {$_phrase.logout}</a></li>
                            {else}
                            {if !$cusdisable}
                            <li class="hty3"><a data-toggle="modal" data-target="#myModal" href="javascript:void(0);">
                                <span class="glyphicon glyphicon-user"></span> {$_phrase.register}</a></li>{/if}
                            <li class="hty3"><a data-toggle="modal" data-target="#login" href="javascript:void(0);">
                                <span class="glyphicon glyphicon-log-in"></span> {$_phrase.log_in}</a></li>
                            {/if}
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class="container">
