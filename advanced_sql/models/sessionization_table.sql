with diff_table as (
  select 
      *,
      TIMESTAMP_DIFF( timestamp, lag(timestamp) over ( partition by visitor_id, device_type order by visitor_id, timestamp) , minute) as time_diff_previous
from `analytics-engineers-club.web_tracking.pageviews`),

id_base as (
  select 
      *,
      case when time_diff_previous is null  or time_diff_previous > 30 then id 
      else NULL
      end as sess_id,
      case when time_diff_previous is null  or time_diff_previous > 30 then timestamp 
      else NULL
      end as session_at
  from diff_table

),

sessions1 as (
  select 
    *,
    LAST_VALUE (sess_id IGNORE NULLS) over ( partition by visitor_id, device_type order by visitor_id, timestamp ) as session_id,
    last_value (session_at ignore nulls) over ( partition by visitor_id, device_type order by visitor_id, timestamp ) as session_start_time,
  from id_base
),

sessions2 as (
select *,
  max(timestamp) over (partition by session_id) as session_end_time
from sessions1)

{{ config ( 
    materialized = 'table'
) }}

select 
  id,
  visitor_id,
  device_type,
  timestamp,
  page,
  customer_id,
  session_id,
  session_start_time,
  session_end_time
from sessions2
order by visitor_id, timestamp