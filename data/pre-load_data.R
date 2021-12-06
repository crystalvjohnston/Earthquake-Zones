library(rgdal)

slopeFailure <- readOGR("data/slope_failure/Wellington_Region_Earthquake_Induced_Slope_Failure.shp")
slopeFailure <- spTransform(slopeFailure, CRS("+proj=longlat +datum=WGS84 +no_defs"))
saveRDS(slopeFailure, "data/saved/slopeFailure.RDS")
