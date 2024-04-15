library(tidyverse)

nimbus <- read_csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv")

nimbus1 <- read.csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv")

test <- tribble(
  ~x, ~y,
  1, "a",
  2, "b",
  3, "c") 

Name <- c("Fred","Magalie","Ajua")
cars <- c("v4","v6","v8")
color <- c("Sky blue","Volcanoe red","Champage")
year <- c(1:5)

 
cars <- expand.grid(Name=Name,Engine=cars,Colors=color,Year=year)

#Converting Dataframe to tibble
car <- as_tibble(cars)

#make a tibble (transversed)
car1 <- tibble(car)

#convert a tibble to a data frame
car3 <- as.data.frame(car)

################################################################################
#                               Parsing                                        #
################################################################################

####################################
#. = NA
####################################
nimbus <- read_csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv",na=".")

###################################
#col_double
###################################
nimbusII <- read_csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv",na=".",
          col_types = list(ozone = col_double()))

install.packages("viridis")
library(viridis)
world <- map_data(map = "world")
nimbusII %>%
  ggplot() +
  geom_point(aes(longitude, latitude, color = ozone)) +
  geom_path(aes(long, lat, group = group), data = world) +
  coord_map("ortho", orientation=c(-90, 0, 0)) +
  scale_color_viridis(option = "A")

################################################################################
#                               Writing                                        #
################################################################################
write_csv(nimbusII,file="nimbus2.csv")

