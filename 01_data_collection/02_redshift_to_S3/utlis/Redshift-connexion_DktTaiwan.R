options(java.parameters = "-Xmx20048m")
options(java.parameters = "-Xss2560k")

require(rJava)
require(RJDBC)
require (dplyr)

drv <- JDBC("org.postgresql.Driver","~/postgresql-8.4-703.jdbc4.jar",identifier.quote="`")
URL <- "jdbc:postgresql://prdredshift03.c8yxpd5oejlf.eu-west-1.redshift.amazonaws.com:5539/dvdbredshift02"

conn <- dbConnect(drv, URL, user, mdp)
