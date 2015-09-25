<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>{$config.title}</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, user-scalable=no, target-densitydpi=device-dpi"/>
<meta name="description" content="telecom training" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="{$config['url']}/css/font-awesome.css">
<!--<link href="{$config['url']}/assets/css/bootstrapTheme.css" rel="stylesheet">-->
<link href="{$config['url']}/assets/css/custom.css" rel="stylesheet">
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
<link href="{$config['url']}/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="{$config['url']}/css/home.css">
<link rel="stylesheet" href="{$config['url']}/css/common.css">

<link href="{$config['url']}/css/ds-forms.css" rel="stylesheet">
<link href="{$config['url']}/css/registration-form.css" rel="stylesheet">


<link rel="stylesheet" href="{$config['url']}/css/parsley.css">

</head>

<body style="overflow-x:hidden">

<!-- /.container-fluid --> 

<!--SLIDER1-->

 <div class="container-fluid" >
  <div class="row ">
    <nav class="navbar navbar-default defal"> 
      
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <img src="{$config['url']}/assets/img/logo.png" /> </div>
      
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:right">
        <ul class="nav navbar-nav mrg1">
         {if $loged.userid} <li><a href="{$config['url']}/dashboard">Dashboard</a></li> {/if}
          <li ><a href="{$config['url']}">Main Page</a></li>
         {if !$loged.userid}  <li ><a href="javascript:void(0);" onclick="javascript:$('#reg_myModal').modal('show');">Register</a></li> {/if}
      </ul>
      
         {if !$loged.userid}
        <form action="{$config['url']}/login/save" method="post" class="navbar-form pull-right padding0" style="margin-bottom:0px" role="search" enctype="multipart/form-data" id="loginform">
          <div class="form-group">
            <input type="text" name="username" id="username" placeholder="Email" class="form-control hei">
          </div>
          <div class="form-group">
            <input type="password" name="password" id="passowrd"  placeholder="Password" class="form-control hei">
          </div>
          <button type="button" onclick="loginaction()" name="login" class="btn btn-success">Sign in</button>
        </form>
        {else}
          <form method="get" action="{$config.url}/login/logout/"  class="navbar-form pull-right padding0" style="margin-bottom:0px;margin-left:70px" role="search">
            <button type="submit"  class="btn btn-gray" style="margin-top:0"><i class="fa fa-lock"></i>&nbsp;&nbsp;Logout</button>
          </form>
          
           {/if}  </div>
      <!-- /.navbar-collapse --> 
    </nav>
  </div>
</div>
