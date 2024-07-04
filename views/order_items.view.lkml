view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }

  dimension: order_id {
    type: string
    label: "label1"
    case: {
      when: {
        sql: ${TABLE}.order_id is null ;;
        label: "label7"

      }
      when: {
        sql: ${TABLE}.order_id <= 100;;
        label: "label2"
      }
      when: {
        label: "label3"
        sql: ${TABLE}.order_id <= 200 ;;
      }
      when: {
        label: "label4"
        sql: ${TABLE}.order_id <= 300 ;;
      }
      when: {
        label: "label5"
        sql: ${TABLE}.order_id<= 400 ;;
      }
      when: {
        label: "label6"
        sql: ${TABLE}.order_id <= 500 ;;
      }
      else: "Greater than 5 years"
    }
  }
}
