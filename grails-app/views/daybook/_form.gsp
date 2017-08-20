<%@ page import="daybook.DaybookCategory" %>
<g:set var="isEdit" value="${daybook?.id != null}" />
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳本 - ${isEdit ? "修改" : "新建"}</h3>
            </div>
        </div>
        <div class="row">
            <g:form controller="daybook" action="${isEdit ? 'update' : 'save'}" class="col s12">
                <g:hiddenField name="id" value="${daybook?.id}"/>
                <div class="row">
                    <div class="input-field select col s12">
                        <g:select name='category' value="${daybook?.daybookCategory?.category}"
                                  from='${DaybookCategory.Category}'
                                  optionValue="name" class="form-control" />
                        <label>支出 / 收入</label>
                    </div>
                    <div class="input-field select col s12">
                        <select name='daybookCategory' class="form-control"></select>
                        <label>種類</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="title" name="title" value="${daybook?.title}" type="text" class="validate" required>
                        <label for="title">名稱</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="amount" name="amount" value="${daybook?.amount}" type="text" class="validate" pattern="^\d+$" required>
                        <label for="amount" data-error="請填寫正整數">金額</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="recordDate" name="recordDate" value="${daybook?.recordDate}" type="date" class="datepicker" required>
                        <label for="recordDate" data-error="請填寫">記帳日期</label>
                    </div>
                    <div class="input-field col s12">
                        <textarea id="comment" value="${daybook?.comment}" class="materialize-textarea"></textarea>
                        <label for="comment">備註</label>
                    </div>
                    <div class="col s12">
                        <button type="submit" class="waves-effect waves-light btn a-button">
                            <i class="fa fa-save" aria-hidden="true"></i>
                        </button>
                        <a href="/daybook" class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i> </a>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        datepickerValidate();
        updateDaybookCategories(null, false);
    });

    $("[name=category]").change(function () {
        updateDaybookCategories(null, false);
    });
</script>