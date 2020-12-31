# DKT TW Datawarehouse Reconstruction Project

**Goal:** To reconstruct datawarehouse for Decathlon Taiwan. The datawarehous should contain retail store sales data, membership data, retail sport prodcut data and E-commerce customer delilvery data for Decathlon Taiwan. This project are splited into three parts: 1) Data Collection, 2) Data Cleaning, 3) Automation.

## A. Data Collection

All the sales data in Decathlon are stored in the central datalake of Decathlon Group. The datalake is operated by AMAZON BIG DATA SYSTEM. In this part, we will make query in the datalake to obtain the corresponding data for Decathlon Taiwan. These quried data will be organised in various tables and then be transferred to local datawarehouse. 

### A.1 Central Datalake Data Collection on Redshift

The 1st step is to make query in the central datalake to obtain the corresponding data. These data will be organised in various tables. The central lake data is stored in the AMAZON Redshift and is operated by Microsoft SQL Server system. All the sql codes performed to build the tables are saved in this repository. 

### A.2 Data Transfer from Redshift to S3

The 2nd step is to transfer the tables of Decathlon Taiwan Data on Redshift to S3. S3 is a relay station to store the tables transferred from the global data lake and then transfer the tables to local datawarehouse. The relay station flow is made for data security purpose. 

The data transfer to S3 is organised by Jeankin pipeline. All the sql codes performed to operate Jeankin pipeline are saved in this repository. 

### A.3 Data Transfer from S3 to Local datawarehouse on GCP

Once the tables are transferred to S3, the last data transfer to local datawarehouse can be performed. The local datawarehouse of Decathlon Taiwan is built on Google Cloud (GCP) Platform. We can use "data transfers" function on the Biquery of GCP to handle the data transfer from S3 to GCP. All the transferred tables will be stored in the dataset of cdp2 on GCP.

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
