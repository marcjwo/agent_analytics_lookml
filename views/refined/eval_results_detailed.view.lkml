include: "/views/raw/eval_results_detailed.view.lkml"

view: +eval_results_detailed {
  fields_hidden_by_default: yes

  dimension: tools_json {
    hidden: no
    type: number
    sql: ARRAY_LENGTH(JSON_QUERY_ARRAY(${predicted_trajectory})) ;;
  }

  measure: average_accuracy {
    hidden: no
    type: average
    sql: ${factual_accuracy_score} ;;
    value_format_name: decimal_3
  }

  measure: average_completeness {
    hidden: no
    type: average
    sql: ${completeness_score} ;;
    value_format_name: decimal_3
  }

}
