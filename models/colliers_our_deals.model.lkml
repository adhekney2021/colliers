connection: "adityapocs-colliers-ourdeals-bq"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: colliers_our_deals_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: colliers_our_deals_default_datagroup

explore: properties {}

explore: companies {}

explore: broker_deal_map {
  join: brokers {
    type: left_outer
    sql_on: ${broker_deal_map.broker_id} = ${brokers.broker_id} ;;
    relationship: many_to_one
  }

  join: departments {
    type: left_outer
    sql_on: ${brokers.department_id} = ${departments.department_id} ;;
    relationship: many_to_one
  }
}

explore: brokers {
  join: departments {
    type: left_outer
    sql_on: ${brokers.department_id} = ${departments.department_id} ;;
    relationship: many_to_one
  }
}

explore: departments {}

explore: deal_header {}

explore: installments_and_invoices {}

explore: lease_header {
  join: deal_header {
    type: left_outer
    sql_on: ${lease_header.deal_id}=${deal_header.deal_id} ;;
    relationship: many_to_one
  }

  join: properties {
    type: left_outer
    sql_on: ${lease_header.deal_property_id}=${properties.deal_propertyid} ;;
    relationship: many_to_one
  }

  join: companies {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${companies.deal_id} ;;
    relationship: many_to_many
  }

  join: departments {
    type: left_outer
    sql_on: ${deal_header.deal_owner_department_id}=${departments.department_id} ;;
    relationship: many_to_many
  }

  join: installments_and_invoices {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${installments_and_invoices.deal_id} ;;
    relationship: many_to_many
  }

  join: revenue {
    type: left_outer
    sql_on: ${installments_and_invoices.installment_id}=${revenue.installment_id} ;;
    relationship: many_to_many
  }

  join: third_party_share {
    type: left_outer
    sql_on: ${installments_and_invoices.installment_id}=${third_party_share.installment_id} ;;
    relationship: many_to_many
  }

  join: broker_deal_map {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${broker_deal_map.deal_id} ;;
    relationship: many_to_many
  }

  join: brokers {
    type: left_outer
    sql_on: ${broker_deal_map.broker_id}=${brokers.broker_id} ;;
    relationship: many_to_one
  }

}

explore: revenue {
  join: brokers {
    type: left_outer
    sql_on: ${revenue.broker_id} = ${brokers.broker_id} ;;
    relationship: many_to_one
  }

  join: departments {
    type: left_outer
    sql_on: ${revenue.department_id} = ${departments.department_id} ;;
    relationship: many_to_one
  }
}

explore: third_party_share {}
