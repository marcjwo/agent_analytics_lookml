view: eval_results_detailed {
  sql_table_name: `agentic-cloud-demo.manufacturing_data.eval_results_detailed` ;;
  fields_hidden_by_default: yes

  dimension: agent_name {
    hidden: no
    type: string
    sql: ${TABLE}.agent_name ;;
  }
  dimension: completeness_explanation {
    hidden: no
    type: string
    sql: ${TABLE}.completeness_explanation ;;
  }
  dimension: completeness_score {
    hidden: no
    type: number
    sql: ${TABLE}.completeness_score ;;
  }
  dimension: display_name {
    hidden: no
    type: string
    sql: ${TABLE}.display_name ;;
  }
  dimension: factual_accuracy_explanation {
    hidden: no
    type: string
    sql: ${TABLE}.factual_accuracy_explanation ;;
  }
  dimension: factual_accuracy_score {
    hidden: no
    type: number
    sql: ${TABLE}.factual_accuracy_score ;;
  }
  dimension: predicted_trajectory {
    hidden: no
    type: string
    sql: ${TABLE}.predicted_trajectory ;;
  }
  dimension: prompt {
    hidden: no
    type: string
    sql: ${TABLE}.prompt ;;
  }
  dimension: reference {
    hidden: no
    type: string
    sql: ${TABLE}.reference ;;
  }
  dimension: response {
    hidden: no
    type: string
    sql: ${TABLE}.response ;;
  }
  dimension: trajectory_score {
    hidden: no
    type: number
    sql: ${TABLE}.trajectory_score ;;
  }
  measure: count {
    hidden: no
    type: count
    drill_fields: [agent_name, display_name]
  }
}
