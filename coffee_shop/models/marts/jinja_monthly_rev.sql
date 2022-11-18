{% set cat = ["coffee beans", "merch", "brewing supplies"] %}


with orders as (

    select
        order_id,
        total,
        order_at

    from {{ ref('stg_coffee_shop__orders') }} 

),

items as (

    select
        order_id,
        product_id

from {{ ref('stg_coffee_shop__order_items') }}

),

item_category as (
    select
        product_id,
        product_category
from {{ ref('stg_coffee_shop__products') }}
),

final as (
select
  date_trunc(orders.order_at, month) as date_month,
  {% for i in range(3) %}
  sum(case when item_category.product_category = '{{ cat[i] }}' then orders.total end) as {{ cat[i] | replace(' ', '_') }},
  {% endfor %}
from orders
left join items 
    on orders.order_id = items.order_id
left join item_category 
    on items.product_id = item_category.product_id
group by 1
)

select * from final