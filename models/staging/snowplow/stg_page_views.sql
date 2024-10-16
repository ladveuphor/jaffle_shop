{{ config(
    materialized = 'incremental',
    unique_key = 'PAGE_VIEW_ID'
) }}

with events as (
    select * from {{ source('snowplow', 'events') }}
    {% if is_incremental() %}
    where "collector_tstamp" >= (
        select max("max_collector_tstamp") 
        from {{ this }}
    )
    {% endif %}
),
page_views as (
    select * from events
    where "event_type" = 'page_view'
),
aggregated_page_events as (
    select
        "page_view_id",
        count(*) * 10 as approx_time_on_page,
        min("derived_tstamp") as page_view_start,
        max("collector_tstamp") as max_collector_tstamp
    from events
    group by "page_view_id"
),
joined as (
    select
        *
    from page_views
    left join aggregated_page_events using ("page_view_id")
)
select * from joined