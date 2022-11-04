with order2 as (
  select
  orders.customer_id as id,
  MIN(orders.created_at) as first_order_at,
  MAX(orders.created_at) as last_order_at,
  count(orders.id) as number_of_orders
  --putting a comment here
  FROM `analytics-engineers-club.coffee_shop.orders` AS orders
  group by 1
)

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  order2.first_order_at,
  order2.last_order_at,
  order2.number_of_orders as number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN order2 ON customers.id = order2.id
ORDER BY order2.first_order_at
limit 5;
