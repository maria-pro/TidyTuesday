# city economy file
library(tidyverse)
library(ggplot2)
theme_set (theme_light)


big_epa_cars <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-15/big_epa_cars.csv") %>%
  mutate(uses_electricity = ifelse(highwayE > 0, "Uses Electricity", "Doesn't Use Electricity"))


big_epa_cars_alphab<-big_epa_cars %>% select(sort(colnames(big_epa_cars)))

big_epa_cars %>% 
  ggplot(aes(highway08, city08))+
  geom_point()+
  geom_abline(color="red")

big_epa_cars %>%
  ggplot(aes(highway08, city08))


str(iris)

test2<-iris

test<-iris%>% group_by(Species)

test3<-group_split(test)




