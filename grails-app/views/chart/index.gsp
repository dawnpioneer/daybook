<%@ page defaultCodec="none" %>
<g:render template="/shared/header"/>
<!--Import Chart.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.0/Chart.bundle.min.js"></script>

<div class="right-menu hide-on-small-only">
    <ul class="section table-of-contents">
        <li><a href="#chart">統計圖</a></li>
        <li><a href="#doughnut-chart">支出項目圓餅圖</a></li>
        <li><a href="#doughnut-percent-chart">支出項目百分比圓餅圖</a></li>
        <li><a href="#bar-chart">支出項目長條圖</a></li>
        <li><a href="#line-chart">年度月別支出曲線圖</a></li>
    </ul>
</div>

<div class="container chart">
    <div class="section center-align">
        <div id="chart" class="row scrollspy">
            <div class="col s12">
                <h3>統計圖</h3>
            </div>
        </div>

        <div class="row">
            <div class="col m8 offset-m2 s12">
                <g:form controller="chart" action="index" class="col s12">
                    <div class="input-field select col m6 s12">
                        <g:select name='year'
                                  from='${yearList.entrySet()}'
                                  value="${params.year}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>年</label>
                    </div>

                    <div class="input-field select col m5 s12">
                        <g:select name='month'
                                  from='${monthList.entrySet()}'
                                  value="${params.month}"
                                  optionKey="key" optionValue="value"
                                  class="form-control"/>
                        <label>月</label>
                    </div>

                    <div class="input-field col m1 s12">
                        <button type="submit" class="waves-effect waves-light btn a-button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </div>
                </g:form>
            </div>
        </div>

        <div class="row">
            <div class="col m8 offset-m2 s12">
                <g:if test="${isNothing}">
                    <h5 style="color:red">這個月份並沒有資料！</h5>
                </g:if>
                <h5 class="left-align">支出項目圓餅圖</h5>
                <canvas id="doughnut-chart" class="scrollspy"></canvas>
                <h5 class="left-align">支出項目百分比圓餅圖</h5>
                <canvas id="doughnut-percent-chart" class="scrollspy"></canvas>
                <h5 class="left-align">支出項目長條圖</h5>
                <canvas id="bar-chart" class="scrollspy"></canvas>
                <h5 class="left-align" style="padding-bottom: 100px">年度月別支出曲線圖</h5>
                <canvas id="line-chart" class="scrollspy"></canvas>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        // set all needed list
        var colorList = ${colorList};
        var monthList = ${monthStringList};
        var typeList = ${typeList};
        var typeAmountList = ${typeAmountList}; // count should be same as the type list
        var typeAmountPercentList = ${typeAmountPercentList}; // count should be same as the type list
        var monthAmountList = ${monthAmountList};
        // draw all charts
        drawCharts(colorList, monthList, typeList, typeAmountList, typeAmountPercentList, monthAmountList);
    });
</script>
<g:render template="/shared/footer"/>