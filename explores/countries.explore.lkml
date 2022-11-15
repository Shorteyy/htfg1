include: "/views/**/*.view"

explore: countries {
  join: co2_emissions {
    sql_on: ${countries.id} = ${co2_emissions.country_id} ;;
    relationship: one_to_many
    type: inner
  }
  join: energy_sources {
    sql_on: ${countries.id} = ${energy_sources.country_id} ;;
    relationship: one_to_many
    type: inner
  }

}
