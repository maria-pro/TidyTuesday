#kaggle

library(jsonlite)
library(httr)
options(stringsAsFactors = FALSE)

res<-fromJSON("kaggle/kaggle.json")
key<-res$key
username<-res$username

install.packages("e1071")
install.packages("caret")
install.packages("doSNOW")


library(e1071)
library(caret)
library(doSNOW)

train<-read.csv("dataT/titanic/train.csv")
table(train$Embark)
