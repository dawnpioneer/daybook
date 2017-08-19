<g:render template="/shared/header"/>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳本 - 列表</h3>
            </div>
        </div>

        <div class="row">
            <div class="col s12 right-align">
                <a class="waves-effect waves-light btn"><i class="fa fa-plus" aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="row">
            <g:form controller="daybook" action="index" class="col s12 search-form">
                <div class="row">
                    <div class="input-field select col m3 s6">
                        <g:select name='year'
                                  from='${yearList.entrySet()}'
                                  value="${params.year}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>年</label>
                    </div>

                    <div class="input-field select col m3 s6">
                        <g:select name='month'
                                  from='${monthList.entrySet()}'
                                  value="${params.month}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>月</label>
                    </div>

                    <div class="input-field select col m3 s6">
                        <g:select name='category'
                                  from='${daybook.DaybookCategory.CategorySelection}'
                                  value="${params.category}"
                                  optionValue="name"
                                  class="form-control"/>
                        <label>支出 / 收入</label>
                    </div>

                    <div class="input-field select col m3 s6">
                        <g:select name='daybookCategory'
                                  from='["ALL": "全部"]'
                                  value="${params.daybookCategory}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>種類</label>
                    </div>

                    <div class="input-field col m5 s4">
                        <input type="text" id="autocomplete-input" name="title" value="${params.title}" class="autocomplete"> <label
                            for="autocomplete-input">搜尋名稱</label>
                    </div>

                    <div class="input-field col m5 s4">
                        <input type="text" name="amount" value="${params.amount}"> <label>多少金額以上</label>
                    </div>

                    <div class="input-field col m1 s2">
                        <button type="submit" class="waves-effect btn a-button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                    <div class="input-field col m1 s2">
                        <a href="javascript:clear();" class="waves-effect btn a-button"><i class="fa fa-undo" aria-hidden="true"></i> </a>
                    </div>
                </div>
            </g:form>
        </div>

        <div class="row">
            <div class="col s12">
                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th width="16%">支出 / 收入</th>
                        <th width="16%">種類</th>
                        <th width="16%">名稱</th>
                        <th width="16%">金額</th>
                        <th width="16%">記帳日期</th>
                        <th width="20%">功能</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                    <g:each in="${daybooks}" var="daybook">
                        <td>${daybook.daybookCategory?.category?.name}</td>
                        <td>${daybook.daybookCategory.name}</td>
                        <td>${daybook.title}</td>
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

        <div class="row">
            <div class="col s12">
                <div class="paginate">
                    <g:paginate controller="daybook" action="index" total="${daybookCount}" next="下一頁" prev="上一頁" params="${params}"/>
                </div>
            </div>
        </div>
    </div>
</div>
<g:render template="/shared/footer"/>
<script>
    $(document).ready(function(){
        if ($("[name=category]").val() !== "ALL") {
            updateDaybookCategories();
        }
    });

    $("[name=category]").change(function () {
        updateDaybookCategories();
    });

    $("[name=year]").change(function () {
        if ($("[name=year]").val() === "ALL") {
            $("[name=month]").prop('disabled', 'disabled');
        } else {
            $("[name=month]").prop('disabled', false);
        }
    });

    function updateDaybookCategories() {
        let daybookCategorySelect = $('[name=daybookCategory]');
        let categorySelect = $("[name=category]");
        daybookCategorySelect.html('<option value="ALL">全部</option>');
        if (categorySelect.val() !== "ALL") {
            $.get("/daybook/getDaybookCategories", {category: categorySelect.val()}).done(function (data) {
                $.each(data, function (index, object) {
                    daybookCategorySelect.append('<option value="' + object.id + '">' + object.name + '</option>');
                });
                daybookCategorySelect.material_select();
            });
        }
        daybookCategorySelect.material_select();
    }

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