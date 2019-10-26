<g:render template="/shared/menu"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>記帳類別 - 檢視</h4>
            </div>
        </div>

        <div class="row view">
            <div class="input-field col s12">
                <input id="categoryName" disabled value="${daybookCategory.category.name}" type="text" class="validate">
                <label for="categoryName">支出 / 收入</label>
            </div>

            <div class="input-field col s12">
                <input id="name" disabled value="${daybookCategory.name}" type="text" class="validate">
                <label for="name">名稱</label>
            </div>

            <div class="input-field col s12">
                <input id="sortNum" disabled value="${daybookCategory.sortNum}" type="text" class="validate">
                <label for="name">排序</label>
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
                <g:link action="index" class="waves-effect btn a-button" params="${session["params"]}">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                </g:link>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>