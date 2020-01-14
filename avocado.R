install.packages("tibbletime")


library(dplyr)
library(readr)
library(ggplot2)
library(tibbletime)


list.files("../data/") #list files from data folder

#data<-read_csv("../data/avocado.csv") # from readr - faster than read.csv, read factors correctly
data<-read.csv("../data/avocado.csv") #read factors as factors!
data$Date<-as.Date(data$Date, "%Y-%m-%d") 

data<-as_tbl_time(data, index=Date)


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
levels(data$region)




ggplot(data)+geom_point(aes(AveragePrice, Date))

ggplot(data, aes(x=AveragePrice, fill=type))+geom_density()+facet_wrap(~ type)

ggplot(data, aes(x=AveragePrice, fill=type))+geom_density()+facet_wrap(~ type)+
  theme_minimal()+labs(title="Let's see") + theme (legend.position="bottom")

#
vol_type <- data %>% 
  group_by(type) %>% 
  summarise(avg.vol=mean(Total.Volume))  %>% mutate(pct=prop.table(avg.vol) * 100)


organic<- data %>% 
  select(Date, AveragePrice, Total.Volume, type)%>%
                          filter(type=="organic")


organic2<-as_period(organic, period="monthly")
#class(organic$Date)


#organic<-as_tbl_time(organic, index=Date)


