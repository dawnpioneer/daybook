package daybook

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController extends BaseController {

    static responseFormats = ['json', 'xml']

    @Secured('permitAll')
    def create() {
        respond new User(params)
    }

    @Secured('permitAll')
    @Transactional
    def save(User user) {
        if (user == null) {
            return
        }

        user.enabled = false

        if (user.hasErrors()) {
            respond user.errors, view:'create'
            return
        }

        user.save flush:true

        redirect action: "registerSuccess", params: session["params"]
    }

    @Secured('ROLE_USER')
    def show(User user) {
        if (user.id == getCurrentUser().id) {
            [user: user]
        }
    }

    @Secured('ROLE_USER')
    def edit(User user) {
        if (user.id == getCurrentUser().id) {
            [user: user]
        }
    }

    @Secured('ROLE_USER')
    @Transactional
    def update(User user) {
        if (user.id == getCurrentUser().id) {
            user.save flush: true, failOnError: true
            redirect action: "show", id: user.id
        }
    }

    @Secured('permitAll')
    def registerSuccess() {

    }

}