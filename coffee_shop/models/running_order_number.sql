select 
  order_id,
  row_number()
    over (
    partition by customer_id
    order by order_at
    )
    as running_order_number
from `aec-students.dbt_leonwichette.orders`
order by order_at asc