/* with coffee_beans_revenue as (
    select
    date_trunc(orders.order_at, week) as order_week_at,
    sum(products.price) as total,
    'coffee beans' as product_category
from {{ ref ('stg_coffee_shop__orders') }} as orders
left join {{ ref ('stg_coffee_shop__order_items') }} as order_items on
orders.order_id = order_items.order_id
left join {{ ref ('stg_coffee_shop__products') }} as products
on order_items.product_id = products.product_id
where products.product_category = 'coffee beans'
group by 1
),

merch_revenue as (
    select
    date_trunc(orders.order_at, week) as order_week_at,
    sum(products.price) as total,
    'merch' as product_category
from {{ ref ('stg_coffee_shop__orders') }} as orders
left join {{ ref ('stg_coffee_shop__order_items') }}   as order_items on
orders.order_id = order_items.order_id
left join {{ ref ('stg_coffee_shop__products') }} as products
on order_items.product_id = products.product_id
where products.product_category = 'merch'
group by 1
),

brewing_supplies_revenue as (
    select
    date_trunc(orders.order_at, week) as order_week_at,
    sum(products.price) as total,
    'brewing supplies' as product_category
from {{ ref ('stg_coffee_shop__orders') }} as orders
left join {{ ref ('stg_coffee_shop__order_items') }}   as order_items on
orders.order_id = order_items.order_id
left join {{ ref ('stg_coffee_shop__products') }}  as products
on order_items.product_id = products.product_id
where products.product_category = 'brewing supplies'
group by 1
)

select * from coffee_beans_revenue
union all
select * from merch_revenue
union all
select * from brewing_supplies_revenue
order by 1, 3 */

with category_revenue as (
select
    date_trunc(orders.order_at, week) as order_week_at,
    sum(products.price) as total,
    product_category
from {{ ref ('stg_coffee_shop__orders') }} as orders
left join {{ ref ('stg_coffee_shop__order_items') }} as order_items on
orders.order_id = order_items.order_id
left join {{ ref ('stg_coffee_shop__products') }} as products
on order_items.product_id = products.product_id
group by 1, 3
)


select * from category_revenue
order by 1, 3