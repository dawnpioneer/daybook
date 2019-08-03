package daybook

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

class SecureController {

    // Bean where Spring Security store logout handlers
    def logoutHandlers

    @Secured('ROLE_USER')
    def logout() {
        // Logout programmatically
        Authentication auth = SecurityContextHolder.context.authentication
        if (auth) {
            logoutHandlers.each  { handler->
                handler.logout(request,response,auth)
            }
        }
        redirect controller:"daybook", action:"index"
    }
}