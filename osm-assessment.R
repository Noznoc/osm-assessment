setwd("C:\\Users\\Julia\\Desktop\\osm-assessment") ## sets workspace 

if (!require("pacman")) install.packages("pacman")
pacman::p_load(install.packages(c("RPostgreSQL", "rgdal", "rgeos", "rpostgis")))

library(devtools)
library(RPostgreSQL)

drv <- dbDriver("PostgreSQL") ## set driver
con <- dbConnect(drv, user = "postgres", dbname = "osm_canada", host = "localhost", password = "january2017*") ## specify what database to connect to
dbListTables(con) ## show tables of PostGIS database.

spatial_data <- readOGR(dsn = con, "ottawa") ## read table and convret it to a R object so that the spatial data can be read in R
class(spatial_data)


query <- "select wkb_geometry from ottawa;" ## query
query_get <- dbGetQuery(con, query) ## submit a query, fetch the results, and clear the result set all at once
view(query_get) ## view query results