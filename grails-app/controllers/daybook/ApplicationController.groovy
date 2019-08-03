package daybook

import grails.plugin.springsecurity.annotation.Secured

class ApplicationController {

    def selectedMenu

    ApplicationController(selectedMenu) {
        this.selectedMenu = selectedMenu
    }

    @Secured('ROLE_USER')
    def returnReference(reference) {
        if (!reference) {
            reference = new LinkedHashMap<>()
        }
        reference.put("selectedMenu", selectedMenu)
        return reference
    }
}
