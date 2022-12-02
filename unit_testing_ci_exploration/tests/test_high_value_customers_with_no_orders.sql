{{ config(tags=["unit-test"]) }}

{% set options = {"include_missing_columns": true, "input_format": "csv"} %}

{% call dbt_unit_testing.test ('high_value_customers_with_no_orders', 'tests high_value_customers_with_no_orders logic') %}

{% call dbt_unit_testing.mock_ref('customer_orders', options) %}
c_custkey | c_name | c_acctbal | o_orderkey
1 | 'Andrew Lane' | 12345.67 | null
2 | 'Bob Vancexx' | 23456.78 | 100
3 | 'Bob Vancexx' | 23456.78 | 200
4 | 'Mike Scottx' | 99999.99 | null
5 | 'Dwight Schr' | 5000.00 | null
6 | 'Jim Halpert' | 5000.01 | null
7 | 'Pam Halpert' | 4999.99 | null
8 | 'Andy Bernar' | 1.00 | null
{% endcall %}


{% call dbt_unit_testing.expect(options) %}
c_custkey | c_name | c_acctbal
1 | 'Andrew Lane' | 12345.67
4 | 'Mike Scottx' | 99999.99
6 | 'Jim Halpert' | 5000.01
{% endcall %}

{% endcall %}
