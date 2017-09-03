<!DOCTYPE html>
<html>
<head>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8" />
    <!-- Font Awesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- Import main.css -->
    <asset:stylesheet src="application.css"/>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>
    <asset:javascript src="application.js"/>
</head>
<body>
<!-- Dropdown Structure -->
<ul id="dropdown-daybook" class="dropdown-content">
    <li><a href="/daybook">列表</a></li>
    <li><a href="/daybook/create">新增</a></li>
</ul>
<ul id="dropdown-category" class="dropdown-content">
    <li><a href="/daybookCategory">列表</a></li>
    <li><a href="/daybookCategory/create">新增</a></li>
</ul>
<ul id="dropdown-daybook-mobile" class="dropdown-content">
    <li><a href="/daybook">列表</a></li>
    <li><a href="/daybook/create">新增</a></li>
</ul>
<ul id="dropdown-category-mobile" class="dropdown-content">
    <li><a href="/daybookCategory">列表</a></li>
    <li><a href="/daybookCategory/create">新增</a></li>
</ul>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="#" class="brand-logo">Daybook</a>
        <ul class="right hide-on-med-and-down">
            <li><a class="dropdown-button" href="#" data-activates="dropdown-daybook">記帳本 <i
                    class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" href="#" data-activates="dropdown-category">記帳類別<i
                    class="material-icons right">arrow_drop_down</i></a></li>
            <li><a href="/chart">統計圖</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a class="dropdown-button" href="#" data-activates="dropdown-daybook-mobile">記帳本<i
                    class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button" href="#" data-activates="dropdown-category-mobile">記帳類別<i
                    class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>

<main>