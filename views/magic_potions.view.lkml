view: magic_potions {
  sql_table_name: `sustainability.magic_potions`
    ;;

  dimension: boost {
    type: string
    sql: ${TABLE}.boost ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: n {
    type: number
    sql: ${TABLE}.n ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
