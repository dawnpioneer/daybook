<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳類別 - 檢視</h3>
            </div>
        </div>

        <div class="row view">
            <div class="input-field col s12">
                <input id="categoryName" disabled value="${daybookCategory.category.name}" type="text" class="validate">
                <label for="categoryName">支出 / 收入</label>
            </div>

            <div class="input-field col s12">
                <input id="name" disabled value="${daybookCategory.name}" type="text" class="validate">
                <label for="name">種類</label>
            </div>

            <div class="input-field col s12">
                <input id="dateCreated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybookCategory.dateCreated}"/>"
                       type="text" class="validate">
                <label for="dateCreated">建立日期</label>
            </div>

            <div class="input-field col s12">
                <input id="lastUpdated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybookCategory.lastUpdated}"/>"
                       type="text" class="validate">
                <label for="lastUpdated">編輯日期</label>
            </div>
        </div>

        <div class="row">
            <div class="col s12">
                <a href="/daybookCategory" class="waves-effect btn a-button"><i class="fa fa-arrow-left"
                                                                                aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>