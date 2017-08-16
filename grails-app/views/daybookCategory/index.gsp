<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳類別 - 列表</h3>
            </div>

            <div class="col s12 right-align">
                <a href="/daybookCategory/create" class="waves-effect waves-light btn"><i class="fa fa-plus"
                                                                                          aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="row">
            <div class="col s12">
                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th width="33%">支出 / 收入</th>
                        <th width="33%">名稱</th>
                        <th width="33%">功能</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each in="${daybookCategories}" var="daybookCategory">
                        <tr>
                            <td>${daybookCategory.category.name}</td>
                            <td>${daybookCategory.name}</td>
                            <td>
                                <g:link action="show" id="${daybookCategory.id}" class="a-fa">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </g:link>
                            &nbsp;
                                <g:link action="edit" id="${daybookCategory.id}" class="a-fa">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                </g:link>
                            &nbsp;
                                <g:link action="delete" id="${daybookCategory.id}" onclick="return confirm('確定要刪除嗎？')"
                                        class="a-fa">
                                    <i class="fa fa-times" aria-hidden="true"></i>
                                </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:paginate controller="daybookCategory" action="index" total="${daybookCategoryCount}"/>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>