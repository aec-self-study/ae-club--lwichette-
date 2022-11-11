with source as(
  select * from {{ source ('coffee_shop', 'orders') }}
),


renamed as (
  select  
    id as order_id,
    customer_id,
    created_at as order_at,
    total
    --excluded columns
    --address,
    --state,
    --zip
  from source
)

{{ config ( 
    materialized = 'table'
) }}

select * from renamed