view: lease_header {
  sql_table_name: `colliers_ourdeals.LeaseHeader` ;;

  dimension: area {
    type: number
    sql: ${TABLE}.Area ;;
  }
  dimension: commission {
    type: number
    sql: ${TABLE}.Commission ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_id2 {
    type: number
    sql: ${TABLE}.DealId2 ;;
  }
  dimension: deal_lease_id {
    primary_key: yes #verified
    type: number
    sql: ${TABLE}.DealLeaseId ;;
  }
  dimension: deal_lease_id2 {
    type: number
    sql: ${TABLE}.DealLeaseId2 ;;
  }
  dimension: deal_property_id {
    type: number
    sql: ${TABLE}.DealPropertyId ;;
  }
  dimension: deal_property_id2 {
    type: number
    sql: ${TABLE}.DealPropertyId2 ;;
  }
  dimension: executed_renewal_option {
    type: yesno
    sql: ${TABLE}.ExecutedRenewalOption ;;
  }
  dimension: executed_termination_option {
    type: string
    sql: ${TABLE}.ExecutedTerminationOption ;;
  }
  dimension: is_australia {
    type: number
    sql: ${TABLE}.IsAustralia ;;
  }
  dimension: is_canada {
    type: number
    sql: ${TABLE}.IsCanada ;;
  }
  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }
  dimension: is_japan {
    type: number
    sql: ${TABLE}.IsJapan ;;
  }
  dimension: is_new_zealand {
    type: number
    sql: ${TABLE}.IsNewZealand ;;
  }
  dimension: is_philippines {
    type: number
    sql: ${TABLE}.IsPhilippines ;;
  }
  dimension: is_singapore {
    type: number
    sql: ${TABLE}.IsSingapore ;;
  }
  dimension: is_south_korea {
    type: number
    sql: ${TABLE}.IsSouthKorea ;;
  }
  dimension: is_united_states {
    type: number
    sql: ${TABLE}.IsUnitedStates ;;
  }
  dimension_group: last_update_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LastUpdateDateTime ;;
  }
  dimension: lease_escalation_type {
    type: string
    sql: ${TABLE}.LeaseEscalationType ;;
  }
  dimension: lease_escalation_type_id {
    type: number
    sql: ${TABLE}.LeaseEscalationTypeId ;;
  }
  dimension: lease_execution_date {
    type: string
    sql: ${TABLE}.LeaseExecutionDate ;;
  }
  dimension_group: lease_expiry {
    label: "Lease Expiry Date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LeaseExpiryDate ;;
  }
  dimension_group: lease_period_ends {
    label: "Lease Period End Date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LeasePeriodEnds ;;
  }
  dimension_group: lease_period_starts {
    label: "Lease Period Start Date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LeasePeriodStarts ;;
  }
  dimension: lease_rate_type {
    type: string
    sql: ${TABLE}.LeaseRateType ;;
  }
  dimension: lease_rate_type_id {
    type: number
    sql: ${TABLE}.LeaseRateTypeId ;;
  }
  dimension: lease_type {
    type: string
    sql: ${TABLE}.LeaseType ;;
  }
  dimension: lease_type_id {
    type: number
    sql: ${TABLE}.LeaseTypeId ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.StartDate ;;
  }
  dimension: total_value {
    type: number
    sql: ${TABLE}.TotalValue ;;
  }
  measure: count {
    type: count
  }

  measure: deal_count {
    type: count_distinct
    sql: ${deal_lease_id} ;;
  }
  measure: tot_value {
    type: sum
    sql: ${total_value} ;;
    value_format_name: usd_0
  }

  dimension: lease_rate_per_square_ft {
    type: number
    value_format_name: usd
    sql: ${total_value}/${area} ;;
  }

  measure: average_lease_rate_per_sqft {
    type: average
    value_format_name: usd
    sql: ${total_value}/${area} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [deal_lease_id,deal_id, deal_property_id,commission,executed_renewal_option,executed_termination_option,area,total_value, lease_period_starts_date,lease_period_ends_date, lease_escalation_type, lease_expiry_date, lease_rate_type, lease_type]
  }

}
