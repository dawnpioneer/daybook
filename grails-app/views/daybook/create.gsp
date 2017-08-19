<%@ page import="daybook.DaybookCategory" %>
<div class="container">
    <div class="section center-align">
        <div class="row">
            <div class="col s12">
                <h3>記帳本 - 新增</h3>
            </div>
        </div>
        <div class="row">
            <form class="col s12" action="javascript:alert('submit success!')">
                <div class="row">
                    <div class="input-field select col s12">
                        <g:select name='category' value="${key}"
                                  from='${DaybookCategory.Category}'
                                  optionValue="name" class="form-control" />
                        <label>支出 / 收入</label>
                    </div>
                    <div class="input-field select col s12">
                        <select>
                            <option value="1">餐費</option>
                            <option value="2">交通費</option>
                        </select>
                        <label>種類</label>
                    </div>
                    <div class="input-field col s12">
                        <input name="first_name" type="text" class="validate" required>
                        <label for="first_name">名稱</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" class="validate" pattern="^\d+$" required>
                        <label for="first_name" data-error="請填寫正整數">金額</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="recordDate" name="recordDate" type="date" class="datepicker" required>
                        <label for="recordDate" data-error="請填寫">記帳日期</label>
                    </div>
                    <div class="col s12">
                        <button type="submit" class="waves-effect waves-light btn a-button">
                            <i class="fa fa-save" aria-hidden="true"></i>
                        </button>
                        <a class="waves-effect btn a-button"><i class="fa fa-arrow-left" aria-hidden="true"></i> </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        datepickerValidate();
    });
</script>