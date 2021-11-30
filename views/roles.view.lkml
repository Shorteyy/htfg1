view: roles {
  sql_table_name: `datasources.Roles`
    ;;

  dimension: job_description {
    type: string
    sql: ${TABLE}.JobDescription ;;
  }

  dimension: job_id {
    type: number
    sql: ${TABLE}.JobID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
