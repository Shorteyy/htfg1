view: forest_coverage_mha {
  sql_table_name: `sustainability.forest_coverage_mha`
    ;;

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: disturbed {
    type: number
    sql: ${TABLE}.disturbed ;;
  }

  dimension: gain {
    type: number
    sql: ${TABLE}.gain ;;
  }

  dimension: loss {
    type: number
    sql: ${TABLE}.loss ;;
  }

  dimension: stable_forest {
    type: number
    sql: ${TABLE}.stable_forest ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
