include: "/views/refined/agent_logs.view.lkml"
include: "/views/refined/manufacturing_agent_logs.view.lkml"
# include: "/views/raw/eval_results_detailed.view.lkml"
include: "/views/refined/eval_results_detailed.view.lkml"
# include: "/views/raw/manufacturing_agent_logs.view.lkml"

explore: agent_logs {
  label: "Agent Logs"
}

explore: manufacturing_agent_logs {
  hidden: yes
  join: manufacturing_agent_logs__content_parts {
    view_label: "Manufacturing Agent Logs: Content Parts"
    sql: LEFT JOIN UNNEST(${manufacturing_agent_logs.content_parts}) as manufacturing_agent_logs__content_parts ;;
    relationship: one_to_many
  }
}

explore: eval_results_detailed {

}
