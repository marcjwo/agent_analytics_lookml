include: "/views/refined/adk_threat_assessment.view.lkml"

explore: adk_threat_assessment {
  hidden: yes
  join: adk_threat_assessment__behavior_anomalies {
    view_label: "Fraud Assessment: Behavior Anomalies"
    sql: LEFT JOIN UNNEST(`adk_threat_assessment.behavior_anomalies`}) as adk_threat_assessment__behavior_anomalies ;;
    relationship: one_to_many
  }
}
