view: brokers {
  sql_table_name: `colliers_ourdeals.Brokers` ;;
  drill_fields: [broker_id]

  dimension: broker_id {
    primary_key: yes #verified
    type: number
    sql: ${TABLE}.BrokerId ;;
  }
  dimension: broker_instances {
    type: number
    sql: ${TABLE}.BrokerInstances ;;
  }
  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DepartmentId ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: is_active {
    label: "Is Active or Left"
    type: number
    sql: ${TABLE}.IsActive ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: full_name {
    type: string
    sql: concat(${first_name}," ",${last_name}) ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: broker_count {
    type: count_distinct
    sql: ${broker_id} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  broker_id,
  first_name,
  last_name,
  departments.short_name,
  departments.department_id,
  broker_deal_map.count,
  revenue.count
  ]
  }

}
