######################################################################################
# This is an R script to convert a netcdf map to a shapefile.                        #   
# Only work for netcdf files with one layer.                                         #
# Refer to below comments for more detailed instructions/explanations.               #
# Created by Alberth Nahas on 2022-11-08 11:00 pm WIB.                               #
# Email: alberth.nahas@bmkg.go.id                                                    #
# Version 1.0.0                                                                      #
# Disclaimer: This is a free-to-share, free-to-use script. That said, it comes with  #
#             absolutely no warranty. User discretion is advised.                    #
######################################################################################


### SET WORKING DIRECTORY ###
setwd("~/Downloads/")

### CLEAR WORKSPACE ###
rm(list = ls())
gc()
start.clock <- Sys.time()

### INCLUDE LIBRARIES AND FUNCTION ###
# Locate the R script for the function.
require(raster)
require(sp)
require(rgdal)
require(logr)
source("gdal_polygonize.R")

### OPEN LOG ###
log.file <- file.path("test.log")
record <- log_open(log.file)

### CONVERT RASTER TO VECTOR ###
# Determine particular layer and variable if there are multiple layers or variables.
# Watch your RAM as it might create a large temporary vector file.
#record.1 <- print(paste("Start converting raster to vector"))
rst <- raster("SH_BlendPos_CHIRP_v9120_199101.nc", layer = 1, varname = "anomaly")
vct <- gdal_polygonizeR(rst)
shapefile(vct, "SH_BlendPos_CHIRP_v9120_199101.shp", overwrite = TRUE)


### PRINT ELAPSED TIME ###
stop.clock <- Sys.time()
how.many <- round(as.numeric(difftime(stop.clock, start.clock, units = "mins")), 2)
time.spent <- paste("Work has been completed in", how.many,"minutes")
print(time.spent)


### CLOSE LOG ###
log_close()
writeLines(readLines(record))


### END OF LINE ###