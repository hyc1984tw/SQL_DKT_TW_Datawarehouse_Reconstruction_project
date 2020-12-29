DROP VIEW if exists dtm_tw.taiwan_cdp_optin CASCADE;

CREATE VIEW  dtm_tw.taiwan_cdp_optin AS

SELECT t1.person_id,   -- person identifier in the database
       t1.loyalty_card_num,    --card number of the person
       t1.cnt_idr_country_usual,   --the country of the business unit (store) of the customer
       t1.optin_sport,  -- =1 if the customer accepted sport communication from Decathlon
       t1.optin_review,
       t1.optin_event,
       t1.but_idr_business_unit_usual, -- the usual business unit (store) of the customer
       t1.person_creation_date,
       t1.person_update_date
       
FROM cds.d_customers AS t1
WHERE cnt_idr_country_usual = 197;

ANALYZE dtm_tw.taiwan_cdp_optin;

COMMIT;
