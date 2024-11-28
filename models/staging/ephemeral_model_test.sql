-- dbt run --select SPLITS_BY_INDEX --vars "{\"input_table\": \"TD_ACA_STAGING\", \"column_name\": \"Ligne_Facture\"}" 

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
  select 
    *,
    ROW_NUMBER() OVER (PARTITION BY "ID" ORDER BY (SELECT NULL)) as ID_SEP 
  from BBB
)

select * from AAA

