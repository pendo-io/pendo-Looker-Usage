- dashboard: pendo_usage
  title: Pendo Usage
  layout: newspaper
  elements:
  - title: Monthly Active Accounts
    name: Monthly Active Accounts
    model: pendo_usage
    explore: monthlyactiveaccountcount
    type: single_value
    fields:
    - monthlyactiveaccountcount.unique_accounts
    - monthlyactiveaccountcount.date_month
    sorts:
    - monthlyactiveaccountcount.unique_accounts
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Monthly Active Accounts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    - monthlyactiveaccountcount.date
    row: 0
    col: 13
    width: 11
    height: 4
  - title: Monthly Active Users (Visitors)
    name: Monthly Active Users (Visitors)
    model: pendo_usage
    explore: monthlyactiveusercount
    type: single_value
    fields:
    - monthlyactiveusercount.unique_visitors
    - monthlyactiveusercount.date_month
    sorts:
    - monthlyactiveusercount.unique_visitors
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Monthly Active Users (Visitors)
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    - monthlyactiveusercount.date
    series_types: {}
    row: 0
    col: 0
    width: 12
    height: 4
  - title: Top 10 Features
    name: Top 10 Features
    model: pendo_usage
    explore: featureevents
    type: looker_bar
    fields:
    - allfeatures.name
    - featureevents.count
    sorts:
    - featureevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      featureevents.count: "#b9b9b9"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 35
    col: 0
    width: 24
    height: 8
  - title: Most Active Visitors by Feature Visits
    name: Most Active Visitors by Feature Visits
    model: pendo_usage
    explore: featureevents
    type: looker_bar
    fields:
    - featureevents.visitor_id
    - featureevents.count
    sorts:
    - featureevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      featureevents.count: "#b9b9b9"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 43
    col: 0
    width: 12
    height: 7
  - title: Most Active Account by Feature Visits
    name: Most Active Account by Feature Visits
    model: pendo_usage
    explore: featureevents
    type: looker_bar
    fields:
    - featureevents.count
    - featureevents.account_id
    sorts:
    - featureevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      featureevents.count: "#b9b9b9"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 43
    col: 13
    width: 11
    height: 7
  - title: Web Browser and Browser Versions In Use
    name: Web Browser and Browser Versions In Use
    model: pendo_usage
    explore: visitors
    type: table
    fields:
    - visitors.lastbrowsername
    - visitors.lastbrowserversion
    sorts:
    - visitors.lastbrowsername
    - visitors.lastbrowserversion desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      visitors.lastbrowsername: Browser Name
      visitors.lastbrowserversion: Browser Version
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 57
    col: 16
    width: 8
    height: 6
  - title: Bounced MAUs - Last 13 Months
    name: Bounced MAUs - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - events.day_month
    - events.active_user
    fill_fields:
    - events.day_month
    filters:
      events.day_month: 13 months
    sorts:
    - events.day_month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Users
      orientation: left
      series:
      - id: events.active_user
        name: Active User
        axisId: events.active_user
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 12
    col: 0
    width: 8
    height: 8
  - title: Average Time on Site per MAU - Last 13 Months
    name: Average Time on Site per MAU - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - events.day_month
    - events.number_of_minutes
    - events.active_user
    fill_fields:
    - events.day_month
    filters:
      events.day_month: 13 months
    sorts:
    - events.day_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: average_mins_per_mau
      label: Average Mins Per MAU
      expression: "${events.number_of_minutes} / ${events.active_user}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Average Mins Per Monthly Active User (MAU)
      orientation: left
      series:
      - id: average_mins_per_mau
        name: Average Mins Per MAU
        axisId: average_mins_per_mau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - events.number_of_minutes
    - events.active_user
    row: 12
    col: 8
    width: 8
    height: 8
  - title: Average Monthly Active Users Per Account - Last 13 Months
    name: Average Monthly Active Users Per Account - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - events.day_month
    - events.active_account
    - events.active_user
    fill_fields:
    - events.day_month
    filters:
      events.day_month: 13 months
    sorts:
    - events.day_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: average_maus_per_account
      label: Average MAUs Per Account
      expression: "${events.active_user} / ${events.active_account}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Average Monthly Active Users (MAUs) Per Account
      orientation: left
      series:
      - id: average_maus_per_account
        name: Average MAUs Per Account
        axisId: average_maus_per_account
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - events.active_account
    - events.active_user
    listen: {}
    row: 12
    col: 16
    width: 8
    height: 8
  - title: New MAUs - Last 13 Months
    name: New MAUs - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - calendar.month
    - events.new_mau
    filters:
      events.new_mau: NOT NULL
      calendar.month: 13 months
    sorts:
    - calendar.month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      events.new_mau: "#74bab3"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: New Monthly Active Users (MAUs)
      orientation: left
      series:
      - id: events.new_mau
        name: New MAU
        axisId: events.new_mau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 0
    width: 8
    height: 8
  - title: Churned MAUs - Last 13 Months
    name: Churned MAUs - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - calendar.month
    - events.churned_mau
    filters:
      events.churned_mau: NOT NULL
      calendar.month: 13 months
    sorts:
    - calendar.month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      events.churned_mau: "#edb7bf"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: Churned Monthly Active Users (MAUs)
      orientation: left
      series:
      - id: events.churned_mau
        name: Churned MAU
        axisId: events.churned_mau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 8
    width: 8
    height: 8
  - title: Net MAUs - Last 13 Months
    name: Net MAUs - Last 13 Months
    model: pendo_usage
    explore: events
    type: looker_column
    fields:
    - calendar.date_group_month
    - events.churned_mau
    - events.new_mau
    fill_fields:
    - calendar.date_group_month
    filters:
      calendar.date_group_month: 13 months
    sorts:
    - calendar.date_group_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: churn_offset
      label: Churn Offset
      expression: offset(${events.churned_mau},3)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: net_maus
      label: Net MAUs
      expression: "${events.new_mau} - ${churn_offset}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      net_maus: "#ede05f"
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Net Monthly Active Users (MAUs)
      orientation: left
      series:
      - id: net_maus
        name: Net MAUs
        axisId: net_maus
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 270
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - events.churned_mau
    - events.new_mau
    - churn_offset
    listen: {}
    row: 4
    col: 16
    width: 8
    height: 8
  - title: Account Industry
    name: Account Industry
    model: pendo_usage
    explore: accounts
    type: looker_column
    fields:
    - accounts.industry
    - accounts.count
    filters:
      accounts.industry: "-NULL"
    sorts:
    - accounts.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      accounts.count: "#90c8ae"
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: accounts.count
        name: Account Count
        axisId: accounts.count
      showLabels: false
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: ''
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 50
    col: 0
    width: 24
    height: 7
  - title: Visitor Operating Systems Used
    name: Visitor Operating Systems Used
    model: pendo_usage
    explore: visitors
    type: looker_column
    fields:
    - visitors.lastoperatingsystem
    - visitors.count
    sorts:
    - visitors.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      visitors.count: "#90c8ae"
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 57
    col: 0
    width: 8
    height: 6
  - title: Visitor Web Browser Used
    name: Visitor Web Browser Used
    model: pendo_usage
    explore: visitors
    type: looker_column
    fields:
    - visitors.count
    - visitors.lastbrowsername
    sorts:
    - visitors.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      visitors.count: "#90c8ae"
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 57
    col: 8
    width: 8
    height: 6
  - title: Top 10 Pages
    name: Top 10 Pages
    model: pendo_usage
    explore: pageevents
    type: looker_bar
    fields:
    - allpages.name
    - pageevents.count
    filters:
      allpages.name: "-Dashboard Home"
    sorts:
    - pageevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      pageevents.count: "#d0d0d0"
    series_labels:
      pageevents.count: Page Event Count - Excludes Dashboard Home Page
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 20
    col: 0
    width: 24
    height: 8
  - title: Most Active Visitors by Page Visits
    name: Most Active Visitors by Page Visits
    model: pendo_usage
    explore: pageevents
    type: looker_bar
    fields:
    - pageevents.visitor_id
    - pageevents.count
    sorts:
    - pageevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      pageevents.count: "#d0d0d0"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 28
    col: 0
    width: 12
    height: 7
  - title: Most Active Account by Page Visits
    name: Most Active Account by Page Visits
    model: pendo_usage
    explore: pageevents
    type: looker_bar
    fields:
    - pageevents.account_id
    - pageevents.count
    sorts:
    - pageevents.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      pageevents.count: "#d0d0d0"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Customer Success Manager: accounts.customersuccessmanager
    row: 28
    col: 13
    width: 11
    height: 7
  filters:
  - name: Customer Success Manager
    title: Customer Success Manager
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: pendo_usage
    explore: accounts
    listens_to_filters: []
    field: accounts.customersuccessmanager
