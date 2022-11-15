view: forest_after_potion {
  derived_table: {
    sql: SELECT
          countries.name  AS countries_name,
          countries.id  AS countries_id,
          COALESCE(SUM(CASE WHEN  countries.name   = "United States" then forest_coverage_mha.loss /2 else forest_coverage_mha.loss end ), 0) AS forest_coverage_mha_loss,
          COALESCE(SUM(forest_coverage_mha.stable_forest ), 0) AS forest_coverage_mha_stable_forest,
          COALESCE(SUM(CASE WHEN  countries.name   = "United States" then forest_coverage_mha.gain *2 else forest_coverage_mha.gain end ), 0) AS forest_coverage_mha_gain,
          COALESCE(SUM(forest_coverage_mha.disturbed ), 0) AS forest_coverage_mha_disturbed
      FROM `htf2022-366706.sustainability.countries`
           AS countries
      INNER JOIN `htf2022-366706.sustainability.forest_coverage_mha`
           AS forest_coverage_mha ON countries.id = forest_coverage_mha.country_id
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: countries_name {
    type: string
    sql: ${TABLE}.countries_name ;;
  }

  dimension: countries_id {
    type: number
    sql: ${TABLE}.countries_id ;;
  }

  dimension: forest_coverage_mha_loss {
    type: number
    sql: ${TABLE}.forest_coverage_mha_loss ;;
  }

  measure: forest_coverage_mha_los {
    label: "Loss"
    type: sum
    sql: ${TABLE}.forest_coverage_mha_loss ;;
  }

  dimension: forest_coverage_mha_stable_forest {
    type: number
    sql: ${TABLE}.forest_coverage_mha_stable_forest ;;
  }

  measure: forest_coverage_mha_stable_forests {
    label: "Stable forest"
    type: sum
    sql: ${TABLE}.forest_coverage_mha_stable_forest ;;
  }

  dimension: forest_coverage_mha_gain {
    type: number
    sql: ${TABLE}.forest_coverage_mha_gain ;;
  }

  measure: forest_coverage_mha_gains {
    label: "Gain"
    type: sum
    sql: ${TABLE}.forest_coverage_mha_gain ;;
  }

  dimension: forest_coverage_mha_disturbed {
    type: number
    sql: ${TABLE}.forest_coverage_mha_disturbed ;;
  }

  measure: forest_coverage_mha_disturbeds {
    label: "Disturbed"
    type: sum
    sql: ${TABLE}.forest_coverage_mha_disturbed ;;
  }

  set: detail {
    fields: [countries_name, forest_coverage_mha_loss, forest_coverage_mha_stable_forest, forest_coverage_mha_gain, forest_coverage_mha_disturbed]
  }
}
