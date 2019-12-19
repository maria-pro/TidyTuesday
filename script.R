install.packages ("dplyr")
library(dplyr)
library("readr")
#instructions on how to copy
nz_bird <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-19/nz_bird.csv")

birds<- distinct(nz_bird,bird_breed)
nrow(distinct(nz_bird, bird_breed))


test<- nz_bird %>%
  add_count(bird_breed, vote_rank, name="number") %>%
  distinct(bird_breed, vote_rank, number)%>%
  filter(vote_rank=="vote_1")%>%
  sort(number)



  group_by(bird_breed) %>%
  summarize(vote_count=
              
              vote_rank)


class(nz_bird)


votes <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-19/BOTY-votes-2019.csv")
