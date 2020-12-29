DROP VIEW if exists dtm_tw.taiwan_cdp_convenient_store;

CREATE VIEW dtm_tw.taiwan_cdp_convenient_store AS 


SELECT
    C1.transaction_id, 
    C1.date_time_transaction,
    C2.address_type,
    C2.address_city,
    C2.address_postal_code,    
    C2.address_country,
    C1.delivery_method, 
    C1.delivery_courier,
    CASE
        WHEN substring(C1.delivery_courier,1,1) = 'L' THEN 'HiLife'
        WHEN substring(C1.delivery_courier,1,1) = 'K' THEN 'OKMart'
        WHEN substring(C1.delivery_courier,1,1) = 'F' then 'FamilyMart'
    END AS con_store_name
FROM ods_retail.psl_rtl_delivery AS C1
LEFT JOIN ods_retail.psl_rtl_delivery_information AS C2
ON C1.transaction_id = C2.transaction_id
WHERE C2.address_country = 'TW'
;

ANALYZE dtm_tw.taiwan_cdp_convenient_store;

COMMIT;
