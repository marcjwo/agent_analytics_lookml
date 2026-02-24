---
- dashboard: agent_analytics_operational_dashboard
  title: 'Agent Analytics: Operational Dashboard'
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: dvEeYJDVCqt4hMdtax3Zk1
  layout: newspaper
  elements:
  - title: ADK Fraud Detection Results
    name: adk_fraud_detection_line_chart
    model: agent_analytics
    explore: adk_threat_assessment
    type: looker_line
    fields: [adk_threat_assessment.event_timestamp_hour, adk_threat_assessment.agent_decision,
      adk_threat_assessment.count]
    pivots: [adk_threat_assessment.agent_decision]
    fill_fields: [adk_threat_assessment.event_timestamp_hour]
    filters:
      adk_threat_assessment.event_timestamp_hour: after 2026/02/10 12:00
    sorts: [adk_threat_assessment.agent_decision, adk_threat_assessment.event_timestamp_hour
      desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    row: 4
    col: 0
    width: 12
    height: 4
  - title: Agent Activity
    name: agent_activity
    model: agent_analytics
    explore: agent_logs
    type: looker_line
    fields: [agent_logs.invocation_count, agent_logs.timestamp_hour, agent_logs.agent]
    pivots: [agent_logs.agent]
    fill_fields: [agent_logs.timestamp_hour]
    filters:
    agent_logs.timestamp_hour: after 2026/02/10 12:00
    agent_logs.event_type: '"AGENT_STARTING"'
    sorts: [agent_logs.agent, agent_logs.timestamp_hour desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    defaults_version: 1
    series_colors:
      AGENT_STARTING - agent_logs.invocation_count: "#34A853"
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    font_size_main: ''
    orientation: auto
    groupBars: true
    labelSize: 10pt
    showLegend: true
    row: 0
    col: 0
    width: 12
    height: 4
  - title: Tool Usage by Agent
    name: Tool Usage by Agent
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: looker_column
    fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.tool_name, manufacturing_agent_logs.count]
    pivots: [manufacturing_agent_logs.tool_name]
    filters:
      manufacturing_agent_logs.tool_name: "-NULL"
    sorts: [manufacturing_agent_logs.agent, manufacturing_agent_logs.tool_name desc,
      manufacturing_agent_logs.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 11
    col: 12
    width: 12
    height: 8
  - title: Token Usage by Agent
    name: Token Usage by Agent
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: looker_column
    fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.sum_of_prompt_token,
      manufacturing_agent_logs.sum_of_completion_token, manufacturing_agent_logs.sum_of_all_token]
    filters:
      manufacturing_agent_logs.sum_of_all_token: ">0"
    sorts: [manufacturing_agent_logs.sum_of_prompt_token desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: [manufacturing_agent_logs.sum_of_all_token]
    defaults_version: 1
    row: 11
    col: 0
    width: 12
    height: 8
  - title: Tool Usage
    name: Tool Usage
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [manufacturing_agent_logs.distinct_tool_count, manufacturing_agent_logs.tool_count,
      manufacturing_agent_logs.error_count, manufacturing_agent_logs.failure_rate]
    filters:
      manufacturing_agent_logs.event_type: '"TOOL_COMPLETED","TOOL_ERROR"'
      manufacturing_agent_logs.distinct_tool_count: ">0"
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      manufacturing_agent_logs.sum_of_completion_token: Completion Token (Output)
      manufacturing_agent_logs.sum_of_prompt_token: Completion Token (Input)
    show_view_names: false
    font_size_main: '10'
    orientation: auto
    style_manufacturing_agent_logs.tool_count: "#34A853"
    show_title_manufacturing_agent_logs.tool_count: true
    title_placement_manufacturing_agent_logs.tool_count: above
    value_format_manufacturing_agent_logs.tool_count: ''
    style_manufacturing_agent_logs.error_count: "#DB4437"
    show_title_manufacturing_agent_logs.error_count: true
    title_placement_manufacturing_agent_logs.error_count: above
    value_format_manufacturing_agent_logs.error_count: ''
    show_comparison_manufacturing_agent_logs.error_count: false
    style_manufacturing_agent_logs.failure_rate: "#FBBC05"
    show_title_manufacturing_agent_logs.failure_rate: true
    title_placement_manufacturing_agent_logs.failure_rate: above
    value_format_manufacturing_agent_logs.failure_rate: ''
    show_comparison_manufacturing_agent_logs.failure_rate: false
    style_manufacturing_agent_logs.distinct_tool_count: "#4285F4"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      manufacturing_agent_logs.sum_of_prompt_token: "#4285F4"
      manufacturing_agent_logs.sum_of_completion_token: "#EA4335"
    hidden_pivots: {}
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_title_manufacturing_agent_logs.distinct_tool_count: true
    title_placement_manufacturing_agent_logs.distinct_tool_count: above
    value_format_manufacturing_agent_logs.distinct_tool_count: ''
    listen: {}
    row: 8
    col: 0
    width: 24
    height: 3
  - name: escalation_word_counts
    title: Escalation Word Cloud
    model: agent_analytics
    explore: adk_threat_assessment
    type: looker_wordcloud
    fields: [reasoning_word_frequency.word, reasoning_word_frequency.occurrence_count]
    filters:
      reasoning_word_frequency.word: "-transactions,-transaction,-travel,-impossible,-days,-alert"
      reasoning_word_frequency.agent_decision: '"ESCALATION_NEEDED"'
    sorts: [reasoning_word_frequency.occurrence_count desc 0]
    limit: 20
    column_limit: 50
    color_application: undefined
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 12
    width: 12
    height: 4
  - name: false_positive_word_counts
    title: "False Positive Word Cloud"
    model: agent_analytics
    explore: adk_threat_assessment
    type: looker_wordcloud
    fields: [reasoning_word_frequency.word, reasoning_word_frequency.occurrence_count]
    filters:
      reasoning_word_frequency.word: "-transactions,-transaction,-travel,-impossible,-days,-alert"
      reasoning_word_frequency.agent_decision: '"ESCALATION_NEEDED"'
    sorts: [reasoning_word_frequency.occurrence_count desc 0]
    limit: 20
    column_limit: 50
    color_application: undefined
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 12
    width: 12
    height: 4

  # - title: Agent Usage
  #   name: Agent Usage
  #   explore: manufacturing_agent_logs
  #   type: looker_bar
  #   fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.count]
  #   filters:
  #     manufacturing_agent_logs.count: ">0"
  #   sorts: [manufacturing_agent_logs.count desc]
  #   limit: 500
  #   column_limit: 50
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: false
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_label: false
  #   show_x_axis_ticks: true
  #   y_axis_scale_mode: linear
  #   x_axis_reversed: false
  #   y_axis_reversed: false
  #   plot_size_by_field: false
  #   trellis: ''
  #   stacking: ''
  #   limit_displayed_rows: false
  #   legend_position: center
  #   point_style: none
  #   show_value_labels: false
  #   label_density: 25
  #   x_axis_scale: auto
  #   y_axis_combined: true
  #   ordering: none
  #   show_null_labels: false
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   show_null_points: true
  #   interpolation: linear
  #   y_axes: [{label: '', orientation: left, series: [{axisId: manufacturing_agent_logs.count,
  #           id: assistant_agent - manufacturing_agent_logs.count, name: assistant_agent,
  #           __FILE: agent_analytics/dashboards/agent_analytics_operational_dashboard.dashboard.lookml,
  #           __LINE_NUM: 340}, {axisId: manufacturing_agent_logs.count, id: baseline_agent
  #             - manufacturing_agent_logs.count, name: baseline_agent, __FILE: agent_analytics/dashboards/agent_analytics_operational_dashboard.dashboard.lookml,
  #           __LINE_NUM: 342}, {axisId: manufacturing_agent_logs.count, id: gql_agent_3_flash
  #             - manufacturing_agent_logs.count, name: gql_agent_3_flash, __FILE: agent_analytics/dashboards/agent_analytics_operational_dashboard.dashboard.lookml,
  #           __LINE_NUM: 343}], showLabels: false, showValues: true, unpinAxis: false,
  #       tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: agent_analytics/dashboards/agent_analytics_operational_dashboard.dashboard.lookml,
  #       __LINE_NUM: 340}]
  #   x_axis_zoom: true
  #   y_axis_zoom: true
  #   hidden_pivots: {}
  #   custom_color_enabled: true
  #   show_single_value_title: true
  #   show_comparison: false
  #   comparison_type: value
  #   comparison_reverse_colors: false
  #   show_comparison_label: true
  #   enable_conditional_formatting: false
  #   conditional_formatting_include_totals: false
  #   conditional_formatting_include_nulls: false
  #   defaults_version: 1
  #   listen: {}
  #   row: 0
  #   col: 12
  #   width: 12
  #   height: 8
    # model: agent_analytics
    # explore: manufacturing_agent_logs
    # type: looker_area
    # fields: [manufacturing_agent_logs.count, manufacturing_agent_logs.timestamp_hour2,
    #   manufacturing_agent_logs.agent]
    # filters:
    #   manufacturing_agent_logs.count: ">0"
    # pivots: [manufacturing_agent_logs.agent]
    # sorts: [manufacturing_agent_logs.agent, manufacturing_agent_logs.timestamp_hour2
    #     desc]
    # limit: 500
    # column_limit: 50
    # x_axis_gridlines: false
    # y_axis_gridlines: true
    # show_view_names: false
    # show_y_axis_labels: true
    # show_y_axis_ticks: true
    # y_axis_tick_density: default
    # y_axis_tick_density_custom: 5
    # show_x_axis_label: false
    # show_x_axis_ticks: true
    # y_axis_scale_mode: linear
    # x_axis_reversed: false
    # y_axis_reversed: false
    # plot_size_by_field: false
    # trellis: ''
    # stacking: ''
    # limit_displayed_rows: false
    # legend_position: center
    # point_style: none
    # show_value_labels: false
    # label_density: 25
    # x_axis_scale: auto
    # y_axis_combined: true
    # show_null_points: true
    # interpolation: linear
    # show_totals_labels: false
    # show_silhouette: false
    # totals_color: "#808080"
    # y_axes: [{label: '', orientation: left, series: [{axisId: manufacturing_agent_logs.count,
    #         id: assistant_agent - manufacturing_agent_logs.count, name: assistant_agent},
    #       {axisId: manufacturing_agent_logs.count, id: baseline_agent - manufacturing_agent_logs.count,
    #         name: baseline_agent}, {axisId: manufacturing_agent_logs.count, id: gql_agent_3_flash
    #           - manufacturing_agent_logs.count, name: gql_agent_3_flash}], showLabels: false,
    #     showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
    #     type: linear}]
    # x_axis_zoom: true
    # y_axis_zoom: true
    # # advanced_vis_config: |-
    # #   {
    # #     "chart": {
    # #       "backgroundColor": "rgba(0, 0, 0, 0)",
    # #       "inverted": false,
    # #       "style": {
    # #         "fontFamily": "inherit",
    # #         "fontSize": "12px"
    # #       },
    # #       "type": "area"
    # #     },
    # #     "series": [{
    #         "color": "#EA4335",
    #         "id": "baseline_agent - manufacturing_agent_logs.count",
    #         "name": "baseline_agent",
    #         "type": "area",
    #         "visible": true
    #       },
    #       {
    #         "color": "#4285F4",
    #         "id": "knowledge_agent - manufacturing_agent_logs.count",
    #         "name": "knowledge_agent",
    #         "type": "area",
    #         "visible": true
    #       }
    #     ],
    #     "xAxis": {
    #       "type": "datetime"
    #     },
    #     "yAxis": [{
    #       "type": "linear"
    #     }],
    #     "legend": {
    #       "align": "center",
    #       "verticalAlign": "top",
    #       "enabled": true
    #     }
    #   }
  # - title: 'Session Analysis: Duration'
  #   name: 'Session Analysis: Duration'
  #   model: agent_analytics
  #   explore: manufacturing_agent_logs
  #   type: looker_column
  #   fields: [session_facts.duration_bin, manufacturing_agent_logs.count, session_facts.average_user_turns,
  #     manufacturing_agent_logs.agent]
  #   pivots: [manufacturing_agent_logs.agent]
  #   sorts: [manufacturing_agent_logs.agent]
  #   limit: 500
  #   column_limit: 50
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: false
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_label: false
  #   show_x_axis_ticks: true
  #   y_axis_scale_mode: linear
  #   x_axis_reversed: false
  #   y_axis_reversed: false
  #   plot_size_by_field: false
  #   trellis: ''
  #   stacking: ''
  #   limit_displayed_rows: false
  #   legend_position: center
  #   point_style: none
  #   show_value_labels: false
  #   label_density: 25
  #   x_axis_scale: auto
  #   y_axis_combined: true
  #   ordering: none
  #   show_null_labels: false
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   y_axes: [{label: '', orientation: left, series: [{axisId: manufacturing_agent_logs.count,
  #           id: manufacturing_agent_logs.count, name: Total Sessions}], showLabels: false,
  #       showValues: true, valueFormat: '#,##0.0,"k"', unpinAxis: false, tickDensity: default,
  #       tickDensityCustom: 5, type: linear}]
  #   x_axis_zoom: true
  #   y_axis_zoom: true
  #   series_types:
  #     session_facts.average_user_turns: line
  #   series_colors:
  #     manufacturing_agent_logs.count: "#4285F4"
  #     session_facts.average_user_turns: "#FBBC04"
  #   series_labels:
  #     manufacturing_agent_logs.count: Total Sessions
  #     session_facts.average_user_turns: Avg User Turns
  #   advanced_vis_config: |-
  #     {
  #       chart: {},
  #       series: [{
  #         name: 'baseline_agent'
  #       }, {
  #         name: 'knowledge_agent'
  #       }],
  #       "legend": {
  #         "align": "center",
  #         "verticalAlign": "top",
  #         "enabled": true
  #       }
  #     }
  #   defaults_version: 1
  #   hidden_fields: [session_facts.average_user_turns]
  #   hidden_pivots: {}
  #   listen: {}
  #   row: 10
  #   col: 0
  #   width: 12
  #   height: 5
  # - title: Agent Latency
  #   name: Agent Latency
  #   model: agent_analytics
  #   explore: manufacturing_agent_logs
  #   type: looker_column
  #   fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.average_latency,
  #     evals.avg_accuracy]
  #   sorts: [manufacturing_agent_logs.agent]
  #   limit: 500
  #   column_limit: 50
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: false
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_label: false
  #   show_x_axis_ticks: true
  #   y_axis_scale_mode: linear
  #   x_axis_reversed: false
  #   y_axis_reversed: false
  #   plot_size_by_field: false
  #   trellis: ''
  #   stacking: ''
  #   limit_displayed_rows: false
  #   legend_position: center
  #   point_style: circle
  #   show_value_labels: false
  #   label_density: 25
  #   x_axis_scale: auto
  #   y_axis_combined: true
  #   ordering: none
  #   show_null_labels: false
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   y_axes: [{label: Average Latency in seconds, orientation: left, series: [{axisId: manufacturing_agent_logs.average_latency,
  #           id: manufacturing_agent_logs.average_latency, name: Avg Latency (ms)}],
  #       showLabels: true, showValues: true, valueFormat: "#,", unpinAxis: false, tickDensity: default,
  #       tickDensityCustom: 5, type: linear}]
  #   x_axis_zoom: true
  #   y_axis_zoom: true
  #   series_colors:
  #     evals.avg_accuracy: "#4285F4"
  #     manufacturing_agent_logs.average_latency: "#4285F4"
  #   series_labels:
  #     manufacturing_agent_logs.average_latency: Avg Latency (ms)
  #   series_point_styles:
  #     manufacturing_agent_logs.average_latency: auto
  #   advanced_vis_config: |-
  #     {
  #       chart: {},
  #       series: [{
  #           formatters: [{
  #             select: 'name = baseline_agent',
  #             style: {
  #               color: '#DB4437'
  #             }
  #           }]
  #         },
  #         {
  #           name: 'Avg Latency (ms)'
  #         }
  #       ],
  #       "legend": {
  #         "itemStyle": {
  #           "fontSize": "8pt"
  #         },
  #         "itemDistance": 1
  #       }
  #     }
  #   defaults_version: 1
  #   hidden_fields: [evals.avg_accuracy]
  #   listen: {}
  #   row: 0
  #   col: 0
  #   width: 6
  #   height: 7
  # - title: Agent Accuracy
  #   name: Agent Accuracy
  #   model: agent_analytics
  #   explore: manufacturing_agent_logs
  #   type: looker_column
  #   fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.average_latency,
  #     evals.avg_accuracy]
  #   sorts: [manufacturing_agent_logs.agent]
  #   limit: 500
  #   column_limit: 50
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: false
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_label: false
  #   show_x_axis_ticks: true
  #   y_axis_scale_mode: linear
  #   x_axis_reversed: false
  #   y_axis_reversed: false
  #   plot_size_by_field: false
  #   trellis: ''
  #   stacking: ''
  #   limit_displayed_rows: false
  #   legend_position: center
  #   point_style: circle
  #   show_value_labels: false
  #   label_density: 25
  #   x_axis_scale: auto
  #   y_axis_combined: true
  #   ordering: none
  #   show_null_labels: false
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   y_axes: [{label: '', orientation: left, series: [{axisId: evals.avg_accuracy,
  #           id: evals.avg_accuracy, name: Avg Accuracy}], showLabels: true, showValues: true,
  #       unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
  #     {label: !!null '', orientation: right, series: [{axisId: manufacturing_agent_logs.average_latency,
  #           id: manufacturing_agent_logs.average_latency, name: Average latency in
  #             ms}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
  #       tickDensityCustom: 5, type: linear}]
  #   x_axis_zoom: true
  #   y_axis_zoom: true
  #   series_types:
  #     manufacturing_agent_logs.average_latency: scatter
  #   series_colors:
  #     evals.avg_accuracy: "#4285F4"
  #     manufacturing_agent_logs.average_latency: "#EA4335"
  #   series_labels:
  #     manufacturing_agent_logs.average_latency: Avg Latency (ms)
  #   series_point_styles:
  #     manufacturing_agent_logs.average_latency: auto
  #   advanced_vis_config: |-
  #     {
  #       chart: {},
  #       series: [
  #       {
  #         formatters: [{
  #           select: 'name = baseline_agent',
  #           style: {
  #             color: '#DB4437'
  #           }
  #         }]
  #       },
  #       {
  #         name: 'Avg Accuracy'
  #       }]
  #     }
  #   defaults_version: 1
  #   hidden_fields: [manufacturing_agent_logs.average_latency]
  #   listen: {}
  #   row: 0
  #   col: 12
  #   width: 6
  #   height: 7
