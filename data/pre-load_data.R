library(rgdal)
library(sf)

slopeFailure <- readOGR("data/slope_failure/Wellington_Region_Earthquake_Induced_Slope_Failure.shp")
slopeFailure <- spTransform(slopeFailure, CRS("+proj=longlat +datum=WGS84 +no_defs"))
saveRDS(slopeFailure, "data/saved/slopeFailure.RDS")

WGTN_property_outlines <- readOGR("data/LINZ/wgtn/test3.shp")
WGTN_property_outlines <- spTransform(WGTN_property_outlines, CRS("+proj=longlat +datum=WGS84 +no_defs"))
saveRDS(WGTN_property_outlines, "data/saved/WGTN_property_outlines.RDS")

WGTN_addresses <- readOGR("data/LINZ/wgtn/wgtn.shp")
WGTN_addresses <- spTransform(WGTN_addresses, CRS("+proj=longlat +datum=WGS84 +no_defs"))
saveRDS(WGTN_addresses, "data/saved/WGTN_addresses.RDS")


g_property_outlines <- readRDS("data/saved/WGTN_property_outlines.RDS")
g_adresses <- readRDS("data/saved/WGTN_addresses.RDS")

#If address point is within a property, the outline should be part of the final spatial data
#WIP
test <- st_intersects( st_as_sfc(g_property_outlines),st_as_sfc(g_adresses))
print(lengths(test) > 0)
saveRDS((lengths(test) > 0), "data/saved/intersection.RDS")


intersection <- readRDS("data/saved/intersection.RDS")
test23 <- subset(g_property_outlines,intersection)
View(test23)
saveRDS(test23, "data/saved/WGTN_property_outlines_filtered.RDS")