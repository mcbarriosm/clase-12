## Eduard Martinez
## Update: 

## llamar pacman (contiene la función p_load)
require(pacman)

## llamar y/o instalar librerias
p_load(tidyverse,rio,skimr,
       sf, ## datos espaciales
       leaflet, ## visualizaciones
       tmaptools, ## geocodificar
       ggsn, ## map scale bar 
       osmdata) ## packages with census data

geocode_OSM("Casa de Nariño, Bogotá")

casa_narino = geocode_OSM("Casa de Nariño, Bogotá", as.sf = T)

leaflet() %>% addTiles() %>% addCircles(data=casa_narino)

cbd <- geocode_OSM("Centro Internacional, Bogotá", as.sf=T) 
cbd
leaflet() %>% addTiles() %>% addCircles(data=cbd)

available_features() %>% head(20)

available_tags("amenity") %>% head(20)
available_tags("boundary")

getbb("Santa Marta, Colombia")
opq(bbox = getbb("Santa Marta, Colombia"))

osm = opq(bbox = getbb("Santa Marta, Colombia")) %>%
      add_osm_feature(key="amenity" , value="restaurant") 
class(osm)

osm_sf <- osm %>% osmdata_sf()
osm_sf
