{{
  config(
    materialized='ephemeral'
  )
}}

{% set input_table = var('input_table', 'customers') %} 
{% set column_name = var('column_name', 'FIRST_NAME') %} 

with 
BBB as(
  select
      "{{ column_name }}"
  from {{ source('jaffle_shop', input_table) }}
),

AAA as(
  select * from BBB
)

select * from AAA

