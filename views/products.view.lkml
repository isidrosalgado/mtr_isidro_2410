view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    label: "brand"
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    label: "category"
    type: string
    # sql: ${TABLE}.category ;;
    sql: concat(${TABLE}.category," : ",${TABLE}.brand) ;;
    order_by_field: brand
    # html: <a title={{ products.rank._rendered_value }} > {{rendered_value }} </a> ;;
    link: {
      url: "https://gcpl244.cloud.looker.com/dashboards/83"
      label: "switch"
    }
    html: <button type="button" style="background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;">{{rendered_value }}</button> ;;
  }
  dimension: department {
    label: "dept"
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
