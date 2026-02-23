connection: "default_bigquery_connection"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/explores/agent_logs.explore.lkml"
include: "/views/derived/session_facts.view.lkml"
include: "/explores/adk_threat_assessment.explore.lkml"
include: "/dashboards/agent_analytics_operational_dashboard.dashboard.lookml"

explore: agent_performance_timeline {
  from: manufacturing_agent_logs
  join: session_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${agent_performance_timeline.session_id} = ${session_facts.session_id} ;;
  }
}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
