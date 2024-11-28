-- dbt run --select TD_ACA_FACTURES --vars "{\"input_table\": \"TD_ACA_STAGING\", \"column_name\": \"Ligne_Facture\"}" 

-- dbt run --select table_model_test --vars "{\"input_table\": \"customers\", \"column_name\": \"ID\"}" 
-- dbt run --select table_model_test --vars "{\"input_table\": \"orders\", \"column_name\": \"ORDER_DATE\"}" 
-- dbt run --select table_model_test --vars "{\"input_table\": \"orders\"}" 
-- dbt run --select table_model_test

select * from {{ref("ephemeral_model_test")}}

-- {% set column_name = var('column_name', 'FIRST_NAME') %} 
-- select "{{ column_name }}" from {{ ref('ephemeral_model_test') }}