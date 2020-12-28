/* Clean row data from redshift. 
Since cdp2.taiwan_cdp_sport_product table contains repeated person_id, there are many repeated rows for the same person_id for different updated_date. The following codes clean the repated rows for one person_id so as to make sure person_id become primary key in the new table.
The new table is stored as `mldata-8nkm.cdp3.taiwan_cdp_all_customer`
Note 1: Some lines contains null loyalty_card_number data.
Note 2: Majority of the rows contains null updated_date.
*/
--------------------------------------------------------------------------------------------------------------------------------------------------


Create or replace table `mldata-8nkm.cdp3.taiwan_cdp_all_customer` as

-- T1: making row_number using patition window on person_id and order by updated_date >>> list in number for one person_id. 
With T1 AS (                          
select 
row_number() over(partition by person_id order by updated_date desc) as rank,
person_id, loyalty_card_num, email_md5, loyalty_card_creation_date, date_naissance, updated_date, gender_id, birthdate, num_tiers_habituel, member_type, id_sport, value_id, pratique_no_sports, code_postal, district, province, province_geo_id
from `mldata-8nkm.cdp2.taiwan_cdp_all_customer`
--LIMIT 100                           -----remove limit 100 after code finished
),     
----- T2: select the first one in the rank row for each person_id >>> make sure peroson_id become primary key in the table
T2 AS (                               
SELECT 
person_id, loyalty_card_num, email_md5, loyalty_card_creation_date, date_naissance, updated_date, gender_id, birthdate, num_tiers_habituel, member_type, id_sport, value_id, pratique_no_sports, code_postal, district, province, province_geo_id
FROM T1
WHERE rank = 1)

--- Convert datatype respecting to the schema datatype in ML table
SELECT cast(person_id as string) person_id, loyalty_card_num, email_md5, cast(loyalty_card_creation_date as datetime) as loyalty_card_creation_date, date_naissance, updated_date, gender_id, birthdate, num_tiers_habituel, member_type, id_sport, value_id, pratique_no_sports, code_postal, district, province, province_geo_id FROM T2

