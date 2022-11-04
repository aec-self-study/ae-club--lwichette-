with orders2 as (
  select
  orders.customer_id as id,
  MIN(orders.created_at) as first_order_at,
  count(orders.id) as number_of_orders
  FROM `analytics-engineers-club.coffee_shop.orders` AS orders
  group by 1
)

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  orders2.first_order_at,
  orders2.number_of_orders as number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN orders2 ON customers.id = orders2.id
ORDER BY orders2.first_order_at
limit 5;
