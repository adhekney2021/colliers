view: departments {
  sql_table_name: `colliers_ourdeals.Departments` ;;
  drill_fields: [department_id]
  view_label: "Department/Market"

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DepartmentId ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }
  dimension: short_name {
    type: string
    sql: ${TABLE}.ShortName ;;
  }
  dimension: state_prov {
    type: string
    sql: ${TABLE}.StateProv ;;
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.StreetAddress ;;
  }
  measure: count {
    type: count
    drill_fields: [department_id, short_name, brokers.count, revenue.count]
  }
}
