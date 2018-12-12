view: calendar {
  sql_table_name: PENDO.CALENDAR
    ;;

  dimension: biz_day {
    type: number
    sql: ${TABLE}.BizDay ;;
  }

  dimension: cumul_bizdays_m {
    type: number
    sql: ${TABLE}.Cumul_Biz_Days_m ;;
  }

  dimension: cumul_bizdays_q {
    type: number
    sql: ${TABLE}.Cumul_Biz_Days_q ;;
  }

  dimension: cumul_bizdays_left_q {
    label: "Business Days Remaining"
    type: number
    sql: ${TABLE}.CUMUL_BIZ_DAYS_LEFT_Q ;;
  }

  dimension: cumul_caldays_q {
    label: "Calendar Days Elapsed in the Quarter"
    type: number
    sql: ${TABLE}.Cumul_CalDays_q ;;
  }

  dimension: cumul_caldays_q_left {
    label: "Calendar Days Left in the Quarter"
    type: number
    sql: ${TABLE}.Cumul_CalDays_q_Left ;;
  }

  dimension: date {
    primary_key: yes
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension_group: date_group {
    type: time
    timeframes: [date,
      week,
      month,
      fiscal_quarter,
      day_of_week]
    sql: ${TABLE}.Date ;;
    datatype: date
  }

  dimension: first_day_of_quarter {
    type: date
    sql: ${TABLE}.First_Day_Of_Quarter ;;
  }

  dimension: last_day_of_quarter {
    type: date
    sql: ${TABLE}.Last_Day_Of_Quarter ;;
  }

  dimension: month {
    type: date
    sql: ${TABLE}.Month ;;
  }

  dimension: month_in_qtr_f {
    type: number
    sql: ${TABLE}.Month_In_Qtr_f ;;
  }

  dimension: month_num_f {
    type: number
    sql: ${TABLE}.Month_Num_f ;;
  }

  dimension: qtr_f {
    type: string
    sql: ${TABLE}.Qtr_f ;;
  }

  dimension: qtr_num_f {
    type: number
    sql: ${TABLE}.Qtr_Num_f ;;
  }

  dimension: week {
    type: date
    sql: ${TABLE}.Week ;;
  }

  dimension: year_f {
    type: number
    sql: ${TABLE}.Year_f ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: max_bizday_month {
    type: max
    sql: ${cumul_bizdays_m};;
  }
}
