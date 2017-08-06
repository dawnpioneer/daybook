<g:render template="/shared/header"/>
<title>Daybook - List</title>
<article class="content responsive-tables-page">
    <div class="title-block">
        <h1 class="title"> 帳簿 - 列表 </h1>
    </div>
    <g:paginate controller="daybooks" action="index" total="${daybookCount}" />
    <section class="section">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-block">
                        <div class="card-title-block">
                            <h3 class="title"> 資料表單 </h3>
                        </div>
                        <div class="pull-right">
                            <a href="/daybook/create" class="btn btn-secondary">
                                <i class="fa fa-plus" aria-hidden="true"></i> 新增
                            </a>
                        </div>
                        <section class="example">
                            <div class="table-flip-scroll">
                                <table class="table table-striped table-bordered table-hover flip-content">
                                    <thead class="flip-header">
                                    <tr>
                                        <th>收入/支出</th>
                                        <th>種類</th>
                                        <th>標題</th>
                                        <th>金額</th>
                                        <th>記帳日期</th>
                                        <th>最後編輯時間</th>
                                        <th>功能</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${daybooks}" var="daybook">
                                        <tr class="odd gradeX">
                                            <td>${daybook.daybookCategory?.name}</td>
                                            <td>${daybook.daybookCategory?.categoryType}</td>
                                            <td>${daybook.title}</td>
                                            <td>${daybook.amount}</td>
                                            <td>${daybook.recordDate}</td>
                                            <td>${daybook.lastUpdated}</td>
                                            <td>
                                                <a href="/daybook/${daybook.id}/edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                <a href="/daybook/${daybook.id}/delete"><i class="fa fa-times" aria-hidden="true"></i>
                                                </a>
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