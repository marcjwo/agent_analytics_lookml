# If necessary, uncomment the line below to include explore_source.
# include: "agent_logs.explore.lkml"

# view: evals {
#   fields_hidden_by_default: yes
#   derived_table: {
#     explore_source: eval_results_detailed {
#       column: agent_name {}
#       column: average_accuracy {}
#     }
#   }
#   dimension: agent_name {
#     primary_key: yes
#     description: ""
#   }
#   dimension: average_accuracy {
#     description: ""
#     value_format: "#,##0.000"
#     type: number
#   }
#   measure: avg_accuracy {
#     hidden: no
#     type: average
#     sql: ${average_accuracy} ;;
#   }
# }
