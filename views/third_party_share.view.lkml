view: third_party_share {
  sql_table_name: `colliers_ourdeals.ThirdPartyShare` ;;

  dimension: audexchange_rate {
    type: number
    sql: ${TABLE}.AUDExchangeRate ;;
  }
  dimension: cadexchange_rate {
    type: number
    sql: ${TABLE}.CADExchangeRate ;;
  }
  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension: deal_party_type {
    type: string
    sql: ${TABLE}.DealPartyType ;;
  }
  dimension: installment_amt {
    type: number
    sql: ${TABLE}.InstallmentAmt ;;
  }
  dimension: installment_amt_gross {
    type: string
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
  dimension: pool_deductedfrom_broker {
    type: string
    sql: ${TABLE}.PoolDeductedfromBroker ;;
  }
  dimension: revenue_contribution {
    type: number
    sql: ${TABLE}.RevenueContribution ;;
  }
  dimension: third_party {
    type: string
    sql: ${TABLE}.ThirdParty ;;
  }
  dimension: usdexchange_rate {
    type: number
    sql: ${TABLE}.USDExchangeRate ;;
  }
  measure: count {
    type: count
  }
}
