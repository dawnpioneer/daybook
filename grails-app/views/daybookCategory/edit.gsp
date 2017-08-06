<g:render template="/shared/header"/>
<title>Daybook - New</title>
<article class="content forms-page">
    <div class="title-block">
        <h1 class="title"> 帳簿種類 - 新增 </h1>
    </div>
    <section class="section">
        <div class="row sameheight-container">
            <div class="col-md-12">
                <div class="card card-block sameheight-item">
                    <div class="title-block">
                        <h3 class="title"> 新增 </h3>
                    </div>
                    <g:form controller="daybookCategory">
                        <div class="form-group">
                            <select class="form-control" name="category">
                                <g:each in="${daybook.DaybookCategory.Category}" var="category">
                                    <option value="${category}">${category.name}</option>
                                </g:each>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">名稱</label>
                            <input type="text" name="name" class="form-control underlined">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"> Submit </button>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>