

libs<-c("tidyverse",
        "rvest",
        "lubridate", "ggplot2")

lapply(libs, library, character.only=TRUE)

url<-"https://www.swift.ac.uk/swift_portal/getobject.php?name=m31n+2008-12a&submit=Search+Names"

page<-read_html(url)

res<-page %>% 
  html_node(xpath="/html/body/div[1]/table") %>%
  html_table()

res2<-res %>% 
  as_tibble() %>%
  rename(obs=Name,
         num_obs='Number of observations',
         target_id = `Target ID`,
         coords = `RA, Dec (J2000)`) %>%
  select(-'Download(target)') %>%
  filter(obs!="All of the above")


str(res3)




target = Name,
num_obs = `Number of observations`,
 %>%


target <- target_page %>%
  html_nodes(xpath = "/html/body/div/table") %>%
  html_table()x