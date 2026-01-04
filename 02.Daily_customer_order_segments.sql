with temp_table as (

select co.customer_id,min(co.order_date) as first_order_date from
customer_orders as co
group by co.customer_id
)
select co.order_date, 
sum(case when co.order_date = temp_table.first_order_date then 1 else 0 end) as fc_flag,
sum(case when co.order_date != temp_table.first_order_date then 1 else 0 end) as rc_flag
from customer_orders as co
inner join temp_table
on temp_table.customer_id = co.customer_id
group by co.order_date;
