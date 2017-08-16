<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳類別 - 新增</h3>
            </div>
        </div>
        <div class="row">
            <g:form controller="daybookCategory" action="save" class="col s12">
                <div class="row">
                    <div class="input-field select col s12">
                        <g:select name='category' value="${key}"
                                  from='${daybook.DaybookCategory.Category}'
                                  optionValue="name" class="form-control" />
                        <label>支出 / 收入</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="name" type="text" name="name" class="validate" required>
                        <label for="name">名稱</label>
                    </div>
                    <div class="col s12">
                        <button type="submit" class="waves-effect waves-light btn a-button">
                            <i class="fa fa-save" aria-hidden="true"></i>
                        </button>
                        <a href="/daybookCategory" class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i> </a>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>