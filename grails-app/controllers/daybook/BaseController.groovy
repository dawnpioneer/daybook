package daybook

import groovy.sql.Sql

class BaseController {

    def dataSource

    final String GET_YEARS_SQL = "select distinct date_format(d.recordDate, '%Y') as year from Daybook as d order by year"

    protected getNativeSqlInstance() {
        new Sql(dataSource)
    }

    def getYearList() {
        def yearList = ["ALL": "全部"]
        def yearListFromDaybook = (Daybook.executeQuery(GET_YEARS_SQL))
        yearListFromDaybook.each {
            yearList.put(it as String, it as String)
        }
        return yearList
    }

    def getYearListExceptAll() {
        def yearList = [:]
        yearList.putAll(getYearList())
        yearList.remove("ALL")
        return yearList
    }

}
