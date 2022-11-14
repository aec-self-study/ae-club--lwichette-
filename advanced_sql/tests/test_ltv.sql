select 
    number_of_weeks
from {{ ref('LTV_curves') }}
where number_of_weeks = 0