connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf2021_group1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf2021_group1_default_datagroup

explore: aib_bnbs_nyc {
  join: bnbreservations {
    type:  left_outer
    sql_on: ${aib_bnbs_nyc.id} = ${bnbreservations.bnbid} ;;
    relationship: one_to_many
  }

  join: people{
    type: left_outer
    sql_on: ${bnbreservations.person_id} = ${people.id} ;;
    relationship: one_to_one
  }

  join: bnbcheckins {
    type:  left_outer
    sql_on: ${aib_bnbs_nyc.id} = ${bnbcheckins.bnb_id1} ;;
    relationship: one_to_many
  }
}

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

explore: companies {
  join: company_employees {
    type:  left_outer
    sql_on: ${companies.id} = ${company_employees.id} ;;
    relationship: one_to_one
  }
}

explore: event_reviews {
  join: events {
    type: left_outer
    sql_on: ${event_reviews.event_id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: appearance {}

explore: nationalities {}

explore: events {
  join: locations {
    type:  left_outer
    sql_on: ${events.id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: locations {}

explore: financial_status {}

explore: physical_characteristics {}

explore: people {
  join: ages {
    type:  left_outer
    sql_on: ${people.id} =${ages.id} ;;
    relationship: one_to_one
  }

  join: gender{
    type:  left_outer
    sql_on: ${people.id} = ${gender.id} ;;
    relationship: one_to_one
  }

  join: religions {
    type:  left_outer
    sql_on: ${people.id} = ${religions.id} ;;
    relationship: one_to_one
  }

  join: nationalities {
    type:  left_outer
    sql_on: ${people.id} = ${nationalities.id} ;;
    relationship: one_to_one
  }

  join: appearance {
    type:  left_outer
    sql_on: ${people.id} = ${appearance.id} ;;
    relationship: one_to_one
  }

  join: physical_characteristics {
    type:  left_outer
    sql_on: ${people.id} = ${physical_characteristics.id} ;;
    relationship: one_to_one
  }

  join: roles{
    type: left_outer
    sql_on: ${people.id} = ${roles.job_id} ;;
    relationship: one_to_one
  }
  join: companies {
    type: left_outer
    sql_on: ${people.id} = ${companies.id} ;;
    relationship: one_to_one
  }

  join: ride_info {
    type: left_outer
    sql_on: ${people.id} = ${ride_info.ride_id} ;;
    relationship: many_to_many
  }

  join: financial_status {
    type:  left_outer
    sql_on: ${people.id} = ${financial_status.id} ;;
    relationship: one_to_one
  }
}

explore: gender {}

explore: religions {}

explore: taxi_rides {}

explore: ride_info {
  join: taxi_rides {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${ride_info.ride_id} ;;
    relationship: one_to_many
  }
}

explore: sub_departments {}

explore: roles {}

explore: taxis {
  join: taxi_rides {
    type: left_outer
    sql_on: ${taxis.id} = ${taxi_rides.taxi_id} ;;
    relationship: one_to_many
  }
  join: ride_info {
    type: left_outer
    sql_on: ${taxi_rides.id} = ${ride_info.ride_id} ;;
    relationship: one_to_one
  }
  join: locations {
    type: left_outer
    sql_on: ${ride_info.dropoff_location} = ${locations.id} ;;
    relationship: one_to_one
  }
  join: events {
    type: left_outer
    sql_on: ${locations.id} = ${events.id} ;;
    relationship: one_to_one
  }
}

explore: ride_passengers {
  join: people {
    type:  left_outer
    sql_on:  ${ride_passengers.passenger_id} = ${people.id} ;;
    relationship: many_to_one
  }
  join: ride_info {
    type: left_outer
    sql_on: ${ride_passengers.ride_id} = ${ride_info.ride_id} ;;
    relationship: one_to_one
  }
  join: locations {
    type: left_outer
    sql_on: ${ride_info.dropoff_location} = ${locations.id} ;;
    relationship: one_to_one
  }
  join: events {
    type: left_outer
    sql_on: ${locations.id} = ${events.id} ;;
    relationship: one_to_one
  }
}
