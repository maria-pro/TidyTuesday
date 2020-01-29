# city economy file
library(tidyverse)
library(ggplot2)
theme_set (theme_light())


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
#_____________

spotify_songs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')

#plot danceability vs track_popularity


test2<-spotify_songs %>% 
  count(new=danceability/2, track_artist, sort=TRUE)

test<-spotify_songs %>% 
  count(new=danceability/2, sort=TRUE)


spotify_songs %>%
  group_by(playlist_name) %>%
  summarise(avg_pop=mean(track_popularity))

test<-spotify_songs %>%
  group_by(playlist_name) %>%
  summarise(avg_pop=mean(track_popularity))
is.grouped_df(test)

test3<-spotify_songs %>%
  add_count(playlist_name, sort=TRUE) %>%
  filter(n>5) %>%
  group_by(playlist_name) %>%
  summarise(avg_pop=list(t.test(track_popularity)))
is.grouped_df(test3)


test2<-spotify_songs %>%
  group_by(playlist_name) %>%
  mutate(avg_pop=mean(track_popularity))

is.grouped_df(test2)





spotify_songs %>% ggplot() +
  geom_point(aes(track_popularity, danceability))

#count number of unique artists
artists<-spotify_songs %>% 
  group_by(track_artist)%>%
  mutate(number=n())


track_artist, sort=TRUE, name="number")%>%
  add_count()



artists<-spotify_songs %>% 
  mutate(n=count(track_artist, sort=TRUE))

%>%
  pull()





