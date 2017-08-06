<g:render template="/shared/header"/>
<title>Daybook - List</title>
<article class="content responsive-tables-page">
    <div class="title-block">
        <h1 class="title"><a href="/daybookCategory">帳簿種類</a> > 列表</h1>
    </div>
    <g:paginate controller="daybookCategory" action="index" total="${daybookCategoryCount}"/>
    <section class="section">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <div class="pull-right">
                            <a href="/daybookCategory/create" class="btn btn-secondary">
                                <i class="fa fa-plus" aria-hidden="true"></i> 新增
                            </a>
                        </div>
                        <section class="example">
                            <div class="table-flip-scroll">
                                <table class="table table-striped table-bordered table-hover flip-content">
                                    <thead class="flip-header">
                                    <tr>
                                        <th>收入/支出</th>
                                        <th>名稱</th>
                                        <th>最後編輯時間</th>
                                        <th>功能</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${daybookCategories}" var="daybookCategory">
                                        <tr class="odd gradeX">
                                            <td>${daybookCategory.category.name}</td>
                                            <td>${daybookCategory.name}</td>
                                            <td><g:formatDate format="yyyy-MM-dd HH:mm:ss"
                                                              date="${daybookCategory.lastUpdated}"/></td>
                                            <td>
                                                <g:link action="show" id="${daybookCategory.id}">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </g:link>
                                                &nbsp;
                                                <g:link action="edit" id="${daybookCategory.id}">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </g:link>
                                                &nbsp;
                                                <g:link action="delete" id="${daybookCategory.id}" onclick="return confirm('確定要刪除嗎？')">
                                                    <i class="fa fa-times"aria-hidden="true"></i>
                                                </g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>