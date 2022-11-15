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
  join: forest_coverage_mha {
    sql_on: ${countries.id} = ${forest_coverage_mha.country_id} ;;
    relationship: one_to_many
    type: inner
  }
  join: generated_waste {
    sql_on: ${countries.id} = ${generated_waste.country_id} ;;
    relationship: one_to_many
    type: inner
  }
  join: magic_potions {
    sql_on: ${countries.name} = ${magic_potions.name} ;;
    relationship: one_to_many
    type: cross
  }
  join: energy_after_potion {
    sql_on: ${countries.name} = ${energy_after_potion.countries_name};;
    relationship: one_to_many
    type: inner
  }
  join: forest_after_potion {
    sql_on: ${countries.id} = ${forest_after_potion.countries_id};;
    relationship: one_to_many
    type: inner
  }



}
