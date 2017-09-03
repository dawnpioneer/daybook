<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳本 - 檢視</h3>
            </div>
        </div>

        <div class="row view">
            <div class="input-field col s12">
                <input id="categoryName" disabled value="${daybook.daybookCategory.category.name}" type="text" class="validate">
                <label for="categoryName">支出 / 收入</label>
            </div>

            <div class="input-field col s12">
                <input id="daybookCategoryName" disabled value="${daybook.daybookCategory.name}" type="text" class="validate">
                <label for="daybookCategoryName">種類</label>
            </div>

            <div class="input-field col s12">
                <input id="title" disabled value="${daybook.title}" type="text" class="validate">
                <label for="title">名稱</label>
            </div>

            <div class="input-field col s12">
                <input id="amount" disabled value="${daybook.amount}" type="text" class="validate">
                <label for="amount">金額</label>
            </div>

            <div class="input-field col s12">
                <input id="recordDate" disabled
                       value="<g:formatDate format="yyyy-MM-dd" date="${daybook.recordDate}"/>"
                       type="text" class="validate">
                <label for="recordDate">記帳日期</label>
            </div>

            <div class="input-field col s12">
                <input id="dateCreated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybook.dateCreated}"/>"
                       type="text" class="validate">
                <label for="dateCreated">建立日期</label>
            </div>

            <div class="input-field col s12">
                <input id="lastUpdated" disabled
                       value="<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${daybook.lastUpdated}"/>"
                       type="text" class="validate">
                <label for="lastUpdated">編輯日期</label>
            </div>
        </div>

        <div class="row">
            <div class="col s12">
                <a href="/daybook" class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>