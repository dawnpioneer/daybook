package daybook

class DaybookCategory {

    String name
    Category category
    Date dateCreated // auto timestamp
    Date lastUpdated // auto timestamp
    User owner

    static mapping = {
        version false
    }

    static constraints = {
        name nullable: false
        category nullable: false
    }

    enum Category {
        EXPENSE("支出"),
        INCOME("收入")

        String name

        Category(String name) {
            this.name = name
        }
    }

    enum CategorySelection {
        ALL("全部"),
        EXPENSE("支出"),
        INCOME("收入")

        String name

        CategorySelection(String name) {
            this.name = name
        }
    }

}
