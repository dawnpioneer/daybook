package daybook

import grails.plugin.springsecurity.annotation.Secured
import groovy.sql.Sql

class BaseController {

    def dataSource
    def springSecurityService

    final String GET_YEARS_SQL = "select distinct date_format(d.recordDate, '%Y') as year from Daybook as d order by year"

    @Secured('ROLE_USER')
    protected getNativeSqlInstance() {
        new Sql(dataSource)
    }

    @Secured('ROLE_USER')
    def getYearList() {
        def yearList = ["ALL": "全部"]
        def yearListFromDaybook = (Daybook.executeQuery(GET_YEARS_SQL))
        yearListFromDaybook.each {
            yearList.put(it as String, it as String)
        }
        return yearList
    }

    @Secured('ROLE_USER')
    def getYearListExceptAll() {
        def yearList = [:]
        yearList.putAll(getYearList())
        yearList.remove("ALL")
        return yearList
    }

    @Secured('ROLE_USER')
    def getCurrentUser() {
        return springSecurityService.currentUser
    }

}
