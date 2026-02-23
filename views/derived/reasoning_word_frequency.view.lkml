view: reasoning_word_frequency {
  derived_table: {
    sql:
      SELECT
        session_id,
        CONCAT(session_id, '|', word) as primary_key,
        agent_decision,  -- Preserving the decision for filtering/pivoting
        word
      FROM `@{project_id}.@{bq_dataset}.@{adk_assessment_table}`,
      -- Logic: Strip punctuation, lowercase, split into array, then expand to rows
      UNNEST(SPLIT(LOWER(REGEXP_REPLACE(agent_reasoning, r'[^a-zA-Z ]', '')), ' ')) as word
      WHERE LENGTH(word) > 3
      -- Filter out 'noise' words that carry no meaning
      AND word NOT IN ('with', 'this', 'that', 'from', 'been', 'which', 'user', 'has', 'have', 'was', 'were')
    ;;
  }
  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.primary_key ;;
  }
  dimension: session_id {
    hidden: no
    type: string
    description: "A unique identifier for the entire conversation session. Used to group all events belonging to a single user interaction."
    sql: ${TABLE}.session_id ;;
  }

  dimension: agent_decision {
    type: string
    sql: ${TABLE}.agent_decision ;;
  }

  dimension: word {
    type: string
    sql: ${TABLE}.word ;;
  }

  measure: occurrence_count {
    type: count
  }
}

# view: reasoning_word_frequency {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
