{{ config(
    materialized = 'materialized_view'
) }}

with AAA as (
    select * from {{ ref('stg_page_views') }}
)
select * from AAA