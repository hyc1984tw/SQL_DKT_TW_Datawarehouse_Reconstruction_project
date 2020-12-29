
#   Unload Redshift to S3  -- not working

UnloadRedshitToS3 <- function(conn, sql_query, s3_path,
                              aws_access_key_id,
                              aws_secret_access_key){
  
  unload_query <- paste0("
                         UNLOAD('",sql_query,"')
                         TO '", s3_path,"' credentials
                         'aws_access_key_id=",aws_access_key_id,";aws_secret_access_key=",aws_secret_access_key,"'  
                         DELIMITER ';'
                         ESCAPE
                         ADDQUOTES
                         NULL AS ''
                         parallel off
                         ALLOWOVERWRITE ;")
  
  
  dbSendUpdate(conn, unload_query)
  
  cat(paste0(s3_path, "000 ", "file generate\n"))
  
}


# Unload Redshift to S3 with csv file 

UnloadRedshitToS3CSV <- function(conn, sql_query, s3_path,
                                 aws_access_key_id,
                                 aws_secret_access_key){
  
  unload_query <- paste0("
                         UNLOAD('",sql_query,"')
                         TO '", s3_path,"' credentials
                         'aws_access_key_id=",aws_access_key_id,";aws_secret_access_key=",aws_secret_access_key,"' 
                         DELIMITER ','
                         ADDQUOTES
                         parallel off
                         ALLOWOVERWRITE;")
  
  
  dbSendUpdate(conn, unload_query)
  
  cat(paste0(s3_path, "000 ", "file generate \n"))
  
}
