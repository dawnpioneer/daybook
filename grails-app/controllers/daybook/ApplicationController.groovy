package daybook

class ApplicationController {

    def selectedMenu

    ApplicationController(selectedMenu) {
        this.selectedMenu = selectedMenu
    }

    def returnReference(reference) {
        if (!reference) {
            reference = new LinkedHashMap<>()
        }
        reference.put("selectedMenu", selectedMenu)
        return reference
    }
}
