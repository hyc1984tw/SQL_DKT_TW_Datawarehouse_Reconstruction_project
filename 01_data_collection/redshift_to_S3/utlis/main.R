# File to call a query, and unload the result on S3.
# query and filename is in unload_queries.R
# aws access and secret keys (aws_access_key_id, aws_secret_access_key),
# Redshit usernames and passwords (user, mdp), and the name of the tables which should be output (tables)

args <- commandArgs(trailingOnly = TRUE)
aws_access_key_id  <- args[1]
aws_secret_access_key <- args[2]
user <- args[3]
mdp <- args[4]

source("utils/Redshift-connexion_DktTaiwan.R")
# source("~/Redshift-connexion.R")
source("utils/utils.R")
source("queries/unload_queries.R")
library(dplyr)
library(data.table)

for (i in 1:length(Query_all)) {
   
  transactions_s3_path <- paste0("s3://preprod.datamining/Decathlon_Taiwan/taiwan_clv/", FileName_all[i])
  
  UnloadRedshitToS3CSV(conn, Query_all[i], transactions_s3_path, aws_access_key_id, aws_secret_access_key)
}

dbDisconnect(conn)
