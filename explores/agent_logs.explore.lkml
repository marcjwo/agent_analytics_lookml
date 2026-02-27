include: "/views/refined/agent_logs.view.lkml"
include: "/views/refined/manufacturing_agent_logs.view.lkml"
include: "/views/refined/adk_threat_assessment.view.lkml"

# include: "/views/raw/eval_results_detailed.view.lkml"
include: "/views/refined/eval_results_detailed.view.lkml"
include: "/views/derived/customer_lookup.view.lkml" #temporary until i can add refined
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
  join: customer_lookup {
    view_label: "Customer Information"
    type: left_outer
    relationship: many_to_one
    sql_on: ${manufacturing_agent_logs.user_id} = ${customer_lookup.user_id} ;;

    # This keeps the connection "small" by only pulling in the customer_name
    fields: [customer_lookup.customer_name, customer_lookup.user_id]
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
