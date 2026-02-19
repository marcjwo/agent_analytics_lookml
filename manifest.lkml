project_name: "agent_analytics"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }


constant: project_id {
  value: "nickorlove-demos"
}

constant: bq_dataset {
  value: "cymbal_bank"
}

constant: agent_log_table {
  value: "agent_events"
}
