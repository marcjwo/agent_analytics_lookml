include: "/views/refined/adk_threat_assessment.view.lkml"
include: "/views/derived/reasoning_word_frequency.view.lkml"

explore: adk_threat_assessment {
  label: "Threat Assessment"
  # hidden: yes
  join: adk_threat_assessment__behavior_anomalies {
    view_label: "Threat Assessment: Behavior Anomolies"
    fields: []
    sql: LEFT JOIN UNNEST(${adk_threat_assessment.behavior_anomalies}) as adk_threat_assessment__behavior_anomalies ;;
    relationship: one_to_many
  }
  join: reasoning_word_frequency {
    type: left_outer
    relationship: one_to_many
    # We join on session_id so the words stay linked to the specific event
    sql_on: ${adk_threat_assessment.session_id} = ${reasoning_word_frequency.session_id} ;;
  }
}
