package daybook

class DaybookCategory {

    String name
    Category category

    // auto timestamp
    Date dateCreated
    Date lastUpdated

    static mapping = {
        version false
    }

    static constraints = {
        name nullable: false
    }

    enum Category {
        EXPENSE("支出"),
        INCOME("收入")

        String name

        Category(String name) {
            this.name = name
        }
    }

}
