---
- dashboard: agent_analytics_operational_dashboard
  title: 'Agent Analytics: Operational Dashboard'
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: dvEeYJDVCqt4hMdtax3Zk1
  layout: newspaper
  elements:
  - title: Tool Usage by Agent
    name: Tool Usage by Agent
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: looker_column
    fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.count, manufacturing_agent_logs.tool_name]
    pivots: [manufacturing_agent_logs.tool_name]
    filters:
      manufacturing_agent_logs.tool_name: "-NULL"
    sorts: [manufacturing_agent_logs.tool_name, manufacturing_agent_logs.agent]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: execute_sql - manufacturing_agent_logs.count,
            id: execute_sql - manufacturing_agent_logs.count, name: execute_sql},
          {axisId: get_table_info - manufacturing_agent_logs.count, id: get_table_info
              - manufacturing_agent_logs.count, name: get_table_info}, {axisId: list_table_ids
              - manufacturing_agent_logs.count, id: list_table_ids - manufacturing_agent_logs.count,
            name: list_table_ids}, {axisId: search_places - manufacturing_agent_logs.count,
            id: search_places - manufacturing_agent_logs.count, name: search_places}],
        showLabels: false, showValues: true, valueFormat: '#,##0.0,"k"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    advanced_vis_config: |-
      {
        chart: {},
        series: [{
          name: 'execute_sql',
          formatters: [{
            select: 'name = baseline_agent',
              style: {
                color: '#E67368'
              },
          },
          {
            select: 'name = knowledge_agent',
              style: {
                color: '#6EA1F7'
              },
          }]
        }, {
          name: 'get_table_info',
          formatters: [{
            select: 'name = baseline_agent',
              style: {
                color: '#DB4437'
              },
          },
          {
            select: 'name = knowledge_agent',
              style: {
                color: '#4285F4'
              },
          }]
        }, {
          name: 'list_table_ids',
          formatters: [{
            select: 'name = baseline_agent',
              style: {
                color: '#B53225'
              },
          },
          {
            select: 'name = knowledge_agent',
              style: {
                color: '#3266D5'
              },
          }]
        }, {
          name: 'search_places',
          formatters: [{
            select: 'name = baseline_agent',
              style: {
                color: '#8F2116'
              },
          },
          {
            select: 'name = knowledge_agent',
              style: {
                color: '#254CB6'
              },
          }]
        }]
      }
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 7
  - title: Token Usage by Agent
    name: Token Usage by Agent
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: looker_column
    fields: [manufacturing_agent_logs.agent, manufacturing_agent_logs.sum_of_prompt_token,
      manufacturing_agent_logs.sum_of_completion_token]
    sorts: [manufacturing_agent_logs.agent]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: manufacturing_agent_logs.sum_of_completion_token,
            id: manufacturing_agent_logs.sum_of_completion_token, name: Total completion
              token}, {axisId: manufacturing_agent_logs.sum_of_prompt_token, id: manufacturing_agent_logs.sum_of_prompt_token,
            name: Total prompt token}], showLabels: false, showValues: true, valueFormat: '#,##0.0,,"M"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    label_value_format: '[<20000]#,##0.0,"k output token";#,##0.0,"k input token"'
    series_colors:
      manufacturing_agent_logs.count: "#4285F4"
      manufacturing_agent_logs.user_count: "#EA4335"
      manufacturing_agent_logs.sum_of_prompt_token: "#4285F4"
      manufacturing_agent_logs.sum_of_candidate_token: "#EA4335"
    series_labels:
      manufacturing_agent_logs.count: Agent Uses
      manufacturing_agent_logs.user_count: Distinct Agent Users
    label_color: [grey]
    advanced_vis_config: |-
      {
        "chart": {
          "backgroundColor": "rgba(0, 0, 0, 0)",
          "inverted": false,
          "style": {
            "fontFamily": "inherit",
            "fontSize": "12px"
          },
          "type": "column"
        },
        "series": [{
            "color": "#4285F4",
            "id": "manufacturing_agent_logs.sum_of_prompt_token",
            "name": "Total prompt token",
            formatters: [{
                select: 'name = baseline_agent',
                style: {
                  color: '#E67368'
                }
              },
              {
                select: 'name = knowledge_agent',
                style: {
                  color: '#6EA1F7'
                }
              }
            ],
            "type": "column",
            "visible": true
          },
          {
            "color": "#EA4335",
            "id": "manufacturing_agent_logs.sum_of_candidate_token",
            "name": "Total candidate token",
            formatters: [{
                select: 'name = baseline_agent',
                style: {
                  color: '#DB4437'
                }
              },
              {
                select: 'name = knowledge_agent',
                style: {
                  color: '#4285F4'
                }
              }
            ],
            "type": "column",
            "visible": true
          }
        ],
        "xAxis": {
          "type": "category"
        },
        "yAxis": [{
          "type": "linear"
        }],
        "legend": {
          "align": "center",
          "verticalAlign": "top",
          "itemStyle": {
            "fontSize": "8pt"
          }
        }
      }
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 7
  - title: Tool Usage
    name: Tool Usage
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [manufacturing_agent_logs.distinct_tool_count, manufacturing_agent_logs.tool_count,
      manufacturing_agent_logs.error_count, manufacturing_agent_logs.failure_rate]
    filters:
      manufacturing_agent_logs.event_type: '"TOOL_COMPLETED","TOOL_ERROR"'
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
    row: 7
    col: 0
    width: 24
    height: 3
  - title: Agent Usage
    name: Agent Usage
    model: agent_analytics
    explore: manufacturing_agent_logs
    type: looker_area
    fields: [manufacturing_agent_logs.count, manufacturing_agent_logs.timestamp_hour2,
      manufacturing_agent_logs.agent]
    pivots: [manufacturing_agent_logs.agent]
    sorts: [manufacturing_agent_logs.agent, manufacturing_agent_logs.timestamp_hour2
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
    show_x_axis_label: false
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: manufacturing_agent_logs.count,
            id: assistant_agent - manufacturing_agent_logs.count, name: assistant_agent},
          {axisId: manufacturing_agent_logs.count, id: baseline_agent - manufacturing_agent_logs.count,
            name: baseline_agent}, {axisId: manufacturing_agent_logs.count, id: gql_agent_3_flash
              - manufacturing_agent_logs.count, name: gql_agent_3_flash}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    advanced_vis_config: |-
      {
        "chart": {
          "backgroundColor": "rgba(0, 0, 0, 0)",
          "inverted": false,
          "style": {
            "fontFamily": "inherit",
            "fontSize": "12px"
          },
          "type": "area"
        },
        "series": [{
            "color": "#EA4335",
            "id": "baseline_agent - manufacturing_agent_logs.count",
            "name": "baseline_agent",
            "type": "area",
            "visible": true
          },
          {
            "color": "#4285F4",
            "id": "knowledge_agent - manufacturing_agent_logs.count",
            "name": "knowledge_agent",
            "type": "area",
            "visible": true
          }
        ],
        "xAxis": {
          "type": "datetime"
        },
        "yAxis": [{
          "type": "linear"
        }],
        "legend": {
          "align": "center",
          "verticalAlign": "top",
          "enabled": true
        }
      }
    hidden_pivots: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 5
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
