-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail
-- Run with dbt test (or dbt test --data)

select
    order_id,
    sum(amount) as total_amount
from {{ref('fct_orders')}}
group by 1
having sum(amount) < 0