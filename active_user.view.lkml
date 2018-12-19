view: pendo_activeuser_view {
  derived_table: {
    sql:
                  SELECT    ACCOUNTID,
                            VISITORID,
                            count(1) as LOGINS
                  from      PENDO.EVENTS a
                  group by  1,2,3
 ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.accountid,${TABLE}.visitorid as string)) ;;
  }

  dimension: accountid {
    label: "Account ID"
    sql: ${TABLE}.accountid ;;
  }

  dimension: visitorid {
    label: "Visitor ID"
    sql: ${TABLE}.visitorid ;;
  }

  dimension: frequency {
    label: "Frequency"
    type: string
    case:{
      when: {
        sql:  ${TABLE}.logins >= 13 ;;
        label: "Daily"}
      when: {
        sql:  ${TABLE}.logins < 13 and ${TABLE}.logins >= 5 ;;
        label: "Weekly"}
      when: {
        sql:  ${TABLE}.logins < 5 ;;
        label: "Monthly"}
    }

  }

  measure: user_cnt {
    label: "User Count"
    type: count
  }

}
