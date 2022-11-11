with source1 as (
  select * from {{ source ('coffee_shop', 'products') }}
),

source2 as(
  select * from {{ source ('coffee_shop', 'product_prices') }}
),

renamed1 as (
  select  
    id as product_id,
    name as product_name,
    category as product_category
    --excluded column
    --created_at
  from source1
),

renamed2 as (
  select 
    product_id,
    price
    --excluded column
    --id
    --created_at
    --ended_at
    from source2
)

{{ config ( 
    materialized = 'table'
) }}

select
    renamed1.product_id,
    renamed1.product_name,
    renamed1.product_category,
    renamed2.price,
from renamed1
left join renamed2 on renamed1.product_id=renamed2.product_id