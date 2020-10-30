/* Clean raw data from redshift. 
Since cdp2.taiwan_cdp_sport_product table contains products sold for each season and year, there are many repeated rows for the same sku_idr_sku for different season or years. The following codes clean the repated frows for one sku_idr_sku so as to make sure sku_idr_sku become primary key in the new table.
The new table is stored as `mldata-8nkm.cdp3.taiwan_cdp_sport_product`
Note: some lines contains sku_idr_sku is null data.
*/
-------------------------------------------------------------------------------------------------------------

Create or replace table `mldata-8nkm.cdp3.taiwan_cdp_sport_product` as
--- T1: making row_number using patition window on sku_idr_sku and order by p_sell_start_week >>> list in number for one sku_idr_sku. 
With T1 AS (                          
select 
 row_number() over(partition by sku_idr_sku order by p_sell_start_week desc) as rank,
sku_idr_sku, model_code_r3, locale, season_type, season_year, web_label, brand_id, brand_name, p_sell_start_week, p_sell_end_week, fam_num_family, sdp_num_sub_department, dpt_num_department, unv_num_univers, lab_idr_label_mdl, lab_idr_label_fam, lab_idr_label_sdp, lab_idr_label_dpt, lab_idr_label_unv, category_label
from `mldata-8nkm.cdp2.taiwan_cdp_sport_product`
WHERE sku_idr_sku is not null
ORDER by p_sell_start_week desc
--LIMIT 100                           -----remove limit 100 after code finished
),      
----- T2: select the first one in the rank row for each sku_idr_sku >>> make sure sku_idr_sku become primary key in the table
T2 AS (                               
SELECT 
sku_idr_sku, model_code_r3, locale, season_type, season_year, web_label, brand_id, brand_name, p_sell_start_week, p_sell_end_week, fam_num_family, sdp_num_sub_department, dpt_num_department, unv_num_univers, lab_idr_label_mdl, lab_idr_label_fam, lab_idr_label_sdp, lab_idr_label_dpt, lab_idr_label_unv, category_label
FROM T1
WHERE rank = 1),
---- T3: select the rows with sku_idr_sku is null.
T3 AS (                               
select 
sku_idr_sku, model_code_r3, locale, season_type, season_year, web_label, brand_id, brand_name, p_sell_start_week, p_sell_end_week, fam_num_family, sdp_num_sub_department, dpt_num_department, unv_num_univers, lab_idr_label_mdl, lab_idr_label_fam, lab_idr_label_sdp, lab_idr_label_dpt, lab_idr_label_unv, category_label
from `mldata-8nkm.cdp2.taiwan_cdp_sport_product`
where sku_idr_sku is null)
---- Union all T2 & T3 to make sure all products are included in the table.
SELECT * FROM T2
union all
SELECT * FROM T3

