connection: "htf2022bq"

include: "/views/**/*.view"
include: "/explores/**/*.*"

datagroup: htf2022_group1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2022_group1_default_datagroup
