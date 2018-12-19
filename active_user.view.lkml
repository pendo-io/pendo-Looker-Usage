view: pendo_activeuser_view {
  derived_table: {
    sql:
                  SELECT    ACCOUNTID,
                            VISITORID,
                            DATE_TRUNC(DAY,MONTHS) as Mth,
                            count(1) as logins
                  from      PENDO.EVENTS a
                  group by  1,2,3
 ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.accountid,${TABLE}.visitorid,cast(${TABLE}.Mth as string)) ;;
  }

  dimension: accountid {
    label: "Account ID"
    sql: ${TABLE}.accountid ;;
  }

  dimension: visitorid {
    label: "Visitor ID"
    sql: ${TABLE}.visitorid ;;
  }

  dimension_group: mth {
    label: "Month"
    type: time
    timeframes: [month]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.Mth ;;
  }

  dimension: frequency {
    label: "Frequency"
    type: string
    case:{
      when: {
        sql:  ${TABLE}.logins >= 13 ;;
        label: "Daily"}
      when: {
        sql:  ${TABLE}.logins < 13 and ${TABLE}.logins>=5 ;;
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