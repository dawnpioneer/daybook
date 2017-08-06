<g:render template="/shared/header"/>
<title>Daybook - New</title>
<article class="content forms-page">
    <div class="title-block">
        <h1 class="title"><a href="/daybookCategory">帳簿種類</a> > 新增 </h1>
    </div>
    <section class="section">
        <div class="row sameheight-container">
            <div class="col-md-12">
                <div class="card card-block sameheight-item">
                    <div class="title-block">
                        <h3 class="title"> 新增 </h3>
                    </div>
                    <g:form controller="daybookCategory" action="save">
                        <div class="form-group">
                            <g:select name='category' value="${key}"
                                      from='${daybook.DaybookCategory.Category}'
                                      optionValue="name" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">名稱</label>
                            <input type="text" name="name" class="form-control underlined">
                        </div>
                        <div class="form-group">
                            <a href="/daybookCategory" class="btn btn-secondary">回列表</a>
                            <button type="submit" class="btn btn-primary"> 儲存 </button>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>