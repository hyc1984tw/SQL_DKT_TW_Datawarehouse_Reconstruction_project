DROP VIEW if exists  dtm_tw.taiwan_cdp_sport_product CASCADE;
CREATE VIEW  dtm_tw.taiwan_cdp_sport_product AS 

SELECT
    P1.model_code_r3,
    P1.locale,
    P1.season_type,
    P1.season_year,
    P1.web_label,
    P1.brand_id,
    P1.brand_name,
    P1.p_sell_start_week,
    P1.p_sell_end_week,   
    P2.fam_num_family,
    P2.sdp_num_sub_department,
    P2.dpt_num_department,
    P2.unv_num_univers,
    P2.lab_idr_label_mdl,
    P2.lab_idr_label_fam,
    P2.lab_idr_label_sdp,
    P2.lab_idr_label_dpt,
    P2.lab_idr_label_unv,
    P2.category_label,
    P2.sku_idr_sku
FROM 
    ods.spi_catalog AS p1
LEFT JOIN 
    cds.d_sku AS p2    
ON 
    p1.model_code_r3 = p2.mdl_num_model_r3 
WHERE   locale = 'zh_TW'  
;

ANALYZE dtm_tw.taiwan_cdp_sport_product;
