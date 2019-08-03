package daybook

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class ChartController extends BaseController {

    @Secured('ROLE_USER')
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
        def exceptTypeList = params.exceptTypeList as String // disable from front charts

        def daybookByTypeList = getNativeSqlInstance().rows(
                getDaybookByTypeListSQL(month, exceptTypeList),
                [recordDate: recordDate, exceptTypeList: exceptTypeList, ownerId: getCurrentUser().id]
        )
        def checkboxTypeList = [], typeStringList = [], typeAmountList = [], typeAmountPercentList = []
        def totalAmount = 0

        daybookByTypeList.forEach {
            typeStringList.add(it.name)
            typeAmountList.add(it.totalAmount)
            totalAmount += it.totalAmount
        }

        // for checkbox
        def exceptIdList = exceptTypeList?.split(',')
        def daybookByStaticTypeList = getNativeSqlInstance().rows(
                getStaticTypeListSQL(month), [recordDate: recordDate, ownerId: getCurrentUser().id]
        )
        for (Object it : daybookByStaticTypeList) { // show all type from this month
            // composite checkbox data
            def typeMap = [:]
            typeMap.put("id", it.id)
            typeMap.put("name", it.name)
            typeMap.put("checked", exceptIdList ? !exceptIdList.contains(it.id as String) : true)
            // uncheck the except item
            checkboxTypeList.add(typeMap)
        }

        typeAmountList.forEach {
            typeAmountPercentList.add(Math.round(it / totalAmount * 100 as Double))
        }

        // get monthAmountList
        def monthAmountList = []
        def daybookByMonthList = getNativeSqlInstance().rows(
                getMonthAmountList(), [recordDateYear: recordDateYear, ownerId: getCurrentUser().id]
        )

        daybookByMonthList.forEach {
            monthAmountList.add(it.totalAmount)
        }

        // return all data list
        [
                colorList            : grailsApplication.config.getProperty("colorList", List) as JSON,
                monthList            : grailsApplication.config.getProperty("monthList", Map),
                monthStringList      : grailsApplication.config.getProperty("monthStringList", List) as JSON,
                checkboxTypeList     : checkboxTypeList,
                typeStringList       : typeStringList as JSON,
                typeAmountList       : typeAmountList,
                typeAmountPercentList: typeAmountPercentList,
                monthAmountList      : monthAmountList,
                yearList             : getYearListExceptAll(),
                isEmpty              : typeStringList.size() == 0 // the type list is empty
        ]

    }

    @Secured('ROLE_USER')
    def getDaybookByTypeListSQL(month, exceptTypeList) {
        def sql = """
         SELECT dc.id,
                dc.name,
                dt.totalamount
         FROM   (SELECT d.daybook_category_id, 
                        Sum(d.amount) totalAmount 
                 FROM   daybook d 
                 WHERE  Date_format(d.record_date, '%Y%m') = :recordDate
                 AND d.daybook_category_id not in (${exceptTypeList ? exceptTypeList : 0})
                 AND d.owner_id = :ownerId
                GROUP  BY d.daybook_category_id) dt 
                LEFT JOIN daybook_category dc 
                       ON dc.id = dt.daybook_category_id 
                WHERE dc.category != 'INCOME'
                AND dc.owner_id = :ownerId
         """
        // remove month query if only the year exist
        if (month == "ALL") {
            sql = sql.replace("%Y%m", "%Y")
        }

        sql
    }

    @Secured('ROLE_USER')
    def getStaticTypeListSQL(month) {
        def sql = """
         SELECT dc.id,
                dc.name
         FROM   (SELECT d.daybook_category_id
                 FROM   daybook d 
                 WHERE  Date_format(d.record_date, '%Y%m') = :recordDate
                 AND d.owner_id = :ownerId
                 GROUP  BY d.daybook_category_id) dt 
                LEFT JOIN daybook_category dc 
                       ON dc.id = dt.daybook_category_id 
                WHERE dc.category != 'INCOME'
                AND dc.owner_id = :ownerId
         """
        // remove month query if only the year exist
        if (month == "ALL") {
            sql = sql.replace("%Y%m", "%Y")
        }

        sql
    }

    @Secured('ROLE_USER')
    def getMonthAmountList() {
        def sql = """
         SELECT Date_format(d.record_date, '%m') AS month, Sum(d.amount) totalAmount 
         FROM   daybook d 
         LEFT JOIN daybook_category dc on dc.id = d.daybook_category_id
         WHERE  Date_format(d.record_date, '%Y') = :recordDateYear
         AND d.owner_id = :ownerId
         AND dc.category != 'INCOME'
         AND dc.owner_id = :ownerId
         GROUP  BY month 
         ORDER  BY month 
         """

        sql
    }
}