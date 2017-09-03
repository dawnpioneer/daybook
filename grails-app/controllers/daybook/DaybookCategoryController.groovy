package daybook

import grails.rest.RestfulController
import grails.transaction.Transactional

class DaybookCategoryController {

    static responseFormats = ['json', 'xml']

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
        sql.append(" order by dc.id")

        [
                daybookCategories   : DaybookCategory.findAll(sql.toString(), queryParams, [max: params.max, offset: params.offset]),
                daybookCategoryCount: DaybookCategory.findAll(sql.toString(), queryParams).size(),
                params              : params
        ]
    }

    def show() {
        if (params.id) {
            [daybookCategory: DaybookCategory.get(params.id)]
        }
    }

    def create() {

    }

    @Transactional
    def save() {
        def daybookCategory = new DaybookCategory(params)
        daybookCategory.save flush: true, failOnError: true

        redirect action: "show", id: daybookCategory.id
    }

    def edit() {
        if (params.id) {
            [daybookCategory: DaybookCategory.get(params.id)]
        }
    }

    @Transactional
    def update() {
        def daybookCategory = DaybookCategory.findById(params.id)
        daybookCategory.category = params.category
        daybookCategory.name = params.name
        daybookCategory.save flush: true, failOnError: true

        redirect action: "show", id: daybookCategory.id
    }

    @Transactional
    def delete() {
        def daybookCategory = DaybookCategory.findById(params.id)
        daybookCategory.delete flush: true, failOnError: true

        redirect action: "index", method: "GET"
    }

}