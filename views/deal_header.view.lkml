view: deal_header {
  sql_table_name: `colliers_ourdeals.DealHeader` ;;
  view_label: "Basic Deal Information"

  dimension: audexchange_rate {
    type: number
    sql: ${TABLE}.AUDExchangeRate ;;
  }
  dimension: cadexchange_rate {
    type: number
    sql: ${TABLE}.CADExchangeRate ;;
  }
  dimension_group: closed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ClosedDate ;;
  }
  dimension: confirmed_date {
    type: string
    sql: ${TABLE}.ConfirmedDate ;;
  }
  dimension: deal_country {
    type: string
    sql: ${TABLE}.DealCountry ;;
  }
  dimension: deal_currency {
    type: string
    sql: ${TABLE}.DealCurrency ;;
  }
  dimension: deal_department {
    type: string
    sql: ${TABLE}.DealDepartment ;;
  }
  dimension: deal_id {
    primary_key: yes #verified
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_owner_department_id {
    type: number
    sql: ${TABLE}.DealOwnerDepartmentId ;;
  }
  dimension: deal_status {
    type: string
    sql: ${TABLE}.DealStatus ;;
  }
  dimension: deal_sub_type {
    label: "Deal Sub Type/Deal Subcategory"
    type: string
    sql: ${TABLE}.DealSubType ;;
  }
  dimension: deal_type {
    label: "Deal Type/Deal Category"
    type: string
    sql: ${TABLE}.DealType ;;
  }
  dimension_group: firmed_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FirmedDate ;;
  }
  dimension: is_australia {
    label: "Australian Broker"
    type: number
    sql: ${TABLE}.IsAustralia ;;
  }
  dimension: is_canada {
    label: "Canadian Broker"
    type: number
    sql: ${TABLE}.IsCanada ;;
  }
  dimension: is_new_zealand {
    label: "New Zealand Broker"
    type: number
    sql: ${TABLE}.IsNewZealand ;;
  }
  dimension: is_singapore {
    label: "Singapore Broker"
    type: number
    sql: ${TABLE}.IsSingapore ;;
  }
  dimension: is_united_states {
    label: "US/American Broker"
    type: number
    sql: ${TABLE}.IsUnitedStates ;;
  }
  dimension: nzdexchange_rate {
    type: number
    sql: ${TABLE}.NZDExchangeRate ;;
  }
  dimension: individual_deal_value {
    description: "Deal Value"
    type: number
    sql: ${TABLE}.TotalDealValueDealCurrency ;;
  }
  dimension: usdexchange_rate {
    type: number
    sql: ${TABLE}.USDExchangeRate ;;
  }
  measure: count {
    label: "Number of Transactions"
    description: "Deal Count"
    type: count
  }
  measure: total_deal_value {
    description: "Total Deal Value"
    type: sum
    sql: ${individual_deal_value} ;;
  }
}
