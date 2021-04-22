library(gdata)
HospitalData <- read.csv(file.choose(),stringsAsFactors = FALSE)
View(HospitalData)
HData <- subset(HospitalData,-c(ï..X,Y,NAME,ADDRESS,ZIP4,TELEPHONE,LATITUDE,LONGITUDE,NAICS_CODE,NAICS_DESC,SOURCE,SOURCEDATE,VAL_METHOD,VAL_DATE,WEBSITE,STATE_ID,ALT_NAME,TTL_STAFF,TRAUMA,POPULATION))

HData1 <- HData[which(Status != "CLOSED" & BEDS != "-999"),]

CountyData <- read.csv(file.choose(),stringsAsFactors = FALSE)
CData <- subset(CountyData, c('Geographic Area', 2019))

