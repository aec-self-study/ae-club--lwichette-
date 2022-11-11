with test_table as ( select 
    customer_id, 
    count( distinct(unique_visitor_id)) as distinct_values
from {{ ref('user_stitching') }}
group by 1
)

select 
    customer_id,
    distinct_values
from test_table
where distinct_values > 1
