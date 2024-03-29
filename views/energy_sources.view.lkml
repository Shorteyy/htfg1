view: energy_sources {
  sql_table_name: `sustainability.energy_sources`
    ;;

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: fossil_fuels {
    type: number
    sql: ${TABLE}.fossil_fuels ;;
  }

  dimension: nuclear {
    type: number
    sql: ${TABLE}.nuclear ;;
  }

  dimension: renewable {
    type: number
    sql: ${TABLE}.renewable ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: renewable_ {
    type: sum
    sql: ${renewable} ;;
  }

  measure: fossil_ {
    type: sum
    sql: ${fossil_fuels} ;;
  }

  measure: nuclear_ {
    type: sum
    sql: ${nuclear} ;;
  }
}
