-- hacks required by https://github.com/EqualExperts/dbt-unit-testing#requirement
{% macro ref(model_name) %} {{ return(dbt_unit_testing.ref(model_name)) }} {% endmacro %}

{% macro source(source, model_name) %} {{ return(dbt_unit_testing.source(source, model_name)) }} {% endmacro %}
