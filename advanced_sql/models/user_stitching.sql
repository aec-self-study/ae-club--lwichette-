select 
  customer_id,
  --what about null customer_id
  max(visitor_id) over (partition by customer_id) as unique_visitor_id
from `analytics-engineers-club.web_tracking.pageviews` 
