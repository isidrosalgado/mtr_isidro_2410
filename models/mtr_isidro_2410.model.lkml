connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: mtr_isidro_2410_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mtr_isidro_2410_default_datagroup



explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}





explore: five_zeros {
  view_name: five_zeros
}

explore: products {}

explore: viet {}
explore: persons2 {}
explore: persons {}
explore: test {}
explore: sample_data {}
