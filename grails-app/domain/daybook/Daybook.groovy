package daybook

class Daybook {

    String title
    Integer amount
    Date recordDate
    String comment

    // auto timestamp
    Date dateCreated
    Date lastUpdated

    static belongsTo = [daybookCategory: DaybookCategory]

    static constraints = {
        title nullable: false
        amount nullable: false
        recordDate nullable: false
        daybookCategory nullable: false
        comment nullable: true
    }

//    static mapping = {
//        version false
//        id column: "PK_DAYBOOK_ID"
//        daybookCategory column: "FK_DAYBOOK_CATEGORY_ID"
//        title column: "DAYBOOK_TITLE"
//        amount column: "DAYBOOK_AMOUNT"
//        recordDate column: "DAYBOOK_RECORD_DATE"
//        dateCreated column: "DAYBOOK_CREATE_DATE"
//        lastUpdated column: "DAYBOOK_UPDATE_DATE"
//    }

}
