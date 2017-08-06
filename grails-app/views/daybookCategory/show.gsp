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
                        <label class="control-label">種類</label>
                        <label class="control-label">${daybookCategory.category.name}</label>
                    </div>

                    <div class="form-group">
                        <label class="control-label">名稱</label>
                        <label class="control-label">${daybookCategory.name}</label>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>