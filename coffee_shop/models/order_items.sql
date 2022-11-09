select 
  order_id,
  count(id) as number_of_items 
from {{ source ('coffee_shop' ,'order_items') }}
group by 1