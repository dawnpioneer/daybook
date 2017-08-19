package daybook

class BootStrap {

    def init = { servletContext ->
        List<DaybookCategory> daybookCategoryList = []

        (1..15).each {
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

        (1..200).each {
            def daybook = new Daybook(
                    daybookCategory: daybookCategoryList.get(new Random().nextInt(14)),
                    title: "daybook $it",
                    amount: it * 100,
                    recordDate: randomDate(start..end),
                    comment: "comment $it"
            )
            daybook.save flush: true, failOnError: true
        }
    }
    def destroy = {
    }

    Date randomDate(Range<Date> range) {
        range.from + new Random().nextInt(range.to - range.from + 1)
    }

}
