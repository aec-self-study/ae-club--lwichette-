with running_orders as (
select * 
from {{ ref ('stg_coffee_shop__orders') }} as orders
left join {{ ref ('running_order_number') }} as running_order_number
on running_order_number.order_id = orders.order_id
) ,

total_new as (select 
    date_trunc(running_orders.order_at, week) as week_ordered_at,
    sum(total) as total,
    'new customer' as category_customer
from running_orders
where running_order_number = 1
group by 1),

total_rebuy as (select 
    date_trunc(running_orders.order_at, week) as week_ordered_at,
    sum(total) as total,
    'returning customer' as category_customer
from running_orders
where running_order_number > 1
group by 1)

select 
    week_ordered_at,
    total,
    category_customer
from total_new
union all
select 
    week_ordered_at,
    total,
    category_customer
from total_rebuy
order by 1, 3

