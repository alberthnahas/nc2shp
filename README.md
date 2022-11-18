# Convert NetCDF to ESRI Shapefile in R

This is an example of an R script to convert netcdf to shp. In this script, a NetCDF file of rainfall anomaly over Indonesia for January 1991 is used as an input file.
The script utilizes a gdal function to polygonize raster into vector. This function is written in another script and is being sourced to the script. The function uses phyton to process the polygonization.

The gdal function can be found here: https://www.r-bloggers.com/2012/07/getting-rasters-into-shape-from-r/
