include: "/views/raw/manufacturing_agent_logs.view.lkml"

view: +manufacturing_agent_logs {
  fields_hidden_by_default: yes

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: FARM_FINGERPRINT(CONCAT(${timestamp_raw},${user_id})) ;;
  }
  dimension: agent {
    hidden: no
    type: string
    description: "The name of the agent that generated this event. Useful for multi-agent systems."
    sql: LOWER(${TABLE}.agent) ;;
  }

  dimension: summary {
    hidden: yes
    sql: JSON_VALUE(${content}, '$.response') ;;
  }

  # dimension: tool_name {
  #   hidden: no
  #   type: string
  #   sql: TRIM(REGEXP_EXTRACT(${content}, r'Tool Name: ([^,|]+)')) ;;
  # }

  dimension: tool_name {
    hidden: no
    type: string
    sql: JSON_VALUE(${content}, '$.tool') ;;
  }

  dimension: text_response {
    hidden: yes
    type: string
    sql: TRIM(REGEXP_EXTRACT(${content}, r'text:\s*(.*?)\s*\|'), "'");;
  }

  # dimension: has_error {
  #   hidden: no
  #   type: yesno
  #   sql: ${event_type} = 'TOOL_ERROR' OR REGEXP_CONTAINS(content, r'(?i)\berror\b') ;;
  # }

  dimension: has_error {
    hidden: yes
    type: yesno
    sql: ${event_type} = 'TOOL_ERROR' OR JSON_VALUE(${content}, '$.result.status') = 'ERROR' OR JSON_VALUE(${content}, '$.result.error_details') IS NOT NULL ;;
  }

  # dimension: prompt_token {
  #   hidden: no
  #   type: number
  #   sql: CAST(REGEXP_EXTRACT(${content}, r'prompt:\s*(\d+)') AS INT64) ;;
  # }

  dimension: prompt_token {
    hidden: yes
    type: number
    sql: LAX_INT64(${content}.usage.prompt) ;;
  }

  # dimension: candidate_token {
  #   hidden: no
  #   type: number
  #   sql: CAST(REGEXP_EXTRACT(${content}, r'candidates:\s*(\d+)') AS INT64) ;;
  # }

  dimension: candidate_token {
    hidden: yes
    type: number
    sql: CASE WHEN LAX_INT64(${content}.usage.candidate) IS NULL THEN 0 ELSE LAX_INT64(${content}.usage.candidate) END ;;
  }

  dimension: completion_token {
    hidden: yes
    type: number
    sql: LAX_INT64(${content}.usage.completion) ;;
  }

  dimension: total_token {
    hidden: yes
    type: number
    sql: SAFE_ADD(${prompt_token},${candidate_token});;
  }

  # dimension:  {}

  measure: total_investigation_cost {
    type: sum
    label: "Total Cost of Investigation"
    description: "Hardcoded based on Gemini 3 Pro 2026 rates: $2.00/1M input, $12.00/1M output"
    value_format: "$#0.0000"
    sql:
      (${prompt_token} * 0.000002) +
      (${completion_token} * 0.000012)
    ;;
  }
  #####

  measure: user_count {
    hidden: no
    type: count_distinct
    sql: ${user_id} ;;
  }

  # measure: tool_starts {
  #   group_label: "Tool counts"
  #   label: "Tool starts"
  #   hidden: no
  #   type: count
  #   filters: [event_type: "TOOL_STARTING"]
  # }
#

  measure: distinct_tool_count {
    hidden: no
    group_label: "Tools"
    label: "Unique tools"
    type: count_distinct
    sql: ${tool_name} ;;
    # filters: [event_type: "TOOL_COMPLETED"]
  }

  measure: tool_count {
    hidden: no
    group_label: "Tools"
    label: "Finished tool runs"
    type: count
    filters: [event_type: "TOOL_COMPLETED"]
  }

  measure: error_count  {
    hidden: no
    group_label: "Tools"
    label: "Failed tool runs"
    type: count
    filters: [has_error: "yes"]
  }

  measure: failure_rate {
    hidden: no
    group_label: "Tools"
    label: "Tool Failure Rate"
    value_format_name: percent_2
    type: number
    sql: SAFE_DIVIDE(${error_count},${tool_count}) ;;
  }

  measure: sum_of_prompt_token {
    hidden: no
    label: "Total prompt token"
    group_label: "Token"
    type: sum
    sql: ${prompt_token} ;;
  }

  measure: sum_of_all_token{
    hidden: no
    label: "Total token"
    group_label: "Token"
    type: number
    sql: sum(${total_token}) ;;
  }

  measure: sum_of_candidate_token {
    hidden: no
    label: "Total candidate token"
    group_label: "Token"
    type: sum
    sql: ${candidate_token} ;;
  }

  measure: sum_of_completion_token {
    hidden: no
    label: "Total completion token"
    group_label: "Token"
    html: {{ rendered_value }} completion token used ;;
    type: sum
    sql: ${completion_token} ;;
  }

  measure: session_count {
    hidden: no
    type: count_distinct
    sql: ${session_id};;
  }

  measure: invocation_count {
    hidden: no
    type: count_distinct
    sql: ${invocation_id} ;;
  }

  measure: average_latency {
    hidden: no
    group_label: "Latency"
    label: "Average latency in ms"
    value_format_name: decimal_2
    type: average
    sql: ${latency_ms} ;;
  }

  dimension: is_user_turn {
    hidden: yes
    type: yesno
    sql: ${event_type} = 'USER_MESSAGE_RECEIVED';;
  }

  measure: user_turns_count {
    hidden: no
    type: sum
    sql: CASE WHEN ${is_user_turn} THEN 1 ELSE 0 END ;;
  }

  measure: average_user_turns {
    hidden: no
    type: number
    sql: AVG(${user_turns_count}) ;;
  }

  # dimension_group: duration {
  #   hidden: no
  #   type: duration
  #   timeframes: [second]
  #   sql_start: MIN(${timestamp_raw}) ;;
  #   sql_end: MAX(${timestamp_raw}) ;;
  # }

  measure: min_timestamp {
    hidden: no
    type: date_time
    sql: min(${timestamp_raw}) ;;
  }

  measure: max_timestamp {
    hidden: no
    type: date_time
    sql: max(${timestamp_raw}) ;;
  }

  measure: session_duration {
    hidden: no
    type: number
    sql: TIMESTAMP_DIFF(MAX(${timestamp_raw}),MIN(${timestamp_raw}), SECOND) ;;
  }

  measure: run_user_summary_investigation {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "run_user_summary_investigation"]
  }

  measure: log_false_positive {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "log_false_positive"]
  }

  measure: get_visual_analysis_for_user {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "get_visual_analysis_for_user"]
  }

  measure: get_gcs_uri_for_user {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "get_gcs_uri_for_user"]
  }

  measure: generate_signed_url {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "generate_signed_url"]
  }

  measure: escalate_to_human {
    hidden: no
    group_label: "Tool count"
    type: count
    filters: [tool_name: "escalate_to_human"]
  }

  measure: average_turns_session {
    type: average
    sql: sess  ;;
  }
  # measure: execute_sql_count {
  #   hidden: no
  #   group_label: "Tool count"
  #   type: count
  #   filters: [tool_name: "execute_sql"]
  # }

  # measure: get_table_info_count {
  #   hidden: no
  #   group_label: "Tool count"
  #   type: count
  #   filters: [tool_name: "get_table_info"]
  # }

  # measure: list_table_ids_count {
  #   hidden: no
  #   group_label: "Tool count"
  #   type: count
  #   filters: [tool_name: "list_table_ids"]
  # }

  # measure: search_places {
  #   hidden: no
  #   group_label: "Tool count"
  #   type: count
  #   filters: [tool_name: "search_places"]
  # }

  # measure: average_turns_session {
  #   type: average
  #   sql: sess  ;;
  # }



  dimension: session_lengths_bins {}
}
