-- Assert the average amount per customer is ≥ 1 for customers that have at least one order
select
    customer_id, 
    avg(amount) as average_amount
from {{ ref('fct_orders') }}
group by 1
having count(customer_id) > 1 and average_amount < 1
