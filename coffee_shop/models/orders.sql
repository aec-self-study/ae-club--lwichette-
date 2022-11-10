with orders as (
  select  
    id as order_id,
    created_at as order_date,
    customer_id,
    total
  from {{ source ('coffee_shop', 'orders') }}
)

select * from orders