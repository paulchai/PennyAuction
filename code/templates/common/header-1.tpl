<!DOCTYPE html>
<!--[if IE 8]> <html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
<!--[if IE 9]> <html class="ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<!-- Metas
	================================================== -->
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, user-scalable=no, target-densitydpi=device-dpi"/>
<meta name="description" content="telecom training" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Page Title 
	================================================== -->
<title>{$config.title}</title>

<!-- Favicon 
	================================================== -->
<link rel="shortcut icon" href="">

<!-- Google fonts
	================================================== -->

<!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,600,700,800,300' rel='stylesheet' type='text/css' />
-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600,700' rel='stylesheet' type='text/css'>
<!-- bootstrap v3.0.2
	================================================== -->

<!--<link rel="stylesheet" href="{$config['externalcss']}bootstrap.css">-->
<link href="{$config['url']}/css/bootstrap.css" rel="stylesheet">

<!--font-awesome
	================================================== -->
<!--<link rel="stylesheet" href="{$config['externalcss']}font-awesome.css">-->
<link rel="stylesheet" href="{$config['url']}/css/font-awesome.css">

<!-- CSS Custom

	================================================== -->
<link rel="stylesheet" href="{$config['url']}/css/test2.css">
<link rel="stylesheet" href="{$config['url']}/css/common.css">

<!--<link rel="stylesheet" type="text/css" href="{$config['externalcss']}reset-min.css" />-->
<!--<link rel="stylesheet" type="text/css" href="{$config['externalcss']}penny_auction.css" />-->
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}dashboard.css" />
<link rel="stylesheet" type="text/css" href="{$config['externalcss']}registration-form.css" />
<!--<link rel="stylesheet" type="text/css" href="{$config['externalcss']}ds-forms.css" />-->
<link rel="stylesheet" type="text/css" href="{$config['url']}/css/parsley.css" />
<script src="{$config.url}/socket.io/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
<script>
var socket = io.connect();
</script>
<!--{foreach $external2css as $key => $val}
<link rel="stylesheet" href="{$config['externalcss']}{$val}.css" type="text/css" />
{/foreach}-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" href="{$config['url']}/css/home.css">
</head>
<body>
<div class="container-fluid ">
  <div class="row defl1">
    <nav class="navbar navbar-default defal"> 
      
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a href="{$config['url']}"> <img src="{$config['url']}/assets/img/logo.png"/> </a> </div>
      
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:right">
        <div style="float:left">
          <ul class="nav navbar-nav mrg1" style="float:right;width:100%">
            <li ><a href="{$config['url']}">Main Page</a></li>
            {if !$loged.userid}  <li ><a href="javascript:void(0);" onclick="javascript:$('#reg_myModal').modal('show');">Register</a></li> {/if}
           {if $loged.userid} <li>
              <div class="col-md-3 head-search input-group  pull-left" style="width:250px;margin:0">
                <form action="{$config['url']}/search" method="get"  class="navbar-form pull-right padding0" role="search" enctype="multipart/form-data" id="loginform"  >
                  <input type="hidden" value="index" name="page">
                  <input type="text" name="search" value="{$search_search}" placeholder="search....." maxlength="50" title="search" class="form-control" style="width:200px;height:30px">
                  <button class="input-group-addon btn btn-info srch_btn" style="height:30px;width:34px"> <i class="fa fa-search"></i> </button>
                </form>
              </div>
            </li>
            
            <li > <a href="{$config.url}/dashboard/" title="{$loged.first_name}" style="font-size:11px;"> <span> {$_phrase.welcome}! {$loged.first_name} </span> </a> </li>
            {/if}
          </ul> 
        </div>
        <!--<div class="col-md-3 head-search input-group  pull-left" style="width:500px;margin:0">
         <form action="{$config['url']}/search" method="get"  class="navbar-form pull-right padding0" role="search" enctype="multipart/form-data" id="loginform"  >
         <input type="hidden" value="index" name="page">
         <input type="text" name="search" value="{$search_search}" placeholder="search....." maxlength="50" title="search" class="form-control" style="width:200px;height:30px">
         <button class="input-group-addon btn btn-info srch_btn" style="height:30px;width:34px"> <i class="fa fa-search"></i> </button>
          </form>
        </div>--> 
        {if !$loged.userid}
        <form action="{$config['url']}/login/save" method="post" class="navbar-form pull-right padding0" role="search"  enctype="multipart/form-data" id="loginform"  >
          <div class="form-group">
            <input type="text" name="username"  id="username" placeholder="Email" class="form-control hei">
          </div>
          <div class="form-group">
            <input type="password" name="password"  id="passowrd"   placeholder="Password" class="form-control hei">
          </div>
          <button type="button" onclick="loginaction();" name="login" class="btn btn-success">Sign in</button>
        </form>
        {else}
        <form method="get" action="{$config.url}/login/logout/"  class="navbar-form pull-right padding0"  role="search">
          <button type="submit" class="btn btn-gray"><i class="fa fa-lock"></i>&nbsp;&nbsp;Logout</button>
        </form>
        {/if} </div>
      <!-- /.navbar-collapse --> 
    </nav>
  </div>
</div>

{if $loged.userid > 0}
<div  style="width:1024px;margin:auto;">  <span style="font-size:11px;padding-top:10px;color:#666;float:right"> Available Balance : <span class="orange" style="font-size:11px;">${$userbalance.ledger}</span> &nbsp; Ledger Balance : <span class="orange" style="font-size:11px;">${$userbalance.balance}</span> </span> </div>
{/if}

<div style="clear:both"></div>
<div class="main_container" style="margin:10px auto">


