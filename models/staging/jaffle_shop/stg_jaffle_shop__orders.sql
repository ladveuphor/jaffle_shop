with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

transformed as (

  select
    "ID" as order_id,
    "USER_ID" as customer_id,
    "ORDER_DATE" as "order_placed_at",
    "STATUS" as order_status,

    case 
        when "STATUS" not in ('returned','return_pending') 
        then "ORDER_DATE" 
    end as valid_order_date

  from source

)

select * from transformed

-- avant reformatage :
-- select
--     "ID" as order_id,
--     "USER_ID" as customer_id,
--     "ORDER_DATE" as order_date,
--     "STATUS" as status

-- from raw.jaffle_shop.orders