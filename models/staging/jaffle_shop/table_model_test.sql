-- dbt run --select table_model_test --vars "{\"input_table\": \"orders\"}" 
-- dbt run --select table_model_test

select * from {{ref("ephemeral_model_test")}}

-- {% set column_name = var('column_name', 'FIRST_NAME') %} 
-- select "{{ column_name }}" from {{ ref('ephemeral_model_test') }}