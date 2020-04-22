# Helsinki

## Using wdpar
#
#
# Reference: https://prioritizr.github.io/wdpar/
#
#

# load packages
library(wdpar)
library(dplyr)
library(ggmap)

# download protected area data for Malta
mlt_pa_data = wdpa_fetch('Malta', wait = TRUE)

# clean Malta data
mlt_data = wdpa_clean(mlt_pa_data)

head(mlt_data)

# reproject data to long/lat for plotting
mlt_data = st_transform(mlt_data, 4326)

# download basemap imagery
bg = get_stamenmap(unname(st_bbox(mlt_data)), zoom = 8,
                   maptype = 'watercolor', force = TRUE)

# make map
ggmap(bg) +
  geom_sf(aes(fill = IUCN_CAT), data = mlt_data, inherit.aes = FALSE) +
  theme(axis.title = element_blank(), legend.position = 'bottom')
