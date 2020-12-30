# DKT TW Datawarehouse Reconstruction Project

## A. Data Collection

### A.1 Central Datalake Data Collection on Redshift

### A.2 Data Transfer from Redshift to S3
S3 is a relay station to store the tables from the global data lake and then transfer the tables to local datawarehouse for security purposes.

### A.3 Data Transfer from S3 to Local datawarehouse on GCP


## B. Data Cleaning

cdp3 stores the code for cdp3 table. cdp3 is the cleaned data from cdp2.

1.  taiwan_cdp_optin: non-primary key (cdp2) to primary key (cdp3)
    primary key is "person_id".
1.  taiwan_cdp_convenient_store: non-primary key (cdp2) to primary key (cdp3)
    primary key is "transaction_id".
1.  taiwan_cdp_all_customer: non-primary key (cdp2) to primary key (cdp3)
    primary key is "person_id".
1.  taiwan_cdp_sport_product: non-primary key (cdp2) to primary key (cdp3)
    primary key is "sku_idr_sku".
    
Purpose of making primary key is for joining table later in cdp_ml.


## C. Automation
