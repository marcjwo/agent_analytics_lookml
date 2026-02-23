include: "/views/raw/adk_threat_assessment.view.lkml"

view: +adk_threat_assessment {

    dimension: severity_score {
      type: number
      sql:
      CASE
        WHEN ${agent_decision} = 'ESCALATION_NEEDED' THEN 2
        WHEN ${agent_decision} = 'FALSE_POSITIVE' THEN 1
        ELSE 0
      END ;;
    }

    measure: max_fraud_severity {
      label: "Fraud Severity"
      description: "count of alert level: 2=Fraud Alert, 1=False Positive, 0=Clear"
      type: max
      sql: COALESCE(${severity_score}, 0) ;;
    }
}
