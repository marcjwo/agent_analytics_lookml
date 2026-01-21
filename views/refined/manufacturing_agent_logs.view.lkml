include: "/views/raw/manufacturing_agent_logs.view.lkml"

view: +manufacturing_agent_logs {
  fields_hidden_by_default: yes

  dimension: primary_key {
    hidden: no
    primary_key: yes
    sql: FARM_FINGERPRINT(CONCAT(${timestamp_raw},${user_id})) ;;
  }

  dimension: summary {
    hidden: no
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
    hidden: no
    type: string
    sql: TRIM(REGEXP_EXTRACT(${content}, r'text:\s*(.*?)\s*\|'), "'");;
  }

  # dimension: has_error {
  #   hidden: no
  #   type: yesno
  #   sql: ${event_type} = 'TOOL_ERROR' OR REGEXP_CONTAINS(content, r'(?i)\berror\b') ;;
  # }

  dimension: has_error {
    hidden: no
    type: yesno
    sql: ${event_type} = 'TOOL_ERROR' OR JSON_VALUE(${content}, '$.result.status') = 'ERROR' OR JSON_VALUE(${content}, '$.result.error_details') IS NOT NULL ;;
  }

  # dimension: prompt_token {
  #   hidden: no
  #   type: number
  #   sql: CAST(REGEXP_EXTRACT(${content}, r'prompt:\s*(\d+)') AS INT64) ;;
  # }

  dimension: prompt_token {
    hidden: no
    type: number
    sql: LAX_INT64(${content}.usage.prompt) ;;
  }

  # dimension: candidate_token {
  #   hidden: no
  #   type: number
  #   sql: CAST(REGEXP_EXTRACT(${content}, r'candidates:\s*(\d+)') AS INT64) ;;
  # }

  dimension: candidate_token {
    hidden: no
    type: number
    sql: LAX_INT64(${content}.usage.candidate) ;;
  }

  dimension: completion_token {
    hidden: no
    type: number
    sql: LAX_INT64(${content}.usage.completion) ;;
  }

  dimension: total_token {
    hidden: no
    type: number
    sql: SAFE_ADD(${prompt_token},${candidate_token});;
  }

  # dimension:  {}


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

  measure: distinct_tool_count {
    group_label: "Tools"
    label: "Unique tools"
    hidden: no
    type: count_distinct
    sql: ${tool_name} ;;
    # filters: [event_type: "TOOL_COMPLETED"]
  }

  measure: tool_count {
    group_label: "Tools"
    label: "Finished tool runs"
    hidden: no
    type: count
    filters: [event_type: "TOOL_COMPLETED"]
  }

  measure: error_count  {
    group_label: "Tools"
    label: "Failed tool runs"
    hidden: no
    type: count
    filters: [has_error: "yes"]
  }

  measure: failure_rate {
    group_label: "Tools"
    hidden: no
    value_format_name: percent_2
    type: number
    sql: SAFE_DIVIDE(${error_count},${tool_count}) ;;
  }

  measure: sum_of_prompt_token {
    label: "Total prompt token"
    group_label: "Token"
    hidden: no
    type: sum
    sql: ${prompt_token} ;;
  }

  measure: sum_of_all_token{
    label: "Total token"
    group_label: "Token"
    hidden: no
    type: number
    sql: sum(${total_token}) ;;
  }

  measure: sum_of_candidate_token {
    label: "Total candidate token"
    group_label: "Token"
    hidden: no
    type: sum
    sql: ${candidate_token} ;;
  }

  measure: sum_of_completion_token {
    label: "Total completion token"
    group_label: "Token"
    hidden: no
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
    group_label: "Latency"
    label: "Average latency in ms"
    hidden: no
    value_format_name: decimal_2
    type: average
    sql: ${latency_ms} ;;
  }
}
