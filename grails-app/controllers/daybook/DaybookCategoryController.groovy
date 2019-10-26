package daybook

import grails.plugin.springsecurity.annotation.Secured
import grails.rest.RestfulController
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DaybookCategoryController extends BaseController {

    static responseFormats = ['json', 'xml']

    @Secured('ROLE_USER')
    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        session["params"] = params

        def queryParams = [:]
        StringBuffer sql = new StringBuffer()
        sql.append("from DaybookCategory as dc where 1 = 1")

        if (params.category && params.category != "ALL") {
            sql.append(" and dc.category = :category")
            queryParams.put("category", DaybookCategory.Category.valueOf(params.category))
        }
        if (params.name) {
            sql.append(" and dc.name like :name")
            queryParams.put("name", "%${params.name}%")
        }

        sql.append(" and dc.owner = :owner")
        queryParams.put("owner", getCurrentUser())
        sql.append(" order by dc.sortNum, dc.id")

        [
                daybookCategories   : DaybookCategory.findAll(sql.toString(), queryParams, [max: params.max, offset: params.offset]),
                daybookCategoryCount: DaybookCategory.findAll(sql.toString(), queryParams).size(),
                params              : params
        ]
    }

    @Secured('ROLE_USER')
    def show() {
        if (params.id) {
            [daybookCategory: DaybookCategory.findByIdAndOwner(params.id, getCurrentUser())]
        }
    }

    @Secured('ROLE_USER')
    def create() {

    }

    @Secured('ROLE_USER')
    @Transactional
    def save() {
        params.owner = getCurrentUser()
        def daybookCategory = new DaybookCategory(params)
        daybookCategory.save flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

    @Secured('ROLE_USER')
    def edit() {
        if (params.id) {
            [daybookCategory: DaybookCategory.findByIdAndOwner(params.id, getCurrentUser())]
        }
    }

    @Secured('ROLE_USER')
    @Transactional
    def update() {
        def daybookCategory = DaybookCategory.findById(params.id)
        daybookCategory.category = params.category
        daybookCategory.name = params.name
        daybookCategory.sortNum = params.sortNum as int
        daybookCategory.owner = getCurrentUser()
        daybookCategory.save flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

    @Secured('ROLE_USER')
    @Transactional
    def delete() {
        def daybookCategory = DaybookCategory.findByIdAndOwner(params.id, getCurrentUser())

        try {
            daybookCategory.delete flush: true, failOnError: true
        } catch (Exception e) {
            log.error(e.printStackTrace())
            // 類別尚在使用中，無法刪除
        }

        redirect action: "index"
    }

    @Secured('ROLE_USER')
    def sort() {
        def queryParams = [:]
        StringBuffer sql = new StringBuffer()
        sql.append("from DaybookCategory as dc where 1 = 1")
        sql.append(" and dc.owner = :owner")
        queryParams.put("owner", getCurrentUser())
        sql.append(" order by dc.sortNum, dc.id")

        [
                daybookCategories   : DaybookCategory.findAll(sql.toString(), queryParams),
                daybookCategoryCount: DaybookCategory.findAll(sql.toString(), queryParams).size(),
                params              : params
        ]
    }

    @Secured('ROLE_USER')
    @Transactional
    def saveSort() {
        // 取得所有使用者的類別物件
        def queryParams = [:]
        StringBuffer sql = new StringBuffer()
        sql.append("from DaybookCategory as dc where 1 = 1")
        sql.append(" and dc.owner = :owner")
        queryParams.put("owner", getCurrentUser())
        sql.append(" order by dc.sortNum, dc.id")
        def daybookCategories = DaybookCategory.findAll(sql.toString(), queryParams)

        // 取得前端傳來的類別物件
        def daybookCategoriesMap = params.findAll { it.key.startsWith("daybookCategory_") }
        int sortNum = 1 // 起始排序

        // 自動重新排序
        daybookCategoriesMap.each { i ->
            def daybookCategory = daybookCategories.find { j ->
                j.id == i.value as Long
            }
            daybookCategory.sortNum = sortNum++
            daybookCategory.save flush: true, failOnError: true
        }

        redirect action: "index", params: session["params"]
    }

}