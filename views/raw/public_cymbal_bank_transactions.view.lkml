# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: public_cymbal_bank_transactions {
  hidden: yes
    join: public_cymbal_bank_transactions__datastream_metadata__sort_keys {
      view_label: "Public Cymbal Bank Transactions: Datastream Metadata Sort Keys"
      sql: LEFT JOIN UNNEST(${public_cymbal_bank_transactions.datastream_metadata__sort_keys}) as public_cymbal_bank_transactions__datastream_metadata__sort_keys ;;
      relationship: one_to_many
    }
}
view: public_cymbal_bank_transactions {
  sql_table_name: `@{project-id}.@{bq-dataset}.public_cymbal_bank_transactions` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension: datastream_metadata__change_sequence_number {
    type: string
    sql: ${TABLE}.datastream_metadata.change_sequence_number ;;
    group_label: "Datastream Metadata"
    group_item_label: "Change Sequence Number"
  }
  dimension: datastream_metadata__change_type {
    type: string
    sql: ${TABLE}.datastream_metadata.change_type ;;
    group_label: "Datastream Metadata"
    group_item_label: "Change Type"
  }
  dimension: datastream_metadata__sort_keys {
    hidden: yes
    sql: ${TABLE}.datastream_metadata.sort_keys ;;
    group_label: "Datastream Metadata"
    group_item_label: "Sort Keys"
  }
  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }
  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }
  dimension: is_international {
    type: yesno
    sql: ${TABLE}.is_international ;;
  }
  dimension: is_trusted_device {
    type: yesno
    sql: ${TABLE}.is_trusted_device ;;
  }
  dimension: location_city {
    type: string
    sql: ${TABLE}.location_city ;;
  }
  dimension: location_country {
    type: string
    sql: ${TABLE}.location_country ;;
  }
  dimension: location_state {
    type: string
    sql: ${TABLE}.location_state ;;
  }
  dimension: merchant_category {
    type: string
    sql: ${TABLE}.merchant_category ;;
  }
  dimension: merchant_category_code {
    type: string
    sql: ${TABLE}.merchant_category_code ;;
  }
  dimension: merchant_ip_address {
    type: string
    sql: ${TABLE}.merchant_ip_address ;;
  }
  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }
  dimension: online_purchase {
    type: yesno
    sql: ${TABLE}.online_purchase ;;
  }
  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }
  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }
  dimension: transaction_status {
    type: string
    sql: ${TABLE}.transaction_status ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.transaction_time ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: tx_entry_mode {
    type: string
    sql: ${TABLE}.tx_entry_mode ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_ip_address {
    type: string
    sql: ${TABLE}.user_ip_address ;;
  }
  measure: count {
    type: count
    drill_fields: [merchant_name, customer_name]
  }
}

view: public_cymbal_bank_transactions__datastream_metadata__sort_keys {

  dimension: public_cymbal_bank_transactions__datastream_metadata__sort_keys {
    type: string
    sql: public_cymbal_bank_transactions__datastream_metadata__sort_keys ;;
  }
}
