with t1 as(
select
  *
from `dbt_leonwichette.all_days` as days
cross join (
  select * from `aec-students.dbt_leonwichette.favorite_ice_cream_flavors` where dbt_valid_to is not null) as flavors
where days.date_day <= date_trunc(flavors.dbt_valid_to, day)
and days.date_day >= date_trunc(flavors.dbt_valid_from,day)
),

t2 as(
select
  *
from `dbt_leonwichette.all_days` as days
cross join (
  select * from `aec-students.dbt_leonwichette.favorite_ice_cream_flavors` where dbt_valid_to is null) as flavors
where days.date_day >= date_trunc(flavors.dbt_valid_from,day)
),

joined as(
select * from t1
union all
select * from t2
order by date_day
),

counted as (
select 
  date_day,
  favorite_ice_cream_flavor,
  count(*) over (partition by date_day, favorite_ice_cream_flavor) as number_of_votes
from joined ),

pre_final as (
select  
  *,
  ROW_NUMBER() OVER (
            PARTITION BY 
                date_day, 
                favorite_ice_cream_flavor, 
                number_of_votes
            ORDER BY 
                date_day, 
                favorite_ice_cream_flavor, 
                number_of_votes
        ) row_num
from counted
)

select  
    date_day,
    favorite_ice_cream_flavor,
    number_of_votes
from pre_final 
where row_num = 1
order by 1 asc, 3 desc


