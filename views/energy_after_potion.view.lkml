view: energy_after_potion {
  derived_table: {
    sql: SELECT
          countries.name  AS countries_name,
          energy_sources.country_id  AS energy_sources_country_id,
          COALESCE(SUM(CASE WHEN  countries.name   = "United States" then energy_sources.fossil_fuels /2 else energy_sources.fossil_fuels end ), 0) AS energy_sources_fossil_fuels,
          COALESCE(SUM(energy_sources.nuclear ), 0) AS energy_sources_nuclear,
          COALESCE(SUM(CASE WHEN  countries.name   = "United States" then energy_sources.renewable *2 else energy_sources.renewable end), 0) AS energy_sources_renewable
      FROM `htf2022-366706.sustainability.countries`
           AS countries
      INNER JOIN `htf2022-366706.sustainability.energy_sources`
           AS energy_sources ON countries.id = energy_sources.country_id
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC
      LIMIT 500
       ;;
  }

  dimension: countries_name {
    type: string
    sql: ${TABLE}.countries_name ;;
  }

  dimension: energy_sources_country_id {
    type: number
    sql: ${TABLE}.energy_sources_country_id ;;
  }

  dimension: energy_sources_fossil_fuels {
    type: number
    sql: ${TABLE}.energy_sources_fossil_fuels ;;
  }

  measure: energy_sources_fossil_fuel {
    label: "Fossil fuels"
    type: sum
    sql: ${TABLE}.energy_sources_fossil_fuels ;;
  }

  dimension: energy_sources_nuclear {
    label: "Nuclear"
    type: number
    sql: ${TABLE}.energy_sources_nuclear ;;
  }

  measure: energy_source_nuclear {
    label: "Nuclear"
    type: sum
    sql: ${TABLE}.energy_sources_nuclear ;;
  }

  dimension: energy_sources_renewable {
    label: "Renewable"
    type: number
    sql: ${TABLE}.energy_sources_renewable ;;
  }

  measure: energy_source_renewable {
    label: "Renewable"
    type: sum
    sql: ${TABLE}.energy_sources_renewable ;;
  }

  set: detail {
    fields: [countries_name, energy_sources_country_id, energy_sources_fossil_fuels, energy_sources_nuclear, energy_sources_renewable]
  }
}
