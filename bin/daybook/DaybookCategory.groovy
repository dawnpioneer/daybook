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
        EXPENSE,
        INCOME,
    }

}
