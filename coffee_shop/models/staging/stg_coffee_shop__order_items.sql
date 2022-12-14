with source as (
  select * from {{ source ('coffee_shop' ,'order_items') }}
),

renamed as (
  select 
    id as order_items_id,
    order_id,
    product_id,
from source
)

{{ config ( 
    materialized = 'table'
) }}

select * from renamed 
