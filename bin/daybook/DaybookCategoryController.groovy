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

        respond daybookCategories: DaybookCategory.list(params), view: 'index'
//        [
//                daybookCategories: DaybookCategory.list(params),
//                daybookCategoryCount: DaybookCategory.count(),
//                max: params.max,
//                offset: params.offset
//        ]
    }

    def create() {

    }

    def save() {
        def daybookCategory = new DaybookCategory(params)
        daybookCategory.save()
        redirect(action: "edit")
    }
}
