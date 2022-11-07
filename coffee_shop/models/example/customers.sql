
with orders as (
  select
  orders.customer_id as id,
  MIN(orders.created_at) as first_order_at,
  MAX(orders.created_at) as last_order_at,
  count(orders.id) as number_of_orders
  FROM `analytics-engineers-club.coffee_shop.orders` AS orders
  group by 1
)

{{ config ( 
    materialized = 'table'
) }}

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  orders.first_order_at,
  orders.last_order_at,
  orders.number_of_orders as number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN orders ON customers.id = orders.id
ORDER BY orders.first_order_at