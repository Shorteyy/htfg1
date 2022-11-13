connection: "htf2022bq"

# include all the views
include: "/views/**/*.view"

datagroup: htf2022_group1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2022_group1_default_datagroup

explore: countries {}

explore: energy_sources {}

explore: generated_waste {}

explore: co2_emissions {}

explore: forest_coverage_mha {}

explore: magic_potions {}
