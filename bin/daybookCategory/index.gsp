<g:render template="/shared/header"/>
<title>Daybook - List</title>
<article class="content responsive-tables-page">
    <div class="title-block">
        <h1 class="title"> 帳簿種類 - 列表 </h1>
    </div>
    <g:paginate controller="daybookCategories" action="index" total="${daybookCategoryCount}" />
    <section class="section">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <div class="card-title-block">
                            <h3 class="title"> 資料表單 </h3>
                        </div>
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
                                            <td>${daybookCategory.categoryType}</td>
                                            <td>${daybookCategory.name}</td>
                                            <td>${daybookCategory.lastUpdated}</td>
                                            <td></td>
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