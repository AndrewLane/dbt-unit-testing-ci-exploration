with source_customer as 
(
   select
      * 
   from
      {{ source("snowflakesampledata", "customer") }}
)
,
source_orders as 
(
   select
      * 
   from
      {{ source("snowflakesampledata", "orders") }}
)
select
   c_custkey,
   c_name,
   c_acctbal,
   o_orderkey,
   o_orderstatus,
   o_totalprice 
from
   source_customer 
   left join
      source_orders 
      on source_customer.c_custkey = source_orders.o_custkey