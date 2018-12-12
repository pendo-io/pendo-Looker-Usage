view: calendar {
  sql_table_name: PENDO.CALENDAR
    ;;

  dimension: biz_day {
    type: number
    sql: ${TABLE}.BizDay ;;
  }

  dimension: cumul_bizdays_m {
    type: number
    sql: ${TABLE}.Cumul_BizDays_m ;;
  }

  dimension: cumul_bizdays_q {
    type: number
    sql: ${TABLE}.Cumul_BizDays_q ;;
  }

  dimension: cumul_bizdays_left_q {
    label: "Business Days Remaining"
    type: number
    sql: ${TABLE}.cumul_bizdays_left_q ;;
  }

  dimension: cumul_bizdays_y {
    type: number
    sql: ${TABLE}.Cumul_BizDays_y ;;
  }

  dimension: cumul_caldays_q {
    label: "Calendar Days Elapsed in the Quarter"
    type: number
    sql: ${TABLE}.Cumul_CalDays_q ;;
  }

  dimension: cumul_caldays_left_q {
    label: "Calendar Days Left in the Quarter"
    type: number
    sql: ${TABLE}.Cumul_CalDays_Left_q ;;
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

  dimension: month_num_c {
    type: number
    sql: ${TABLE}.Month_Num_c ;;
  }

  dimension: month_num_f {
    type: number
    sql: ${TABLE}.Month_Num_f ;;
  }

  dimension: pct_biz_days_m {
    type: number
    sql: ${TABLE}.Pct_BizDays_m ;;
  }

  dimension: pct_biz_days_q {
    type: number
    sql: ${TABLE}.Pct_BizDays_q ;;
  }

  dimension: pct_biz_days_y {
    type: number
    sql: ${TABLE}.Pct_BizDays_y ;;
  }

  dimension: qtr_c {
    type: string
    sql: ${TABLE}.Qtr_c ;;
  }

  dimension: qtr_f {
    type: string
    sql: ${TABLE}.Qtr_f ;;
  }

  dimension: qtr_num_c {
    type: number
    sql: ${TABLE}.Qtr_Num_c ;;
  }

  dimension: qtr_num_f {
    type: number
    sql: ${TABLE}.Qtr_Num_f ;;
  }

  dimension: week {
    type: date
    sql: ${TABLE}.Week ;;
  }

  dimension: year_c {
    type: number
    sql: ${TABLE}.Year_c ;;
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
