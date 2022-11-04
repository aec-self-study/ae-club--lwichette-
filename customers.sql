select 
  customers.id,
  MAX(customers.name) as name,
  MAX(customers.email) as email,
  MIN(orders.created_at) as first_order_at,
  count(orders.id) as number_of_orders
FROM `analytics-engineers-club.coffee_shop.customers` AS customers 
LEFT JOIN `analytics-engineers-club.coffee_shop.orders` AS orders 
ON orders.customer_id=customers.id
group by 1
order by 4
limit 5
