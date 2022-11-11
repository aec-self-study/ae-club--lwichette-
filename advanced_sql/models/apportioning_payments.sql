with 
inbound1 as 
( select 
  task_id,
  payment_id as inbound_payment_id,
  amount as inbound_amount
from `advanced-sql-challenges`.`apportioning_payments`.`payments` 
where task_id = 1 and payment_type = 'inbound'
),
payout1 as 
( select 
  task_id,
  amount as payout_amount,
  case 
    when true then 0 end as refund_amount
from `advanced-sql-challenges`.`apportioning_payments`.`payments` 
where task_id = 1 and payment_type = 'payout'
)
select 
  inbound1.*,
  payout1.payout_amount,
  payout1.refund_amount
from inbound1 
left join payout1 on inbound1.task_id = payout1.task_id;

#----------------------------------------------------------------

with 
inbound2 as 
( select 
  task_id,
  payment_id as inbound_payment_id,
  amount as inbound_amount,
  case 
    when true then 0 end as payout_amount
from `advanced-sql-challenges`.`apportioning_payments`.`payments` 
where task_id = 2 and payment_type = 'inbound'
),
refund2 as 
( select 
  task_id,
  amount as refund_amount
from `advanced-sql-challenges`.`apportioning_payments`.`payments` 
where task_id = 2 and payment_type = 'refund'
)
select 
  inbound2.*,
  refund2.refund_amount
from inbound2 
left join refund2 on inbound2.task_id = refund2.task_id;

#----------------------------------------------------------------
select 
  task_id,
  payment_id as inbound_payment_id,
  amount as inbound_amount,
  amount as payout_amount,
  case 
    when true then 0 end as refund_amount
from `advanced-sql-challenges`.`apportioning_payments`.`payments` 
where task_id = 3 and payment_type = 'inbound' ;

#----------------------------------------------------------------
