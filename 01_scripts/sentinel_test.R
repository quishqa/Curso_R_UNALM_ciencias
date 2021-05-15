library(ncdf4)
library(geosphere)

sent_file <- "02_data/S5P_NRTI_L2__NO2____20210331T180609_20210331T181109_17952_01_010400_20210331T185656.nc"

nc <- nc_open(sent_file)
vals <- ncvar_get(nc, attributes(nc$var)$names[39])
lat <- ncvar_get(nc, "PRODUCT/latitude")
lon <- ncvar_get(nc, "PRODUCT/longitude")
fill_value <- ncatt_get(nc, attributes(nc$var)$names[39],
                        "_FillValue")
vals[vals == fill_value$value] <- NA

vals_df = NULL
vals_df <- rbind(vals_df, data.frame(lat=as.vector(lat),
                                     lon=as.vector(lon),
                                     vals=as.vector(vals)))


pts <- vals_df
sp::coordinates(pts) <- ~ lon + lat
# Give projection to points
my_projection <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
sp::proj4string(pts) <- sp::CRS(my_projection)

extent_distance_vertical <- geosphere::distm(c(raster::extent(pts)[1], raster::extent(pts)[3]),
                                             c(raster::extent(pts)[1], raster::extent(pts)[4]),
                                             fun = geosphere::distHaversine)

vertical_mid_distance <- (raster::extent(pts)[4] - raster::extent(pts)[3])/2

lat_mid <- raster::extent(pts)[3] + vertical_mid_distance

horizontal_distance <- raster::extent(pts)[2] - raster::extent(pts)[1]

if (horizontal_distance > 180){
  one_degree_horizontal_distance <- geosphere::distm(c(1, lat_mid),
                                                     c(2, lat_mid),
                                                     fun = geosphere::distHaversine)
  extent_distance_horizontal <- one_degree_horizontal_distance * horizontal_distance
} else {
  extent_distance_horizontal <- geosphere::distm(c(raster::extent(pts)[1], lat_mid),
                                                 c(raster::extent(pts)[2], lat_mid),
                                                 fun = geosphere::distHaversine)
}

my_res <- 20000

ncol_rast <- as.integer(extent_distance_horizontal/my_res)
nrow_rast <- as.integer(extent_distance_vertical/my_res)
print(paste0("Create raster file from points"))

rast <- raster::raster(nrows=nrow_rast, ncols=ncol_rast, crs=as.character(raster::crs(pts)),
                       ext= raster::extent(pts), vals=NULL)

final <- raster::rasterize(pts, rast, pts$vals, fun=mean)
raster::plot(final)
