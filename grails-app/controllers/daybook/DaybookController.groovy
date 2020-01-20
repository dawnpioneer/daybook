package daybook

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DaybookController extends BaseController {

    static responseFormats = ['json', 'xml']

    @Secured('ROLE_USER')
    def index() {
        if (!params.year) {
            params.year = new Date().format("yyyy")
        }
        if (!params.month) {
            params.month = new Date().format("MM")
        }

        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        session["params"] = params // save query params for come back from create/update/delete pages

        def queryParams = [:]

        StringBuffer sql = new StringBuffer()
        sql.append("from Daybook as d where 1 = 1")
        if (params.year && params.year != "ALL") {
            sql.append(" and date_format(d.recordDate, '%Y') = :year")
            queryParams.put("year", params.year)
        }
        if (params.month && params.month != "ALL") {
            sql.append(" and date_format(d.recordDate, '%m') = :month")
            queryParams.put("month", params.month)
        }
        if (params.category && params.category != "ALL") {
            sql.append(" and d.daybookCategory.category = :category")
            queryParams.put("category", DaybookCategory.Category.valueOf(params.category))
        }
        if (params.daybookCategory && params.daybookCategory != "ALL") {
            sql.append(" and d.daybookCategory = :daybookCategory")
            queryParams.put("daybookCategory", DaybookCategory.findById(params.daybookCategory as Long))
        }
        if (params.title) {
            sql.append(" and d.title like :title")
            queryParams.put("title", "%${params.title}%")
        }
        if (params.amount) {
            sql.append(" and d.amount >= :amount")
            queryParams.put("amount", params.amount as Integer)
        }

        sql.append(" and d.owner = :owner")
        queryParams.put("owner", getCurrentUser())
        sql.append(" order by d.recordDate desc, d.id desc")

        def daybookList = Daybook.findAll(sql.toString(), queryParams)
        def totalAmount = 0
        daybookList.each {
            if (it.daybookCategory.category == DaybookCategory.Category.INCOME) {
                totalAmount += it.amount
            } else if (it.daybookCategory.category == DaybookCategory.Category.EXPENSE) {
                totalAmount -= it.amount
            }
        }

        [
                daybooks    : Daybook.findAll(sql.toString(), queryParams, [max: params.max, offset: params.offset]),
                daybookCount: daybookList.size(),
                yearList    : getYearList(),
                monthList   : grailsApplication.config.getProperty("monthList", Map),
                params      : params,
                totalAmount: totalAmount
        ]
    }

    @Secured('ROLE_USER')
    def show() {
        if (params.id) {
            [daybook: Daybook.findByIdAndOwner(params.id, getCurrentUser())]
        }
    }

    @Secured('ROLE_USER')
    def create() {
        [defaultDate: new Date()]
    }

    @Secured('ROLE_USER')
    @Transactional
    def save() {
        params.recordDate = new Date().parse('yyyy-MM-dd', params.recordDate as String) // Transfer string to date
        params.owner = getCurrentUser()
        def daybook = new Daybook(params)
        daybook.save flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

    @Secured('ROLE_USER')
    def edit() {
        if (params.id) {
            [daybook: Daybook.findByIdAndOwner(params.id, getCurrentUser())]
        }
    }

    @Secured('ROLE_USER')
    @Transactional
    def update() {
        def daybook = Daybook.findByIdAndOwner(params.id, getCurrentUser())
        daybook.daybookCategory = DaybookCategory.findById(params.daybookCategory as Long)
        daybook.title = params.title
        daybook.amount = params.amount as Integer
        daybook.recordDate = new Date().parse('yyyy-MM-dd', params.recordDate as String)
        daybook.comment = params.comment
        daybook.owner = getCurrentUser()
        daybook.save flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

    @Secured('ROLE_USER')
    @Transactional
    def delete() {
        def daybook = Daybook.findByIdAndOwner(params.id, getCurrentUser())
        daybook.delete flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

    @Secured('ROLE_USER')
    def getDaybookCategories() {
        def daybookCategories = params.category != "ALL" ?
                DaybookCategory.findAllByCategoryAndOwner(params.category, getCurrentUser(), [sort: "sortNum"]) :
                DaybookCategory.findAllByOwner(getCurrentUser())
        respond daybookCategories
    }

}