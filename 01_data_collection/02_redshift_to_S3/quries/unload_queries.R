

Query_transaction = "SELECT * FROM  dtm_tw.taiwan_cdp_transaction_detail_current WHERE tdt_date_event > DATEADD(day, -12, current_date) "
FileName_transaction = "taiwan_cdp_transaction_detail_current"

Query_convenient = "SELECT * FROM ods_retail.psl_rtl_delivery WHERE date_time_transaction > DATEADD(day, -12, current_date) "
FileName_convenient = "taiwan_cdp_convenient_store"

Query_customer  = "SELECT * FROM  dtm_tw.taiwan_cdp_all_customer  WHERE loyalty_card_creation_date > DATEADD(day, -12, current_date) OR updated_date > DATEADD(day, -12, current_date)  "
FileName_customer = "taiwan_cdp_all_customer"

Query_optin  = "SELECT * FROM  dtm_tw.taiwan_cdp_optin  WHERE person_creation_date > DATEADD(day, -12, current_date) "
FileName_optin = "taiwan_cdp_optin"

#Query_optin  = "SELECT * FROM  dtm_tw.taiwan_cdp_optin  "
#FileName_optin = "taiwan_cdp_optin"

#Query_customer  = "SELECT * FROM  dtm_tw.taiwan_cdp_all_customer"
#FileName_customer = "taiwan_cdp_all_customer"



Query_all = c(Query_transaction,Query_convenient,Query_customer, Query_optin )
FileName_all = c(FileName_transaction,FileName_convenient,FileName_customer, FileName_optin )

#Query_all = c(Query_customer )
#FileName_all = c(FileName_customer)
