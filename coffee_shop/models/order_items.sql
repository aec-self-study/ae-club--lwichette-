with order_items as (
  select 
    id as order_items_id,
    order_id,
    product_id,
from {{ source ('coffee_shop' ,'order_items') }}
)
select * from order_items 
