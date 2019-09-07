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

        def queryParams = [:]
        StringBuffer sql = new StringBuffer()
        sql.append("from DaybookCategory as dc where 1 = 1")

        if (params.name) {
            sql.append(" and dc.name like :name")
            queryParams.put("name", "%${params.name}%")
        }

        sql.append(" and dc.owner >= :owner")
        queryParams.put("owner", getCurrentUser())
        sql.append(" order by dc.id")

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

        redirect action: "index"
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
        daybookCategory.owner = getCurrentUser()
        daybookCategory.save flush: true, failOnError: true

        redirect action: "show", id: daybookCategory.id
    }

    @Secured('ROLE_USER')
    @Transactional
    def delete() {
        def daybookCategory = DaybookCategory.findByIdAndOwner(params.id, getCurrentUser())
        daybookCategory.delete flush: true, failOnError: true

        redirect action: "index"
    }

}