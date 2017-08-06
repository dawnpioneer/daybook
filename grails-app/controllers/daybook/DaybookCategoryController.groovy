package daybook

import grails.rest.RestfulController

class DaybookCategoryController extends RestfulController {

    static responseFormats = ['json', 'xml']

    DaybookCategoryController() {
        super(DaybookCategory)
    }

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

    def save() {
        def daybookCategory = new DaybookCategory(params)
        daybookCategory.save flush: true, failOnError: true
        redirect action: "show", id: daybookCategory.id
    }
}
