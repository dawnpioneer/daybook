<%@ page import="daybook.DaybookCategory" %>
<g:render template="/shared/menu"/>
<style>
tr {
    cursor: move;
}
</style>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h4>記帳類別 - 列表</h4>
            </div>
        </div>
        <g:form controller="daybookCategory" action="saveSort" method="PUT" class="col s12">
        <div class="row">
            <div class="col s12">
                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th width="50%">支出 / 收入</th>
                        <th width="50%">名稱</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:each in="${daybookCategories}" var="daybookCategory">
                        <tr>
                            <td>${daybookCategory.category.name}</td>
                            <td>${daybookCategory.name}</td>
                            <input type="hidden" name="daybookCategory_${daybookCategory.id}" value="${daybookCategory.id}"/>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="col s12">
                <br/>
                <button type="submit" class="waves-effect waves-light btn a-button">
                    <i class="fa fa-save" aria-hidden="true"></i>
                </button>
                <a href="/daybookCategory" class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i> </a>
            </div>
        </div>
        </g:form>
    </div>
</div>
<g:render template="/shared/footer"/>
<asset:javascript src="jquery-sortable.js"/>
<script>
    $(document).ready(function(){
        // Sortable rows
        $('table').sortable({
            containerSelector: 'table',
            itemPath: '> tbody',
            itemSelector: 'tr',
            placeholder: '<tr class="placeholder"/>'
        });

        // Sortable column heads
        var oldIndex;
        $('tr').sortable({
            containerSelector: 'tr',
            itemSelector: 'th',
            placeholder: '<th class="placeholder"/>',
            vertical: false,
            onDragStart: function ($item, container, _super) {
                oldIndex = $item.index();
                $item.appendTo($item.parent());
                _super($item, container);
            },
            onDrop: function  ($item, container, _super) {
                var field,
                    newIndex = $item.index();

                if(newIndex != oldIndex) {
                    $item.closest('table').find('tbody tr').each(function (i, row) {
                        row = $(row);
                        if(newIndex < oldIndex) {
                            row.children().eq(newIndex).before(row.children()[oldIndex]);
                        } else if (newIndex > oldIndex) {
                            row.children().eq(newIndex).after(row.children()[oldIndex]);
                        }
                    });
                }
                _super($item, container);
            }
        });
    });

    function clear() {
        $("[name=name]").val("");
        ["category", "daybookCategory"].forEach(function(text) {
            let selectObject =  $("[name="+text+"]");
            selectObject.val("ALL");
            selectObject.formSelect();
        });
    }
</script>