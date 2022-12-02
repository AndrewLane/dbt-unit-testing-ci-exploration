with customer_orders as 
(
   select
      * 
   from
      {{ ref("customer_orders") }} 
)
select
   c_custkey,
   c_name,
   c_acctbal 
from
   customer_orders 
where
   o_orderkey is null 
   and c_acctbal > 5000