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
  label: "Broker Deal Map, Departments"
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
  label:"Brokers, Departments"
  join: departments {
    type: left_outer
    sql_on: ${brokers.department_id} = ${departments.department_id} ;;
    relationship: many_to_one
  }
}

explore: departments {}

#explore: deal_header {
#  label: "Deal Header/Brokers"
#  join: broker_deal_map {
#    type: left_outer
#    sql_on: ${deal_header.deal_id}=${broker_deal_map.deal_id} ;;
#    relationship: one_to_many
#  }
#  join: brokers {
#    type: left_outer
#    sql_on: ${broker_deal_map.broker_id}=${brokers.broker_id} ;;
#    relationship: many_to_one
#  }
#
#}

explore: deal_header {

  label: "Our Deals"
  join: lease_header {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${lease_header.deal_id} ;;
    relationship: many_to_one
  }

  join: properties {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${properties.deal_id};;
    relationship: one_to_many
  }

  join: companies {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${companies.deal_id} ;;
    relationship: one_to_many
    sql_where: ${companies.deal_party_representation_type} is null ;;
  }

  join: landlord_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${landlord_companies_mv.deal_id} ;;
    relationship: one_to_many
  }

  join: buyer_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${buyer_companies_mv.deal_id} ;;
    relationship: one_to_many
  }

  join: seller_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${seller_companies_mv.deal_id} ;;
    relationship: one_to_many
  }

  join: tenant_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${tenant_companies_mv.deal_id} ;;
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
    relationship: one_to_many
  }

  join: brokers {
    type: left_outer
    sql_on: ${broker_deal_map.broker_id}=${brokers.broker_id} ;;
    relationship: many_to_one
  }

}

explore: installments_and_invoices {}

explore: lease_header {
  symmetric_aggregates: yes

  label: "Lease/Deal Headers, Properties, Companies, Departments, Installments, 3P Shares, Revenue and Broker"
  join: deal_header {
    type: left_outer
    sql_on: ${lease_header.deal_id}=${deal_header.deal_id} ;;
    relationship: many_to_one
  }

  join: properties {
    type: left_outer
    sql_on: ${lease_header.deal_id}=${properties.deal_id} ;;
    relationship: many_to_one
  }

  join: companies {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${companies.deal_id} ;;
    relationship: many_to_many
    sql_where: ${companies.deal_party_representation_type} is null ;;
  }

  join: landlord_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${landlord_companies_mv.deal_id} ;;
    relationship: many_to_many
  }

  join: buyer_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${buyer_companies_mv.deal_id} ;;
    relationship: many_to_many
  }

  join: seller_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${seller_companies_mv.deal_id} ;;
    relationship: many_to_many
  }

  join: tenant_companies_mv {
    type: left_outer
    sql_on: ${deal_header.deal_id}=${tenant_companies_mv.deal_id} ;;
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
  label: "Revenue, Brokers, Departments, Installments & Invoices"
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

  join: installments_and_invoices {
    type: left_outer
    sql_on: ${revenue.installment_id} = ${installments_and_invoices.installment_id} ;;
    relationship: many_to_one
  }
}

explore: third_party_share {}
