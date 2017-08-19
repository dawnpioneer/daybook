package daybook

import grails.rest.RestfulController
import grails.transaction.Transactional

class DaybookCategoryController {

    static responseFormats = ['json', 'xml']

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0

        [
                daybookCategories: DaybookCategory.list(params),
                daybookCategoryCount: DaybookCategory.count(),
                max: params.max,
                offset: params.offset
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

        redirect action:"index", method:"GET"
    }

}