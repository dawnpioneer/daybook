<%@ page import="daybook.DaybookCategory" %>
<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>記帳本 - 列表</h4>
            </div>
        </div>

        <div class="row no-margin-bottom">
            <g:form controller="daybook" action="index" class="col s12">
                <div class="row">
                    <div class="input-field select col m1 s6">
                        <g:select name='year'
                                  from='${yearList.entrySet()}'
                                  value="${params.year}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>年</label>
                    </div>
                    <div class="input-field select col m1 s6">
                        <g:select name='month'
                                  from='${monthList.entrySet()}'
                                  value="${params.month}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>月</label>
                    </div>
                    <div class="input-field select col m1 s6">
                        <g:select name='category'
                                  from='${DaybookCategory.CategorySelection}'
                                  value="${params.category}"
                                  optionValue="name"
                                  class="form-control"/>
                        <label>支出 / 收入</label>
                    </div>
                    <div class="input-field select col m2 s6">
                        <g:select name='daybookCategory'
                                  from='["ALL": "全部"]'
                                  value="${params.daybookCategory}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>種類</label>
                    </div>
                    <div class="input-field col m2 s6">
                        <input type="text" id="autocomplete-input" name="title" value="${params.title}" class="autocomplete"> <label
                            for="autocomplete-input">搜尋名稱</label>
                    </div>
                    <div class="input-field col m2 s6">
                        <input type="text" name="amount" value="${params.amount}"> <label>多少金額以上</label>
                    </div>
                    <div class="input-field col m1 s4">
                        <button type="submit" class="waves-effect btn a-button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-field col m1 s4">
                        <a href="javascript:clear();" class="waves-effect btn a-button"><i class="fa fa-undo" aria-hidden="true"></i> </a>
                    </div>
                    <div class="input-field col m1 s4">
                        <a href="/daybook/create" class="waves-effect waves-light btn"><i class="fa fa-plus" aria-hidden="true"></i></a>
                    </div>
                </div>
            </g:form>
        </div>

        <div class="row">
            <div class="col s12">
                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th width="10%">支出 / 收入</th>
                        <th width="20%">種類</th>
                        <th width="25%">名稱</th>
                        <th width="10%">金額</th>
                        <th width="20%">記帳日期</th>
                        <th width="15%">功能</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each in="${daybooks}" var="daybook">
                    <tr>
                        <td>${daybook.daybookCategory?.category?.name}</td>
                        <td>${daybook.daybookCategory.name}</td>
                        <td style="text-align: left;">${daybook.title}</td>
                        <td>${daybook.amount}</td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${daybook.recordDate}"/></td>
                        <td>
                            <g:link action="show" id="${daybook.id}" class="a-fa">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </g:link>
                        &nbsp;
                            <g:link action="edit" id="${daybook.id}" class="a-fa">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </g:link>
                        &nbsp;
                            <g:link action="delete" id="${daybook.id}" onclick="return confirm('確定要刪除嗎？')"
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

        <div class="row no-margin-bottom">
            <div class="col s12">
                <div class="paginate">
                    <g:paginate controller="daybook" action="index" total="${daybookCount}" next="下一頁" prev="上一頁" params="${params}"/>
                </div>
            </div>
        </div>

        <div class="row no-margin-bottom">
            <div class="col s12 left-align">
                <hr>
                累計總支出為 ${totalAmount}元
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>
<script>
    $(document).ready(function(){
        if ($("[name=category]").val() !== "ALL") {
            updateDaybookCategories('${params.daybookCategory}', true);
        }
    });

    $("[name=category]").change(function () {
        updateDaybookCategories(null , true);
    });

    $("[name=year]").change(function () {
        if ($("[name=year]").val() === "ALL") {
            $("[name=month]").prop('disabled', 'disabled');
        } else {
            $("[name=month]").prop('disabled', false);
        }
    });

    function clear() {
        $("[name=title]").val("");
        $("[name=amount]").val("");

        ["year", "month", "category", "daybookCategory"].forEach(function(text) {
            let selectObject =  $("[name="+text+"]");
            selectObject.val("ALL");
            selectObject.material_select();
        });
    }
</script>