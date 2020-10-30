# Concenient_store Transaction_id is not pairmay key (contains repetitive data), therefore use rank() make transation_id become primary key#
# Google Cloud Platform #
---------------------------------------------------------------------------------------------------

Create or replace table `mldata-8nkm.cdp3.taiwan_cdp_convenient_store` as

With T1 AS (
Select rank() over(partition by transaction_id order by date_time_transaction, delivery_method desc) as rank, transaction_id, date_time_transaction, address_type, address_city, address_postal_code, address_country, delivery_method, delivery_courier, con_store_name
From `mldata-8nkm.cdp2.taiwan_cdp_convenient_store_2020`),
T2 AS (
select *
from T1
where rank = 1 and delivery_method != '')
Select transaction_id, date_time_transaction, address_type, address_city, address_postal_code, address_country, delivery_method, delivery_courier, con_store_name
from T2
order by transaction_id
