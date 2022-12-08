-- Assert every row in the customers model is unique

select
    customer_id,
    count(*)
from
    {{ ref('dim_customers') }}
group by 1
having count(*) > 1
