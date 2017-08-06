package daybook

import grails.rest.RestfulController

class DaybookController extends RestfulController {

    DaybookController() {
        super(Daybook)
    }

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        [
                daybooks: Daybook.list(params),
                daybookCount: Daybook.count(),
                max: params.max,
                offset: params.offset
        ]
    }

    def save() {

    }

}
