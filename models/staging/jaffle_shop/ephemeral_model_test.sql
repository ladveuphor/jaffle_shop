{{
  config(
    materialized='ephemeral'
  )
}}

{% set input_table = var('input_table', 'customers') %} 
{% set column_name = var('column_name', 'FIRST_NAME') %} 

select
    "{{ column_name }}"
from {{ source('jaffle_shop', input_table) }}