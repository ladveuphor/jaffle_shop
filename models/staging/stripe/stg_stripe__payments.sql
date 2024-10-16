with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

transformed as (

  select
    "ID" as payment_id,
    "ORDERID" as order_id,
    "PAYMENTMETHOD" as payment_method,
    "STATUS" as payment_status,
    round("AMOUNT" / 100.0, 2) as payment_amount,
    "CREATED" as payment_created_at

  from source

)

select * from transformed

-- avant reformatage :
-- select
    -- "ID" as payment_id,
    -- "ORDERID" as order_id,
    -- "PAYMENTMETHOD" as payment_method,
    -- "STATUS" as status,

    -- -- amount is stored in cents, convert it to dollars
    -- "AMOUNT" / 100 as amount,
    -- "CREATED" as created_at

-- from raw.stripe.payment 