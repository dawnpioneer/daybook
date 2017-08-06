package daybook

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:'/index')
        "/daybook"(resources: 'daybook')
        "/daybookCategory"(resources: 'daybookCategory')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
