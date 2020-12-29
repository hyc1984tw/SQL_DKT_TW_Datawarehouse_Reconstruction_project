DROP VIEW if exists dtm_tw.taiwan_cdp_all_customer CASCADE;

CREATE VIEW  dtm_tw.taiwan_cdp_all_customer  
(
    person_id,  
    loyalty_card_num,
    email_md5,
    loyalty_card_creation_date,
    date_naissance,
    updated_date,     
    gender_id,
    birthdate,   
    num_tiers_habituel,
    member_type,  
    id_sport,
    value_id,
    pratique_no_sports,
    code_postal,
    district,
    province,
    province_geo_id
) 


AS

SELECT t1.person_id,   -- person identifier in the database
       t1.loyalty_card_num,    --card number of the person
       md5(t4.email) as email_md5,
       t1.loyalty_card_creation_date, --Customer's loyalty card creation date
       t4.date_naissance,  -- date of birth
       t3.updated_date,       
       t1.gender_id,   -- = 1 (Man), =2 (Woman)
       t1.birthdate,   -- birthdate of the customer
       t4.num_tiers_habituel,  -- store usual
       t1.member_type, --Customer's type of membership;1=Occasional customer (no loyalty card), 2=Member, 3=E-Member, 4=Decathlon employee, 5=Unknown, 6=Light Customer, 7=prospects  
       t2.id_sport,   -- id_sport = stn_id: identifier of the declared sport by the customer  in the database   
       t3.value_id,-- 1 “Expert” / 2 “Confirmed” / 3 “Beginner” / 4 “Declarant” / 5 “Woman” / 6 “Man” / 7 “Junior” / 8 “Web”      
       t4.pratique_no_sports, -- practice sports or not
       t5.code_postal,
       t5.district,
       t5.province, 
       t5.province_geo_id     
FROM cds.d_customers AS t1
LEFT JOIN ODS.CTM_D_PERSONNE_SPORT AS t2
ON  t1.person_id = t2.personne_id
LEFT JOIN CDS.F_PRACTICED_SPORTS_STN  AS t3
ON  t1.person_id = t3.person_id
LEFT JOIN restricted_access.ctm_d_personne_tw  AS t4
ON  t1.person_id = t4.personne_id
LEFT JOIN ods.ctm_d_adresse  AS t5
ON  t1.person_id = t5.personne_id
WHERE cnt_idr_country_usual = 197;

ANALYZE dtm_tw.taiwan_cdp_all_customer;



COMMIT;
