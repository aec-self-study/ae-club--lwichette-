
with orders as (
select
  orders.customer_id as id,
  min(orders.created_at) as first_order_at,
  max(orders.created_at) as last_order_at,
  count(orders.id) as number_of_orders
from `analytics-engineers-club.coffee_shop.orders` as orders
group by 1
)

select
  customers.id as customer_id,
  customers.name,
  customers.email,
  orders.first_order_at,
  orders.last_order_at,
  orders.number_of_orders as number_of_orders
from `analytics-engineers-club.coffee_shop.customers` as customers 
left join order2 on customers.id = orders.id
order by orders.first_order_at
limit 5;
