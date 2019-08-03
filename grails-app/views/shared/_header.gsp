<!DOCTYPE html>
<html>
<head>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8" />
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Import main.css -->
    <asset:stylesheet src="application.css"/>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <asset:javascript src="application.js"/>
</head>
<body>
<!-- Dropdown Structure -->
<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="/" class="brand-logo">Daybook</a>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger" style="color:black;"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li>
                <a class="dropdown-trigger" href="#" data-target="dropdown-daybook">
                    <i class="fa fa-sticky-note" aria-hidden="true"></i> 記帳本
                    <i class="material-icons right" style="margin-left:0px">arrow_drop_down</i>
                </a>
            </li>
            <li>
                <a class="dropdown-trigger" href="#" data-target="dropdown-category">
                    <i class="fa fa-list-alt" aria-hidden="true"></i> 記帳類別
                    <i class="material-icons right" style="margin-left:0px">arrow_drop_down</i>
                </a>
            </li>
            <li><a href="/chart"><i class="fa fa-bar-chart" aria-hidden="true"></i> 統計圖</a></li>
            <li>
                <g:link controller='secure' action="logout">
                    <i class="fa fa-sign-out" aria-hidden="true"></i> 登出
                </g:link>
            </li>
        </ul>
    </div>
</nav>

<ul id="dropdown-daybook" class="dropdown-content">
    <li><a href="/daybook">列表</a></li>
    <li><a href="/daybook/create">新增</a></li>
</ul>
<ul id="dropdown-category" class="dropdown-content">
    <li><a href="/daybookCategory">列表</a></li>
    <li><a href="/daybookCategory/create">新增</a></li>
</ul>

<ul id="nav-mobile" class="sidenav">
    <li><a href="/daybook">記帳本</a></li>
    <li><a href="/daybookCategory">記帳類別</a></li>
    <li><a href="/chart">統計圖</a></li>
</ul>

<main>