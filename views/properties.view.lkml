view: properties {
  sql_table_name: `colliers_ourdeals.Properties` ;;
  drill_fields: [deal_propertyid]

  dimension: deal_propertyid {
    primary_key: yes
    type: number
    sql: ${TABLE}.DealPropertyid ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }
  dimension: area {
    type: number
    sql: ${TABLE}.Area ;;
  }
  dimension: area_sq_m {
    type: number
    sql: ${TABLE}.AreaSqM ;;
  }
  dimension: area_type_name {
    type: string
    sql: ${TABLE}.AreaTypeName ;;
  }
  dimension: area_uo_m {
    type: string
    sql: ${TABLE}.AreaUoM ;;
  }
  dimension: building_name {
    type: string
    sql: ${TABLE}.BuildingName ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: district_region1 {
    type: string
    sql: ${TABLE}.DistrictRegion1 ;;
  }
  dimension: district_region2 {
    type: string
    sql: ${TABLE}.DistrictRegion2 ;;
  }
  dimension: floor_number {
    type: string
    sql: ${TABLE}.FloorNumber ;;
  }
  dimension: is_primary_property {
    type: yesno
    sql: ${TABLE}.isPrimaryProperty ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }
  dimension: property_subtype {
    type: string
    sql: ${TABLE}.PropertySubtype ;;
  }
  dimension: property_type {
    type: string
    sql: ${TABLE}.PropertyType ;;
  }
  dimension: short_name {
    type: string
    sql: ${TABLE}.ShortName ;;
  }
  dimension: short_name2 {
    type: string
    sql: ${TABLE}.ShortName2 ;;
  }
  dimension: suite_unit {
    type: string
    sql: ${TABLE}.SuiteUnit ;;
  }
  measure: count {
    type: count
    drill_fields: [deal_propertyid, building_name, short_name, area_type_name]
  }
}
