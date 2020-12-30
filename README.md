# DKT TW Datawarehouse Reconstruction Project

## A. Data Collection

### A.1 Central Datalake Data Collection on Redshift

### A.2 Data Transfer from Redshift to S3
S3 is a relay station to transfer the data from global data lake to local datawarehouse.

### A.3 Data Transfer from S3 to Local datawarehouse on GCP


## B. Data Cleaning

cdp3 stores the code for cdp3 table. cdp3 is the cleaned data from cdp2.

1- taiwan_cdp_optin: non-primary key (cdp2) to primary key (cdp3)
    primary key is "person_id".
2- taiwan_cdp_convenient_store: non-primary key (cdp2) to primary key (cdp3)
    primary key is "transaction_id".
3- taiwan_cdp_all_customer: non-primary key (cdp2) to primary key (cdp3)
    primary key is "person_id".
4- taiwan_cdp_sport_product: non-primary key (cdp2) to primary key (cdp3)
    primary key is "sku_idr_sku".
    
Purpose of making primary key is for joining table later in cdp_ml.
