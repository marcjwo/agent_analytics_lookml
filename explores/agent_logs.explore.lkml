include: "/views/refined/agent_logs.view.lkml"
include: "/views/refined/manufacturing_agent_logs.view.lkml"
include: "/views/refined/adk_threat_assessment.view.lkml"

# include: "/views/raw/eval_results_detailed.view.lkml"
include: "/views/refined/eval_results_detailed.view.lkml"
# include: "/views/raw/manufacturing_agent_logs.view.lkml"
include: "/views/derived/session_facts.view.lkml"
include: "/views/derived/evals.view.lkml"

explore: agent_logs {
  label: "Agent Logs"
}

explore: manufacturing_agent_logs {
  join: manufacturing_agent_logs__content_parts {
    view_label: "Manufacturing Agent Logs: Content Parts"
    sql: LEFT JOIN UNNEST(${manufacturing_agent_logs.content_parts}) as manufacturing_agent_logs__content_parts ;;
    relationship: one_to_many
  }
}
  # join: session_facts {
  #   sql_on: ${manufacturing_agent_logs.session_id} = ${session_facts.session_id} ;;
  #   relationship: many_to_one
  # }
  # join: evals {
  #   sql_on: ${manufacturing_agent_logs.agent} = ${evals.agent_name} ;;
  #   relationship: many_to_one
  # }

# explore: eval_results_detailed {
#   hidden: yes
# }

# explore: session_facts {}
