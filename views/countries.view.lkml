view: countries {
  sql_table_name: `sustainability.countries`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: leader_name {
    type: string
    sql: ${TABLE}.leader_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, leader_name, name]
  }
}
