package daybook

import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
class UserController_temp {

    static responseFormats = ['json', 'xml']

    def index() { }

    @Secured('permitAll')
    def create() {
        respond new User(params)
    }

    @Transactional
    def save() {
        def user = new User(params)
        user.save flush: true, failOnError: true

        redirect action: "index", params: session["params"]
    }

}
