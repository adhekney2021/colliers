view: installments_and_invoices {
  sql_table_name: `colliers_ourdeals.InstallmentsAndInvoices` ;;

  dimension: deal_id {
    type: number
    sql: ${TABLE}.DealId ;;
  }
  dimension_group: installment_due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.InstallmentDueDate ;;
  }
  dimension: installment_id {
    type: number
    sql: ${TABLE}.InstallmentId ;;
  }
  dimension: installment_invoice_status {
    type: string
    sql: ${TABLE}.Installment_invoiceStatus ;;
  }
  dimension: installment_state {
    type: string
    sql: ${TABLE}.InstallmentState ;;
  }
  dimension_group: invoice_due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.InvoiceDueDate ;;
  }
  dimension: invoice_number {
    type: string
    sql: ${TABLE}.InvoiceNumber ;;
  }
  dimension_group: invoiced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.InvoicedDate ;;
  }
  dimension_group: legal_due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LegalDueDate ;;
  }
  dimension: major_number {
    type: number
    sql: ${TABLE}.MajorNumber ;;
  }
  dimension: number {
    type: number
    sql: ${TABLE}.Number ;;
  }
  measure: count {
    type: count
  }
}
