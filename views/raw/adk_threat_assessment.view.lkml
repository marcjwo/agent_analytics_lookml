# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
view: adk_threat_assessment {
  sql_table_name: `@{project_id}.@{bq_dataset}.@{adk_assessment_table}` ;;

  dimension: agent_decision {
    type: string
    sql: ${TABLE}.agent_decision ;;
  }
  dimension: agent_reasoning {
    type: string
    sql: ${TABLE}.agent_reasoning ;;
  }
  dimension: avg_monthly_spend {
    type: number
    sql: ${TABLE}.avg_monthly_spend ;;
  }
  dimension: behavior_anomalies {
    hidden: yes
    sql: ${TABLE}.behavior_anomalies ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension: declined_count_7d {
    type: number
    sql: ${TABLE}.declined_count_7d ;;
  }
  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }
  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, hour, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: has_security_mismatch {
    type: yesno
    sql: ${TABLE}.has_security_mismatch ;;
  }
  dimension: is_impossible_travel {
    type: yesno
    sql: ${TABLE}.is_impossible_travel ;;
  }
  dimension: is_untrusted_device {
    type: yesno
    sql: ${TABLE}.is_untrusted_device ;;
  }
  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }
  dimension: merchant_reputation {
    type: string
    sql: ${TABLE}.merchant_reputation ;;
  }
  dimension: raw_alert_payload {
    type: string
    sql: ${TABLE}.raw_alert_payload ;;
  }
  dimension: receipt_gcs_uri {
    type: string
    sql: ${TABLE}.receipt_gcs_uri ;;
  }
  dimension: risk_score {
    type: number
    sql: ${TABLE}.risk_score ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: signed_receipt_url {
    type: string
    sql: ${TABLE}.signed_receipt_url ;;
  }
  dimension: total_spend_7d {
    type: number
    sql: ${TABLE}.total_spend_7d ;;
  }
  dimension: transaction_amount {
    type: number
    sql: ${TABLE}.transaction_amount ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: vision_ocr_summary {
    type: string
    sql: ${TABLE}.vision_ocr_summary ;;
  }
  measure: count {
    type: count
    drill_fields: [merchant_name, customer_name]
  }
}

view: adk_threat_assessment__behavior_anomalies {

  dimension: adk_threat_assessment__behavior_anomalies {
    type: string
    sql: adk_threat_assessment__behavior_anomalies ;;
  }
}
