package daybook

class BootStrap {

    def init = { servletContext ->
        def createDefaultData = false

        if (createDefaultData) {
            // Role & User
            def adminRole = new Role(authority: 'ROLE_ADMIN').save()
            def userRole = new Role(authority: 'ROLE_USER').save()
            def testUser = new User(username: 'admin', password: '12345', email: 'dawnpioneer1989@gmail.com').save()

            UserRole.create testUser, adminRole
            UserRole.create testUser, userRole
            UserRole.withSession {
                it.flush()
                it.clear()
            }

            // Daybook
            List<DaybookCategory> daybookCategoryList = []

            (1..50).each {
                def daybookCategory = new DaybookCategory(
                        name: "test $it",
                        category: DaybookCategory.Category.EXPENSE
                )
                if (it % 3 == 0 ) {
                    daybookCategory.category = DaybookCategory.Category.INCOME
                }
                daybookCategory.save flush: true, failOnError: true
                daybookCategoryList.add(daybookCategory)
            }

            def start = Date.parse('yyyy-MM-dd', '2014-01-01')
            def end = Date.parse('yyyy-MM-dd', '2017-08-17')

            (1..500).each {
                def daybook = new Daybook(
                        daybookCategory: daybookCategoryList.get(new Random().nextInt(7)),
                        title: "daybook $it",
                        amount: Math.abs(new Random().nextInt() % 20000 + 5000),
                        recordDate: randomDate(start..end),
                        comment: "comment $it"
                )
                daybook.save flush: true, failOnError: true
            }
        }
    }
    def destroy = {
    }

    Date randomDate(Range<Date> range) {
        range.from + new Random().nextInt(range.to - range.from + 1)
    }

}
