// ================================= Initial Settings - Start =================================
$(document).ready(function(){
    $(".dropdown-trigger").dropdown();
    $('select').formSelect();
    $('.sidenav').sidenav();

    // date picker settings
    $('.datepicker').datepicker({
        autoClose: true,
        // The format to show on the `input` element
        format: 'yyyy-mm-dd',
        closeOnSelect: false, // Close upon selecting a date,
        i18n: {
            cancel: '取消',
            clear: '清除',
            done: '確定',
            previousMonth: '上個月',
            nextMonth: '下個月',
            months: [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月' ],
            monthsShort: [ '1 /', '2 /', '3 /', '4 /', '5 /', '6 /', '7 /', '8 /', '9 /', '10 /', '11 /', '12 /' ],
            weekdays: [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ],
            weekdaysShort: [ '日', '一', '二', '三', '四', '五', '六' ],
            weekdaysAbbrev: [ '日', '一', '二', '三', '四', '五', '六' ],
        }
    });

    $('.scrollspy').scrollSpy({
        scrollOffset:80
    });
});
// ================================= Initial Settings - End =================================

// ================================= Chart Extensions - Start =================================
/**
 * draw all charts
 * @param colorList
 * @param monthList
 * @param typeList
 * @param typeAmountList
 * @param typeAmountPercentList
 * @param monthAmountList
 */
function drawCharts(colorList, monthList, typeList, typeAmountList, typeAmountPercentList, monthAmountList) {
    // settings
    var contextName = '2d';
    // set context for each chart
    var doughnutCtx = document.getElementById("doughnut-chart").getContext(contextName);
    var doughnutPercentCtx = document.getElementById("doughnut-percent-chart").getContext(contextName);
    var barChartCtx = document.getElementById("bar-chart").getContext(contextName);
    var lineChartCtx = document.getElementById("line-chart").getContext(contextName);

    // init chart plugin service
    initChart();

    // draw charts
    drawChart(doughnutCtx, "doughnut", "支出項目圓形圖", typeList, typeAmountList, colorList, null, false,  false);
    drawChart(doughnutPercentCtx, "doughnut", "支出項目百分比圓形圖", typeList, typeAmountPercentList, colorList, null, false, false);
    drawChart(barChartCtx, "bar", "支出項目長條圖", typeList, typeAmountList, colorList, "支出", true, true);
    drawChart(lineChartCtx, "line", "年度月別支出曲線圖", monthList, monthAmountList, colorList[0], "支出", false, false);
}

/**
 * draw the chart
 * @param context - chart context from html page
 * @param type - chart's type
 * @param title - chart's title
 * @param labelArray - label array
 * @param dataArray - data array
 * @param backgroundArray - background array
 * @param label - data description
 * @param showLabels - show data labels on chart
 * @param beginAtZero - base on zero to draw the chart
 */
function drawChart(context, type, title, labelArray, dataArray, backgroundArray, label, showLabels, beginAtZero) {
    new Chart(context, {
        type : type,
        data : {
            labels : labelArray,
            datasets : [ {
                label: label,
                data : dataArray,
                backgroundColor : backgroundArray,
                borderColor : backgroundArray, // same as background color
                fill : false
            } ]
        },
        options : {
            fill : false,
            showAllTooltips : showLabels,
            responsive : true,
            title : {
                display : true,
                text : title
            },
            scales : {
                yAxes : [
                    {
                        ticks : {
                            beginAtZero : beginAtZero
                        }
                    }
                ]
            }
        }
    });
}

/**
 * register the plugin service to show labels (only support for Chart.js 2.1.0)
 */
function initChart() {
    Chart.pluginService.register({
        beforeRender : function(chart) {
            if (chart.config.options.showAllTooltips) {
                // create an array of tooltips
                // we can't use the chart tooltip because there is only one tooltip per chart
                chart.pluginTooltips = [];
                chart.config.data.datasets.forEach(function(dataset, i) {
                    chart.getDatasetMeta(i).data
                        .forEach(function(sector, j) {
                            chart.pluginTooltips
                                .push(new Chart.Tooltip({
                                    _chart : chart.chart,
                                    _chartInstance : chart,
                                    _data : chart.data,
                                    _options : chart.options,
                                    _active : [ sector ]
                                }, chart));
                        });
                });

                // turn off normal tooltips
                chart.options.tooltips.enabled = false;
            }
        },
        afterDraw : function(chart, easing) {
            if (chart.config.options.showAllTooltips) {
                // we don't want the permanent tooltips to animate, so don't do anything till the animation runs atleast once
                if (!chart.allTooltipsOnce) {
                    if (easing !== 1)
                        return;
                    chart.allTooltipsOnce = true;
                }

                // turn on tooltips
                chart.options.tooltips.enabled = true;
                Chart.helpers.each(chart.pluginTooltips, function(tooltip) {
                    tooltip.initialize();
                    tooltip.update();
                    // we don't actually need this since we are not animating tooltips
                    tooltip.pivot();
                    tooltip.transition(easing).draw();
                });
                chart.options.tooltips.enabled = false;
            }
        }
    });
}
// ================================= Chart Extensions - End =================================

// ================================= Date Picker Validation Extensions - Start =================================
/**
 * validate all datepicker from the form
 * @param formId - form's id, if null then select by $('form')
 */
function datepickerValidate(formId) {
    let form;
    if (formId == null) {
        form = $("form");
    } else {
        form = $("#" + formId);
    }

    let datepickerList = form.find(".datepicker"); // get all datepicker from the form

    form.submit(function() {
        let isValid = true;
        datepickerList.each(function( index ) {
            if (checkDate($(this)) == false) {
                isValid = false;
            }
        });
        return isValid;
    });

    datepickerList.each(function( index ) {
        $(this).change(function() {
            checkDate($(this));
        });
    });
}

/**
 * check the datepicker empty and return true or false
 * @param datepicker
 * @returns {Boolean} - valid: true, invalid: false
 */
function checkDate(datepicker) {
    if (datepicker.val() == '') {
        datepicker.addClass('invalid');
        return false;
    } else {
        datepicker.removeClass('invalid');
        return true;
    }
}
// ================================= Date Picker Validation Extensions - End =================================

// ================================= Select Value Change Extensions - Start =================================
/**
 * get daybook categories selection data by category
 * @param selectedValue - set the value to selected status
 * @param showAllOption - show the "ALL" option
 */
function updateDaybookCategories(selectedValue, showAllOption) {
    let daybookCategorySelect = $('[name=daybookCategory]');
    let categorySelect = $("[name=category]");

    if (showAllOption === true) {
        daybookCategorySelect.html('<option value="ALL">全部</option>');
    } else {
        daybookCategorySelect.html('');
    }

    if (categorySelect.val() !== "ALL") {
        $.get("/daybook/getDaybookCategories", {category: categorySelect.val()}).done(function (data) {
            $.each(data, function (index, object) {
                daybookCategorySelect.append('<option value="' + object.id + '">' + object.name + '</option>');
            });
            if (selectedValue !== null && selectedValue !== '') {
                daybookCategorySelect.val(selectedValue);
            }
            daybookCategorySelect.formSelect();
        });
    }
    daybookCategorySelect.formSelect();
}
// ================================= Select Value Change Extensions - End =================================