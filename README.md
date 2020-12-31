# DKT TW Datawarehouse Reconstruction Project

**Goal:** To reconstruct datawarehouse for Decathlon Taiwan. The datawarehous contains retail store sales data, membership data, retail sport prodcut data and E-commerce customer delilvery data for Decathlon Taiwan. This project are splited into three parts: 1) Data Collection, 2) Data Cleaning, 3) Automation.

## A. Data Collection

All the sales data are stored in the central datalake of Decathlon Group. The datalake is operated by AMAZON BIG DATA SYSTEM. In this part, we needs to make query in the datalake to obtain the data for Decathlon Taiwan. These data will be organised in various tables and then be transferred to local datawarehouse. 

### A.1 Central Datalake Data Collection on Redshift

### A.2 Data Transfer from Redshift to S3
S3 is a relay station to store the tables transferred from the global data lake and then transfer the tables to local GCP's datawarehouse. The relay station flow is made for data security purpose. 

The automatic data transfer in this stage is organised by Jeankin pipeline and thanks to Jeankin's cloking

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
