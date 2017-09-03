package daybook

import grails.converters.JSON

class ChartController extends BaseController {

    def index() {
        if (!params.year) {
            params.year = new Date().format("yyyy")
        }
        if (!params.month) {
            params.month = new Date().format("MM")
        }
        def year = params.year
        def month = params.month
        def recordDate = month == "ALL" ? year : year + month
        def recordDateYear = year

        // get typeList, typeAmountList, typeAmountPercentList
        def daybookByTypeList = getNativeSqlInstance().rows(getDaybookByTypeListSQL(year, month), [recordDate: recordDate])
        def typeList = [], typeAmountList = [], typeAmountPercentList = []
        def totalAmount = 0

        daybookByTypeList.forEach {
            typeList.add(it.name)
            typeAmountList.add(it.totalAmount)
            totalAmount += it.totalAmount
        }

        typeAmountList.forEach {
            typeAmountPercentList.add(Math.round(it / totalAmount * 100 as Double))
        }

        // get monthAmountList
        def monthAmountList = []
        def daybookByMonthList = getNativeSqlInstance().rows(getMonthAmountList(), [recordDateYear: recordDateYear])

        daybookByMonthList.forEach {
            monthAmountList.add(it.totalAmount)
        }

        // return all data list
        [
                colorList            : grailsApplication.config.getProperty("colorList", List) as JSON,
                monthList            : grailsApplication.config.getProperty("monthList", Map),
                monthStringList      : grailsApplication.config.getProperty("monthStringList", List) as JSON,
                typeList             : typeList as JSON,
                typeAmountList       : typeAmountList,
                typeAmountPercentList: typeAmountPercentList,
                monthAmountList      : monthAmountList,
                yearList             : getYearListExceptAll(),
                isNothing            : typeList.size() == 0
        ]

    }

    def getDaybookByTypeListSQL(year, month) {
        def sql = """
         SELECT dc.NAME, 
                dt.totalamount 
         FROM   (SELECT d.daybook_category_id, 
                        Sum(d.amount) totalAmount 
                 FROM   daybook d 
                 WHERE  Date_format(d.record_date, '%Y%m') = :recordDate
                 GROUP  BY d.daybook_category_id) dt 
                LEFT JOIN daybook_category dc 
                       ON dc.id = dt.daybook_category_id 
         """
        // remove month query if only the year exist
        if (month == "ALL") {
            sql = sql.replace("%Y%m", "%Y")
        }

        sql
    }

    def getMonthAmountList() {
        def sql = """
         SELECT Date_format(d.record_date, '%m') AS month, Sum(d.amount) totalAmount 
         FROM   daybook d 
         WHERE  Date_format(d.record_date, '%Y') = :recordDateYear
         GROUP  BY month 
         ORDER  BY month 
         """

        sql
    }
}