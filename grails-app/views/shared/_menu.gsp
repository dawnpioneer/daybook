<g:render template="/shared/header"/>
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
    <li><g:link controller='secure' action="logout">登出</g:link></li>
</ul>