include: "/views/raw/adk_threat_assessment.view.lkml"
include: "/views/raw/public_cymbal_bank_transactions.view.lkml"

explore: adk_threat_assessment {
  label: "Threat Assessment"
  # hidden: yes
  join: adk_threat_assessment__behavior_anomalies {
    view_label: "Threat Assessment: Behavior Anomolies"
    fields: []
    sql: LEFT JOIN UNNEST(${adk_threat_assessment.behavior_anomalies}) as adk_threat_assessment__behavior_anomalies ;;
    relationship: one_to_many
  }
}

explore: public_cymbal_bank_transactions {
  hidden: yes
  join: public_cymbal_bank_transactions__datastream_metadata__sort_keys {
    view_label: "Public Cymbal Bank Transactions: Datastream Metadata Sort Keys"
    fields: []
    sql: LEFT JOIN UNNEST(${public_cymbal_bank_transactions.datastream_metadata__sort_keys}) as public_cymbal_bank_transactions__datastream_metadata__sort_keys ;;
    relationship: one_to_many
  }
}
