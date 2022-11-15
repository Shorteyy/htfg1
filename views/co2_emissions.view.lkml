view: co2_emissions {
  sql_table_name: `sustainability.co2_emissions`
    ;;

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: metricton_per_citizen {
    type: number
    sql: ${TABLE}.metricton_per_citizen ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: emissionPerYearFrance {
    type: sum
    drill_fields: []
    sql: ${TABLE}.metricton_per_citizen ;;
    filters: [countries.name: "France"]
  }

  measure: emissionPerYearFinland {
    type: sum
    drill_fields: []
    sql: ${TABLE}.metricton_per_citizen ;;
    filters: [countries.name: "Finland"]
  }

  measure: emissionPerYearRussia {
    type: sum
    drill_fields: []
    sql: ${TABLE}.metricton_per_citizen ;;
    filters: [countries.name: "Russia"]
  }

  measure: emissionPerYearUS {
    type: sum
    drill_fields: []
    sql: ${TABLE}.metricton_per_citizen ;;
    filters: [countries.name: "United States"]
  }

  measure: emissionPerYearCanada {
    type: sum
    drill_fields: []
    sql: ${TABLE}.metricton_per_citizen ;;
    filters: [countries.name: "Canada"]
  }

}
