#Importing a library
library(dplyr)

`#Reading all the required csv files

dataset<-read.csv("vgsales.csv")
head(dataset)

NASales<-read.csv("nasales.csv")
head(NASales)

JPSales<-read.csv("jpsales.csv")
head(JPSales)

EUSales<-read.csv("eusales.csv")
head(EUSales)

OtherSales<-read.csv("other.csv")
head(OtherSales)

#Binding different csv files in 1
data<-cbind(dataset, NASales, JPSales, EUSales, OtherSales)
head(data)

#Adding a column of total sales
finalData <- mutate(data, Global_Sales = (NA_Sales+JP_Sales+EU_Sales+Other_Sales))
head(finalData)
View(finalData)

#Replacing “N/A” with NA
finalData[finalData== "N/A"] = NA
sum(is.na(finalData))

# Removing NA values
library("tidyr")
finalData<- finalData%>% drop_na()#%>% is called the forward pipe operator
sum(is.na(finalData))

#Structure of final dataframe
str(finalData)

#Summary of final Dataframe
summary(finalData)

#Saving the data in a new CSV file
write.table(finalData, file="Final.csv", row.names = F, sep = ",")

