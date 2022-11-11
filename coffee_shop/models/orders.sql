with orders as (
  select  
    id as order_id,
    created_at as order_at,
    customer_id,
    total
  from {{ source ('coffee_shop', 'orders') }}
)

select * from orders