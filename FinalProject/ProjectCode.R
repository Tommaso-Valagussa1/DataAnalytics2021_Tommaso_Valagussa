library(gdata)
library(dplyr)
library(tidyr)
HospitalData <- read.csv(file.choose(),stringsAsFactors = FALSE)
View(HospitalData)
help("subset")

HData <- subset(HospitalData, select = c(OBJECTID, STATE, TYPE, COUNTY, COUNTRY, BEDS,STATUS))
HData1 <- HData[which(HData$STATUS != "CLOSED" & HData$BEDS != "-999"),]

HData1$STATE <- setNames(state.name,state.abb)[HData1$STATE]

CountyData <- read.xls(file.choose(),stringsAsFactors = FALSE, header = 3)
CountyData <- CountyData[-c(1,2),]
names(CountyData) <- CountyData[1,]
CountyData <- CountyData[-1,]
colnames(CountyData)[1] <- "Geographic Area"
CData <- subset(CountyData, select = c('Geographic Area', 2019))
n<-dim(CData)[1]
CData<-CData[1:(n-4),]
library(stringr)
library(tibble)
County <-data.frame(str_split_fixed(CData$`Geographic Area`,",", 2))
County$X1 <- gsub("[[:punct:]]","",County$X1)
CData$COUNTY <- County$X1
CData$STATE <- County$X2
CData$COUNTY <- gsub("County","",CData$COUNTY)
colnames(CData)[2] <- "POPULATION"
CData <- CData[,-1]

library(dplyr)
CData$COUNTY <- toupper(CData$COUNTY)
HData1$COUNTY <- toupper(HData1$COUNTY)
HData1$COUNTY[1]
HData1$POPULATION <- NA
CData$BEDS <- NA
CData$COUNTY <- trimws(CData$COUNTY,which = c("both"))
HData2$COUNTY <-trimws(HData2$COUNTY, which = c("both"))
CData$BEDS <- HData2$BEDSUM[match(CData$COUNTY,HData2$COUNTY)]
HData2 <- HData1 %>% group_by(COUNTY,STATE) %>% summarize(BEDSUM = sum(BEDS))
CData<- CData %>% group_by(COUNTY,STATE,POPULATION) %>% summarize(BEDS = sum(HData1$BEDS))

CData1 <- aggregate()



library(ggplot2)
ggplot(data = HData1) + geom_bar(mapping = aes(x = TYPE))

ggplot(data = HData1) + geom_bar(mapping = aes(x = STATE))

HData1$BEDS <- as.numeric(HData1$BEDS) 
ggplot(data = HData1,aes(x = STATE,y = BEDS)) +geom_bar(stat = "identity")


library(class)
attach(CData)
CData <- na.omit(CData)
test = 1:1000
train = 1001:2000
training.X = HData1$BEDS[test]
testing.x = HData1$BEDS[test]
train.Type = HData1$TYPE[test]
set.seed(1)
knn.pred <- knn(training.X,testing.x,train.Helipad,k=1)



lm.fit = lm(BEDS~POPULATION,data = CData)
