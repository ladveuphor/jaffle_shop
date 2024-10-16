{{
  config(
    materialized='ephemeral'
  )
}}

{% set input_table = var('input_table', 'customers') %} 

select
    *
from {{ source('jaffle_shop', input_table) }}