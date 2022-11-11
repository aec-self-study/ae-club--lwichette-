select 
  order_id,
  row_number()
    over (
    partition by customer_id
    order by order_at
    )
    as running_order_number
from {{ ref( 'stg_coffee_shop__orders' )}}
order by order_at asc