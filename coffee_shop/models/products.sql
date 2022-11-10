with products as (
  select  
    id as product_id,
    name as product_name,
    category as product_category
  from {{ source ('coffe_shop', 'products') }}
),

product_prices as (
  select 
    product_id,
    price
    from {{ source ('coffe_shop', 'product_prices') }}
)

select
    product.product_id,
    product.product_name,
    product.product_category,
    product_prices.price,
from products 
left join product_prices on products.product_id=product_prices.product_id