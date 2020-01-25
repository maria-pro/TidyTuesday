df<-data
levels(df$type)

options(repr.plot.width=8, repr.plot.height=4)
ggplot(df, aes(x=AveragePrice, fill=type)) + geom_density() + facet_wrap(~type) + theme_minimal() + 
  theme(plot.title=element_text(hjust=0.5), legend.position="bottom") + labs(title="Avocado Price by Type") + scale_fill_brewer(palette="Set2")


vol_type <- df %>% group_by(type) %>% summarise(avg.vol=mean(Total.Volume))  %>% mutate(pct=prop.table(avg.vol) * 100)


install.packages("rcrossref")
library(rcrossref)
queries <- c("big data analytics", "information systems")
results<-cr_works(filter = c(has_orcid = TRUE, from_pub_date = '2010-10-10', type="journal-article"), query="big data analytics")

text<-results$data


dateSearch<-seq(as.Date("2010/01/01"), by = "year", length.out = 5)



install.packages("paletteer")

install.packages("ggtext")
devtools::install_github("clauswilke/ggtext")
install.packages("here")

################
library(tidyverse)
library (paletteer)
library(ggtext)
library(rvest)
library(here)
