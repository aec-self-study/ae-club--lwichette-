with order as (
  select
  orders.customer_id as id,
  min(orders.created_at) as first_order_at,
  MAX(orders.created_at) as last_order_at,
  count(orders.id) as number_of_orders
  FROM `analytics-engineers-club.coffee_shop.orders` AS orders
  group by 1
)

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  order.first_order_at,
  order.last_order_at,
  order.number_of_orders as number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN order ON customers.id = order.id
ORDER BY order.first_order_at
limit 5;
