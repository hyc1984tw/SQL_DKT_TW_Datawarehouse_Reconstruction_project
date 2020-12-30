Drop Table if exists tw_business_unit;
CREATE temp Table tw_business_unit
(
but_num_business_unit bigint,
but_name_business_unit varchar(50),
cnt_idr_country bigint,
but_num_typ_but bigint
);

Insert INTO tw_business_unit
SELECT distinct but_num_business_unit, but_name_business_unit, cnt_idr_country, but_num_typ_but
FROM cds.d_business_unit
WHERE cnt_idr_country = 197;

ANALYZE tw_business_unit;


DROP VIEW if exists  dtm_tw.taiwan_cdp_transaction_detail_current CASCADE;
CREATE VIEW  dtm_tw.taiwan_cdp_transaction_detail_current AS 

SELECT
    t1.the_transaction_id, 
    t1.tdt_num_line,
    t1.ctm_customer_id,  
    t1.tdt_date_event,
    substring(t1.tdt_date_event,1,4) as tdt_year,	    
    t2.but_num_business_unit,		
    t2.but_name_business_unit,  		
    t2.but_num_typ_but, -- 7 is store; 50 is EC
    t1.the_to_type, 
    ROUND(t1.f_qty_item,0) AS f_qty_item,   
    ROUND(t1.f_to_tax_in,0)  AS f_to_tax_in,  -- equals to 'product_turnover'
    t1.sku_idr_sku
FROM 
    cds.f_transaction_detail_current  AS t1
LEFT JOIN
    tw_business_unit AS  t2
ON     
    t1.but_idr_business_unit   =  t2.but_idr_business_unit  
WHERE 
    t1.cnt_idr_country = 197

ANALYZE dtm_tw.taiwan_cdp_cotaiwan_cdp_transaction_detail_current;
