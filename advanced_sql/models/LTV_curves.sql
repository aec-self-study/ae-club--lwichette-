with select1 as ( 
select 
  customer_id,
  date_trunc(created_at, week) as week_of_purchase,
  sum(total) as week_total,
from `analytics-engineers-club.coffee_shop.orders`
group by 1, 2
order by 1, 2
)

select 
 *,
 count(*) over ( partition by customer_id order by week_of_purchase ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as number_of_weeks,
 sum(select1.week_total) over ( partition by customer_id order by week_of_purchase ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total,
from select1
order by 1, 2 