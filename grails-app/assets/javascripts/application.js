// ================================= Initial Settings - Start =================================
$(document).ready(function(){
    $('.button-collapse').sideNav();
    $(".dropdown-button").dropdown({
        belowOrigin : true
    });
    $('select').material_select();

    // date picker settings
    $('.datepicker').pickadate({
        selectMonths: true,// Creates a dropdown to control month
        selectYears: 15,// Creates a dropdown of 15 years to control year
        // The title label to use for the month nav buttons
        labelMonthNext: '下個月',
        labelMonthPrev: '上個月',
        // The title label to use for the dropdown selectors
        labelMonthSelect: '選取月',
        labelYearSelect: '選取年',
        // Months and weekdays
        monthsFull: [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月' ],
        monthsShort: [ '1 /', '2 /', '3 /', '4 /', '5 /', '6 /', '7 /', '8 /', '9 /', '10 /', '11 /', '12 /' ],
        weekdaysFull: [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ],
        weekdaysShort: [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ],
        // Materialize modified
        weekdaysLetter: [ '日', '一', '二', '三', '四', '五', '六' ],
        // Today and clear
        today: '今天',
        clear: '清除',
        close: '關閉',
        // The format to show on the `input` element
        format: 'yyyy-mm-dd',
        closeOnSelect: false // Close upon selecting a date,
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

    // set scroll fire effect
    var options = [
        {selector: '#doughnut-chart', offset: 200, callback: function(el) {
            Materialize.fadeInImage($(el));
            drawChart(doughnutCtx, "doughnut", "支出項目圓形圖", typeList, typeAmountList, colorList, null, false,  false);
        } },
        {selector: '#doughnut-percent-chart', offset: 300, callback: function(el) {
            Materialize.fadeInImage($(el));
            drawChart(doughnutPercentCtx, "doughnut", "支出項目百分比圓形圖", typeList, typeAmountPercentList, colorList, null, true, false);
        } },
        {selector: '#bar-chart', offset: 300, callback: function(el) {
            Materialize.fadeInImage($(el));
            drawChart(barChartCtx, "bar", "支出項目長條圖", typeList, typeAmountList, colorList, "支出", true, true);
        } },
        {selector: '#line-chart', offset: 300, callback: function(el) {
            Materialize.fadeInImage($(el));
            drawChart(lineChartCtx, "line", "年度月別支出曲線圖", monthList, monthAmountList, colorList[0], "支出", true, false);
        } }
    ];
    Materialize.scrollFire(options);
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
                    }]
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
            daybookCategorySelect.material_select();
        });
    }
    daybookCategorySelect.material_select();
}
// ================================= Select Value Change Extensions - End =================================