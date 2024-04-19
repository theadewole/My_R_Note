################################################################################
#Drawing Maps
#page 55 of the ggplot Elegant Graphics
################################################################################

#################################################
#Vector Boundaries
##Vector boundaries are defined by a data frame with one row for each “corner” of a geographical 
#region like a country, state, or county. It requires four
#variables:
  #• lat and long, giving the location of a point.
  #• group, a unique identifier for each contiguous region.
  #• id, the name of the region.
#################################################
mi_counties <- map_data("county", "michigan") %>%
  select(lon = long, lat, group, id = subregion)
head(mi_counties)

#You can visualise vector boundary data with geom polygon()
ggplot(mi_counties, aes(lon, lat)) +
geom_polygon(aes(group = group)) +
coord_quickmap()

ggplot(mi_counties, aes(lon, lat)) +
  geom_polygon(aes(group = group), fill = NA, colour = "grey50") +
  coord_quickmap




