<%@ page import="daybook.DaybookCategory" %>
<g:render template="/shared/menu"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>記帳類別 - 列表</h4>
            </div>
        </div>

        <div class="row">
            <g:form controller="daybookCategory" action="index" class="col s12">
                <div class="row">
                    <div class="input-field select col m2 s4">
                        <g:select name='category'
                                  from='${DaybookCategory.CategorySelection}'
                                  value="${params.category}"
                                  optionValue="name"
                                  class="form-control"/>
                        <label>支出 / 收入</label>
                    </div>
                    <div class="input-field col m6 s8">
                        <input type="text" id="autocomplete-input" name="name" value="${params.name}" class="autocomplete"> <label
                            for="autocomplete-input">搜尋名稱</label>
                    </div>
                    <div class="input-field col m1 s3">
                        <button type="submit" class="waves-effect btn a-button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-field col m1 s3">
                        <a href="javascript:clear();" class="waves-effect btn a-button"><i class="fa fa-undo" aria-hidden="true"></i> </a>
                    </div>
                    <div class="input-field col m1 s3">
                        <a href="/daybookCategory/create" class="waves-effect waves-light btn"><i class="fa fa-plus" aria-hidden="true"></i></a>
                    </div>
                    <div class="input-field col m1 s3">
                        <a href="/daybookCategory/sort" class="waves-effect waves-light btn"><i class="fa fa-sort-amount-asc" aria-hidden="true"></i></a>
                    </div>
                </div>
            </g:form>
        </div>

        <div class="row">
            <div class="col s12">
                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th width="33%">支出 / 收入</th>
                        <th width="33%">名稱</th>
                        <th width="33%">功能</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each in="${daybookCategories}" var="daybookCategory">
                        <tr>
                            <td>${daybookCategory.category.name}</td>
                            <td>${daybookCategory.name}</td>
                            <td>
                                <g:link action="show" id="${daybookCategory.id}" class="a-fa">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </g:link>
                                <g:link action="edit" id="${daybookCategory.id}" class="a-fa">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                </g:link>
                                <g:link action="delete" id="${daybookCategory.id}" onclick="return confirm('確定要刪除嗎？')"
                                        class="a-fa">
                                    <i class="fa fa-times" aria-hidden="true"></i>
                                </g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col s12">
                <div class="paginate">
                    <g:paginate controller="daybookCategory" action="index" total="${daybookCategoryCount}" next="下一頁" prev="上一頁" params="${params}"/>
                </div>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>
<script>
    function clear() {
        $("[name=name]").val("");
        ["category", "daybookCategory"].forEach(function(text) {
            let selectObject =  $("[name="+text+"]");
            selectObject.val("ALL");
            selectObject.formSelect();
        });
    }
</script>