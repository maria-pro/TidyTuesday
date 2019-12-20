library(dplyr)
library(readr)
library(ggplot2)

list.files("../data/") #list files from data folder

#data<-read_csv("../data/avocado.csv") # from readr - faster than read.csv, read factors correctly
data<-read.csv("../data/avocado.csv") #read factors as factors!

#Date - The date of the observation
#AveragePrice - the average price of a single avocado
#type - conventional or organic
#year - the year
#Region - the city or region of the observation
#Total Volume - Total number of avocados sold
#4046 - Total number of avocados with PLU 4046 sold
#4225 - Total number of avocados with PLU 4225 sold
#4770 - Total number of avocados with PLU 4770 sold

levels(data$type)
class(data$type)

ggplot(data)+geom_point(aes(AveragePrice, Total.Volume))

ggplot(data, aes(x=AveragePrice, fill=type))+geom_density()+facet_wrap(~ type)

ggplot(data, aes(x=AveragePrice, fill=type))+geom_density()+facet_wrap(~ type)+
  theme_minimal()+labs(title="Let's see") + theme (legend.position="bottom")


organic<- data %>% 
  select(Date, AveragePrice, Total.Volume, type)%>%
                          filter(type=="organic")%>%
class(organic)
install.packages("tibbletime")
library(tibbletime)

organic$Date<-as.Date(organic$Date, "Y-m-d")
organic<-as_tbl_time(organic, index=Date)

