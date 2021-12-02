connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf2021_group1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

# dit is een comment

persist_with: htf2021_group1_default_datagroup

explore: aib_bnbs_nyc {}

explore: ages {}

explore: bnbcheckins {
  join: people {
    type:  left_outer
    sql_on:  ${bnbcheckins.person_id2} = ${people.id};;
    relationship: one_to_one
  }
}

explore: company_employees {}

explore: bnbreservations {
  join: people {
    type:  left_outer
    sql_on: ${bnbreservations.person_id} = ${people.id} ;;
    relationship: one_to_one
  }
}

explore: companies {}

explore: event_reviews {
  join: events {
    type: left_outer
    sql_on: ${event_reviews.event_id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: appearance {}

explore: nationalities {}

explore: events {}

explore: locations {}

explore: financial_status {
  join: people {
    type:  left_outer
    sql_on: ${financial_status.id} = ${people.id};;
    relationship: one_to_one
  }
}

explore: physical_characteristics {}

explore: people {}

explore: gender {}

explore: religions {}

explore: taxi_rides {
  join: taxis {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }
}

explore: ride_info {
  join: taxi_rides {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${ride_info.ride_id} ;;
    relationship: one_to_many
  }
}

explore: sub_departments {}

explore: roles {}

explore: taxis {}

explore: ride_passengers {
  join: people {
    type:  left_outer
    sql_on:  ${ride_passengers.passenger_id} = ${people.id} ;;
    relationship: many_to_one
  }
}
