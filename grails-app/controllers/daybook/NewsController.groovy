package daybook

import grails.plugin.springsecurity.annotation.Secured

class NewsController extends BaseController {

    @Secured('ROLE_USER')
    def index() { }
}
