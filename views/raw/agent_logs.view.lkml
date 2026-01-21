view: agent_logs {
  sql_table_name: `gemini-looker-demo-dataset.agent_analytics.agent_logs` ;; # copied table, for dev purposes
  # sql_table_name: `agentic-cloud-demo.accelerate_demo_eu.manufacturing_agent_logs` ;; # new table, for demo purposes
  fields_hidden_by_default: yes

  dimension: agent {
    hidden: no
    type: string
    sql: ${TABLE}.agent ;;
  }
  dimension: content {
    hidden: no
    type: string
    sql: ${TABLE}.content ;;
  }
  dimension: error_message {
    hidden: no
    type: string
    sql: ${TABLE}.error_message ;;
  }
  dimension: event_type {
    hidden: no
    type: string
    sql: ${TABLE}.event_type ;;
  }
  dimension: invocation_id {
    hidden: no
    type: string
    sql: ${TABLE}.invocation_id ;;
  }
  dimension: session_id {
    hidden: no
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension_group: timestamp {
    hidden: no
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: user_id {
    hidden: no
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: is_truncated {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_truncated = true;;
  }
  measure: count {
    hidden: no
    type: count
  }
}
