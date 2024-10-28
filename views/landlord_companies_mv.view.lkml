view: landlord_companies_mv {
  sql_table_name: `adityapocs.colliers_ourdeals.Landlord_Companies_MV` ;;
  view_label: "Landlords"
  dimension: address_line1 {
    type: string
    sql: ${TABLE}.AddressLine1 ;;
  }
  dimension: address_line2 {
    type: string
    sql: ${TABLE}.AddressLine2 ;;
  }
  dimension: address_line3 {
    type: string
    sql: ${TABLE}.AddressLine3 ;;
  }
  dimension: client_cguid {
    type: string
    sql: ${TABLE}.ClientCguid ;;
  }
  dimension: client_type {
    type: string
    sql: ${TABLE}.ClientType ;;
  }
  dimension: country_iso3 {
    type: string
    sql: ${TABLE}.CountryIso3 ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_party_id {
    type: number
    sql: ${TABLE}.DealPartyId ;;
  }
  dimension: deal_party_representation_type {
    type: string
    sql: ${TABLE}.DealPartyRepresentationType ;;
  }
  dimension: is_represenated_by_colliers {
    type: number
    sql: ${TABLE}.IsRepresenatedByColliers ;;
  }
  dimension: landlord_name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: source_business_country_iso {
    type: string
    sql: ${TABLE}.SourceBusinessCountryIso ;;
  }
  dimension: state_province_iso {
    type: string
    sql: ${TABLE}.StateProvinceIso ;;
  }
  dimension: street_number {
    type: string
    sql: ${TABLE}.StreetNumber ;;
  }
  measure: count {
    type: count
    drill_fields: [landlord_name]
  }
}
