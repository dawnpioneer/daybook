<!doctype html>
<html class="no-js" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="vendor.css"/>
<link rel="stylesheet" type="text/css" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div class="main-wrapper">
    <div class="app" id="app">
        <header class="header">
            <div class="header-block header-block-collapse hidden-lg-up">
                <button class="collapse-btn" id="sidebar-collapse-btn">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <div class="header-block header-block-search hidden-sm-down">
                <form role="search">
                    <div class="input-container">
                        <i class="fa fa-search"></i>
                        <input type="search" placeholder="Search">
                        <div class="underline"></div>
                    </div>
                </form>
            </div>
            <div class="header-block header-block-nav">
                <ul class="nav-profile">
                    <li class="profile dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <div class="img" style="background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40')"> </div>
                            <span class="name"> John Doe </span>
                        </a>
                        <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                            <a class="dropdown-item" href="#">
                                <i class="fa fa-user icon"></i> Profile </a>
                            <a class="dropdown-item" href="#">
                                <i class="fa fa-bell icon"></i> Notifications </a>
                            <a class="dropdown-item" href="#">
                                <i class="fa fa-gear icon"></i> Settings </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="login.html">
                                <i class="fa fa-power-off icon"></i> Logout </a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <aside class="sidebar">
            <div class="sidebar-container">
                <div class="sidebar-header">
                    <div class="brand">
                        <div class="logo">
                            <span class="l l1"></span>
                            <span class="l l2"></span>
                            <span class="l l3"></span>
                            <span class="l l4"></span>
                            <span class="l l5"></span>
                        </div> Daybook Admin </div>
                </div>
                <nav class="menu">
                    <ul class="nav metismenu" id="sidebar-menu">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i> Dashboard </a>
                        </li>
                        <li <g:if test="${selectedMenu in ['daybook','daybookCategory']}">class="active open"</g:if>>
                            <a href="">
                                <i class="fa fa-book"></i> Daybook
                                <i class="fa arrow"></i>
                            </a>
                            <ul>
                                <li>
                                    <a href="/daybook"> Daybook Management </a>
                                </li>
                                <li <g:if test="${selectedMenu == 'daybookCategory'}">class="active"</g:if>>
                                    <a href="/daybookCategory"> Category Management </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-bar-chart"></i> Charts
                                <i class="fa arrow"></i>
                            </a>
                            <ul>
                                <li>
                                    <a href="charts-flot.html"> Flot Charts </a>
                                </li>
                                <li>
                                    <a href="charts-morris.html"> Morris Charts </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <div class="sidebar-overlay" id="sidebar-overlay"></div>