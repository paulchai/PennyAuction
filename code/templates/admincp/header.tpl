<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=no"/>
    <meta name="description" content="telecom training"/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>

    <title>Admin</title>
    <link rel="shortcut icon" href="{$config['url']}/image/logo.png">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,600,700,800,300'
          rel='stylesheet' type='text/css'/>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="{$config['url']}/bower_components/bootstrap/dist/css/bootstrap.min.css"/>

    <!-- Custom CSS -->
    <link href="{$config.dpath}css/admincp/ds-forms.css" rel="stylesheet">

    <!--Pagination design-->
    <link rel="stylesheet" type="text/css" href="{$config.url}/css/footer.css"/>

    <!-- Morris Charts CSS -->
    <link href="{$config.dpath}css/admincp/registration-form.css" rel="stylesheet">

    <link href="{$config.dpath}css/admincp/reset-min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="{$config.dpath}css/admincp/penny_admin.css"/>

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="{$config['url']}/bower_components/components-font-awesome/css/font-awesome.min.css">
    {foreach $external2css as $key => $val}
    <link rel="stylesheet" href="{$config['externalcss']}{$val}.css" type="text/css"/>
    {/foreach}
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="{$config['externaljs']}country.js"  type="text/javascript"></script>
    <!-- <script>
     var originaur      = window.location.href;
   var duplicateur = originaur.replace('8080', '8880');
   if(window.location.href.indexOf("8080") > -1) {
       //alert(duplicateur);
    window.location.href = duplicateur;
     }

     </script>-->

</head>

<body>

<header class="pa_header">
    <div class="nav pa_nav">
        <div class="logo"><a href="{$config.url}/admincp/"> <img src="/images/admincp/logo.png" class="img-responsive"
                                                                 alt="Auction Software"/></a></div>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>&nbsp;Menu
        </button>
        {if !$logincheck}
        <div id="navbar-collapse" class="top_menu_right navbar-collapse collapse" role="navigation">
            <ul>
                <li><a>Hi Welcome admin</a></li>
                <!--<li><a>My Info</a></li>
                <li><a>Change Password</a></li>-->
                <li><a href="{$config.url}/login/logout">Log out</a></li>
            </ul>
        </div>
        {/if}
    </div>
</header>