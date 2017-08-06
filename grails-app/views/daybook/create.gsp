<%@ page import="daybook.DaybookCategory" %>
<g:render template="/shared/header"/>
<title>Daybook - New</title>
<article class="content forms-page">
    <div class="title-block">
        <h1 class="title"> 帳簿 - 新增 </h1>
    </div>
    <section class="section">
        <div class="row sameheight-container">
            <div class="col-md-12">
                <div class="card card-block sameheight-item">
                    <div class="title-block">
                        <h3 class="title"> 新增 </h3>
                    </div>
                    <form role="form" action="save" method="post">
                        <div class="form-group">
                            <select class="form-control">
                                <g:each in="${daybook.DaybookCategory.CategoryType}" var="categoryType">
                                    <option value="${categoryType.value}">${categoryType}</option>
                                </g:each>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">標題</label>
                            <input type="text" name="title" class="form-control underlined"> </div>
                        <div class="form-group">
                            <label class="control-label">金額</label>
                            <input type="text" name="amount" class="form-control underlined"> </div>
                        <div class="form-group">
                            <label class="control-label">記帳日期</label>
                            <g:datePicker name="recordDate" value="${new Date()}" noSelection="['':'請選擇']"/>
                            <input type="text" name="recordDate" class="form-control underlined" placeholder="Placeholder text"> </div>
                        <div class="form-group">
                            <label class="control-label">備註</label>
                            <textarea rows="3" name="comment" class="form-control underlined"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"> Submit </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</article>
<g:render template="/shared/footer"/>