package daybook

class Daybook {

    String title
    Integer amount
    Date recordDate
    String comment
    Date dateCreated // auto timestamp
    Date lastUpdated // auto timestamp
    User owner

    static belongsTo = [daybookCategory: DaybookCategory]

    static mapping = {
        version false
    }

    static constraints = {
        title nullable: false
        amount nullable: false
        recordDate nullable: false
        daybookCategory nullable: false
        comment nullable: true
    }

}
