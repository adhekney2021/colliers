view: revenue {
  sql_table_name: `colliers_ourdeals.Revenue` ;;

  dimension: audexchange_rate {
    type: number
    sql: ${TABLE}.AUDExchangeRate ;;
  }
  dimension: broker_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.BrokerId ;;
  }
  dimension: cadexchange_rate {
    type: number
    sql: ${TABLE}.CADExchangeRate ;;
  }
  dimension: column1 {
    type: yesno
    sql: ${TABLE}.Column1 ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_party_type {
    type: string
    sql: ${TABLE}.DealPartyType ;;
  }
  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DepartmentId ;;
  }
  dimension: installment_amt {
    type: number
    sql: ${TABLE}.InstallmentAmt ;;
  }
  dimension: installment_amt_gross {
    type: number
    sql: ${TABLE}.InstallmentAmtGross ;;
  }
  dimension: installment_id {
    type: number
    sql: ${TABLE}.InstallmentId ;;
  }
  dimension: nzdexchange_rate {
    type: number
    sql: ${TABLE}.NZDExchangeRate ;;
  }
  dimension: pool_account_amt {
    type: string
    sql: ${TABLE}.PoolAccountAmt ;;
  }
  dimension: pool_account_id {
    type: string
    sql: ${TABLE}.PoolAccountId ;;
  }
  dimension: pool_deductedfrom_broker {
    type: string
    sql: ${TABLE}.PoolDeductedfromBroker ;;
  }
  dimension: revenue_contribution {
    type: number
    sql: ${TABLE}.RevenueContribution ;;
  }
  dimension: usdexchange_rate {
    type: number
    sql: ${TABLE}.USDExchangeRate ;;
  }
  measure: count {
    type: count
    drill_fields: [brokers.broker_id, brokers.first_name, brokers.last_name, departments.short_name, departments.department_id]
  }
}
