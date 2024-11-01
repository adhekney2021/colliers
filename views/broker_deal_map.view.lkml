view: broker_deal_map {
  sql_table_name: `colliers_ourdeals.BrokerDealMap` ;;

  dimension: broker_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.BrokerId ;;
  }
  dimension: column1 {
    type: string
    sql: ${TABLE}.Column1 ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_party_id {
    primary_key: yes #verified
    type: number
    sql: ${TABLE}.DealPartyId ;;
  }
  dimension: is_lead {
    type: yesno
    sql: ${TABLE}.IsLead ;;
  }
  measure: count {
    type: count
    drill_fields: [brokers.broker_id, brokers.first_name, brokers.last_name]
  }
}
