# If necessary, uncomment the line below to include explore_source.
# include: "agent_logs.explore.lkml"

view: session_facts {
  fields_hidden_by_default: yes
  derived_table: {
    explore_source: manufacturing_agent_logs {
      column: session_id {}
      column: agent {}
      column: max_timestamp {}
      column: min_timestamp {}
      column: user_turns_count {}
      column: session_duration {}
    }
  }
  dimension: session_id {
    primary_key: yes
    description: "A unique identifier for the entire conversation session. Used to group all events belonging to a single user interaction."
  }
  dimension: agent {
    hidden: no
    type: string
    sql: ${TABLE}.agent ;;
  }
  dimension: max_timestamp {
    description: ""
    type: number
  }
  dimension: min_timestamp {
    description: ""
    type: number
  }
  dimension_group: session_start {
    hidden: no
    type: time
    timeframes: [raw, time, date, minute]
    sql: ${TABLE}.min_timestamp;;
  }
  dimension_group: session_end {
    hidden: no
    type: time
    timeframes: [raw, time, date, minute]
    sql:${TABLE}.max_timestamp ;;
  }
  dimension: user_turns_count {
    description: ""
    type: number
  }
  dimension: session_duration {
    description: ""
    type: number
  }

  dimension: duration_bin {
    hidden: no
    type: tier
    tiers: [10,60,300]
    style: integer
    sql: ${session_duration} ;;
    value_format: "#,##0s"
  }

  measure: average_user_turns {
    hidden: no
    type: average
    sql: ${user_turns_count} ;;
    value_format_name: decimal_2
  }
}
