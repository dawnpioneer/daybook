<g:render template="/shared/header"/>
<title>Daybook - New</title>
<article class="content forms-page">
    <div class="title-block">
        <h1 class="title"><a href="/daybookCategory">帳簿種類</a> > 檢視</h1>
    </div>
    <section class="section">
        <div class="row sameheight-container">
            <div class="col-md-12">
                <div class="card card-block sameheight-item">
                    <div class="form-group">
                        <h5><label class="control-label">種類</label></h5>
                        ${daybookCategory.category.name}
                    </div>

                    <div class="form-group">
                        <h5><label class="control-label">名稱</label></h5>
                        ${daybookCategory.name}
                    </div>

                    <div class="form-group">
                        <h5><label class="control-label">建立時間</label></h5>
                        <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybookCategory.dateCreated}"/>
                    </div>

                    <div class="form-group">
                        <h5><label class="control-label">最後編輯時間</label></h5>
                        <g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybookCategory.lastUpdated}"/>
                    </div>

                    <div class="form-group">
                        <a href="/daybookCategory" class="btn btn-secondary">回列表</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>