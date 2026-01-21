# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: manufacturing_agent_logs {
#   hidden: yes
#     join: manufacturing_agent_logs__content_parts {
#       view_label: "Manufacturing Agent Logs: Content Parts"
#       sql: LEFT JOIN UNNEST(${manufacturing_agent_logs.content_parts}) as manufacturing_agent_logs__content_parts ;;
#       relationship: one_to_many
#     }
# }
view: manufacturing_agent_logs {
  sql_table_name: `agentic-cloud-demo.manufacturing_data.manufacturing_agent_logs` ;;
  fields_hidden_by_default: yes

  dimension: agent {
    hidden: no
    type: string
    description: "The name of the agent that generated this event. Useful for multi-agent systems."
    sql: ${TABLE}.agent ;;
  }
  dimension: attributes {
    hidden: yes
    type: string
    description: "A JSON object containing arbitrary key-value pairs for additional event metadata not covered by standard fields."
    sql: ${TABLE}.attributes ;;
  }
  dimension: content {
    hidden: yes
    type: string
    description: "The primary payload of the event, stored as a JSON string. The structure depends on the event_type (e.g., prompt text for LLM_REQUEST, tool output for TOOL_RESPONSE)."
    sql: ${TABLE}.content ;;
  }
  dimension: content_parts {
    hidden: yes
    sql: ${TABLE}.content_parts ;;
  }
  dimension: error_message {
    hidden: no
    type: string
    description: "Detailed error message if the status is 'ERROR'."
    sql: ${TABLE}.error_message ;;
  }
  dimension: event_type {
    hidden: no
    type: string
    description: "The category of the event (e.g., 'LLM_REQUEST', 'TOOL_CALL', 'AGENT_RESPONSE'). Helps in filtering specific types of interactions."
    sql: ${TABLE}.event_type ;;
  }
  dimension: invocation_id {
    hidden: no
    type: string
    description: "A unique identifier for a single turn or execution within a session. Groups related events like LLM request and response."
    sql: ${TABLE}.invocation_id ;;
  }
  dimension: is_truncated {
    hidden: no
    type: yesno
    description: "Boolean flag indicating if the 'content' field was truncated because it exceeded the maximum allowed size."
    sql: ${TABLE}.is_truncated = true ;;
  }

  # dimension: latency_ms {
  #   type: string
  #   description: "A JSON object containing latency measurements, such as 'total_ms' and 'time_to_first_token_ms'."
  #   sql: ${TABLE}.latency_ms ;;
  # }

  # dimension: latency_ms_cast {
  #   hidden: no
  #   type: string
  #   description: "A JSON object containing latency measurements, such as 'total_ms' and 'time_to_first_token_ms'."
  #   sql: CAST(JSON_VALUE(${TABLE}.latency_ms, '$.total_ms') as INT64);;
  # }

  dimension: latency_ms {
    hidden: no
    type: string
    description: "A JSON object containing latency measurements, such as 'total_ms' and 'time_to_first_token_ms'."
    sql: LAX_INT64(${TABLE}.latency_ms.total_ms);;
  }

  dimension: parent_span_id {
    hidden: yes
    type: string
    description: "OpenTelemetry parent span ID to reconstruct the operation hierarchy."
    sql: ${TABLE}.parent_span_id ;;
  }
  dimension: session_id {
    hidden: no
    type: string
    description: "A unique identifier for the entire conversation session. Used to group all events belonging to a single user interaction."
    sql: ${TABLE}.session_id ;;
  }
  dimension: span_id {
    hidden: yes
    type: string
    description: "OpenTelemetry span ID for this specific operation."
    sql: ${TABLE}.span_id ;;
  }
  dimension: status {
    hidden: yes
    type: string
    description: "The outcome of the event, typically 'OK' or 'ERROR'."
    sql: ${TABLE}.status ;;
  }
  dimension_group: timestamp {
    hidden: no
    type: time
    description: "The UTC timestamp when the event occurred. Used for ordering events within a session."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: trace_id {
    hidden: yes
    type: string
    description: "OpenTelemetry trace ID for distributed tracing across services."
    sql: ${TABLE}.trace_id ;;
  }
  dimension: user_id {
    hidden: no
    type: string
    description: "The identifier of the end-user participating in the session, if available."
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    hidden: no
    type: count
  }
}

view: manufacturing_agent_logs__content_parts {

  dimension: manufacturing_agent_logs__content_parts {
    type: string
    description: "For multi-modal events, contains a list of content parts (text, images, etc.)."
    hidden: yes
    sql: manufacturing_agent_logs__content_parts ;;
  }
  dimension: mime_type {
    hidden: yes
    type: string
    description: "The MIME type of the content part (e.g., 'text/plain', 'image/png')."
    sql: mime_type ;;
  }
  dimension: object_ref__authorizer {
    hidden: yes
    type: string
    description: "The authorizer for the object."
    sql: ${TABLE}.object_ref.authorizer ;;
    group_label: "Object Ref"
    group_item_label: "Authorizer"
  }
  dimension: object_ref__details {
    hidden: yes
    type: string
    description: "Additional details about the object."
    sql: ${TABLE}.object_ref.details ;;
    group_label: "Object Ref"
    group_item_label: "Details"
  }
  dimension: object_ref__uri {
    hidden: yes
    type: string
    description: "The URI of the object."
    sql: ${TABLE}.object_ref.uri ;;
    group_label: "Object Ref"
    group_item_label: "URI"
  }
  dimension: object_ref__version {
    hidden: yes
    type: string
    description: "The version of the object."
    sql: ${TABLE}.object_ref.version ;;
    group_label: "Object Ref"
    group_item_label: "Version"
  }
  dimension: part_attributes {
    hidden: yes
    type: string
    description: "Additional metadata for this content part as a JSON object (serialized to string)."
    sql: part_attributes ;;
  }
  dimension: part_index {
    hidden: yes
    type: number
    description: "The zero-based index of this part within the content."
    sql: part_index ;;
  }
  dimension: storage_mode {
    hidden: yes
    type: string
    description: "Indicates how the content part is stored (e.g., 'INLINE', 'GCS_REFERENCE', 'EXTERNAL_URI')."
    sql: storage_mode ;;
  }
  dimension: text {
    hidden: yes
    type: string
    description: "The raw text content if the part is text-based."
    sql: text ;;
  }
  dimension: uri {
    hidden: yes
    type: string
    description: "The URI of the content part if stored externally (e.g., GCS bucket path)."
    sql: uri ;;
  }
}
