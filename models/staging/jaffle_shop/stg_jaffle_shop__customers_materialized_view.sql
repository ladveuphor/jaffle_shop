with 

source as (

  select * from {{ source('jaffle_shop', 'customers') }}

),

transformed as (

  select 
    "ID" as customer_id,
    "FIRST_NAME" as customer_first_name,
    "LAST_NAME" as customer_last_name,
    "FIRST_NAME" || ' ' || "LAST_NAME" as full_name

  from source

)

select * from transformed

-- avant reformatage :
-- select
    -- "ID" as customer_id,
    -- "FIRST_NAME" as first_name,
    -- "LAST_NAME" as last_name
-- from raw.jaffle_shop.customers