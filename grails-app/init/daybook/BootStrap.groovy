package daybook

class BootStrap {

    def init = { servletContext ->

        (1..30).each {
            def daybookCategory = new DaybookCategory(
                    name: "test $it",
                    category: DaybookCategory.Category.EXPENSE
            )
            if (it % 3 == 0 ) {
                daybookCategory.category = DaybookCategory.Category.INCOME
            }
            daybookCategory.save()
        }

    }
    def destroy = {
    }
}
