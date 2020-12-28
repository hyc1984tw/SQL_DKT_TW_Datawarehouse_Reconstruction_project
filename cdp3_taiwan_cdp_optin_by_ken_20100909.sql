/* Clean raw data from redshift. 
Since cdp2.taiwan_cdp_optins table contains customer information for each updates, there are many repeated rows for the same person_id for different dates of updates. The following codes clean the repated frows for one person_id so as to make sure person_id become primary key in the new table.
The new table is stored as `mldata-8nkm.cdp3.taiwan_cdp_optin`
Note: some lines contains loyalty_card_num is null.
*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------

Create or replace table `mldata-8nkm.cdp3.taiwan_cdp_optin` as
/* Create partition table by person_id and order by person_update_date* in T1 */
With T1 AS (
select 
row_number() over (
partition by person_id order by person_update_date desc) rank, 
person_id, loyalty_card_num, cnt_idr_country_usual, optin_sport, optin_review, optin_event, but_idr_business_unit_usual, person_creation_date, person_update_date
from `mldata-8nkm.cdp2.taiwan_cdp_optin`
),
/* Select rank = 1 in the partition table for each person_id */
T2 as (
select person_id, loyalty_card_num, cnt_idr_country_usual, optin_sport, optin_review, optin_event, but_idr_business_unit_usual, person_creation_date, person_update_date
from t1
where rank = 1)
/* Convert the data type respecting to schema data type in ML table code */
select cast(person_id as string) person_id, loyalty_card_num, cnt_idr_country_usual, cast(optin_sport as string) optin_sport, cast(optin_review as string) optin_review, cast(optin_event as string) optin_event, but_idr_business_unit_usual, person_creation_date, person_update_date
from t2 
