HospitalData <- read.xls(file.choose(),pattern = "OBJECTID", stringsAsFactors = FALSE, sheet = 1)
HData <- subset(HospitalData,-c(X,Y,NAME,ADDRESS,ZIP4,TELEPHONE,LATITUDE,LONGITUDE, NAICS_CODE,NIACS_DESC,
                                SOURCED,SOURCEDATE,VAL_METHOD,VAL_DATE,WEBSITE,STATE_ID,ALT_NAME,TTL_STAFF,TRAUMA,POPULATION))

HData1 <- HData[which(Status != "CLOSED" & BEDS != "-999"),]

CountyData <- read.xls(file.choose(),stringsAsFactors = FALSE, sheet = 1)
CData <- subset(CountyData, c('Geographic Area', 2019))

