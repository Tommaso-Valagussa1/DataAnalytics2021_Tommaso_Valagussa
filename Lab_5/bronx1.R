##lab1_bronx1

library(gdata)
bronx1 <- read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1)
bronx1 <- bronx1[which(bronx1$GROSS.SQUARE.FEET!="0"& bronx1$LAND.SQUARE.FEET!="0"& bronx1$SALE.PRICE!="$0"),]
View(bronx1)

attach(bronx1)
SALE.PRICE <- sub("\\$","",SALE.PRICE)
SALE.PRICE <- as.numeric(gsub(",","",SALE.PRICE))
GROSS.SQUARE.FEET <- as.numeric(gsub(",","",GROSS.SQUARE.FEET))
LAND.SQUARE.FEET <- as.numeric(gsub(",","",LAND.SQUARE.FEET))
plot(log(GROSS.SQUARE.FEET),log(SALE.PRICE))
m1 <- lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

m2 <- lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD))
summary(m2)
plot(resid(m2))
m2a <- lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

m3 <- lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD)+factor(BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

m4 <- lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD)*factor(BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))



#lab1_Bronx2

SALE.PRICE <- sub("\\$","",SALE.PRICE)
SALE.PRICE <- as.numeric(gsub(",","",SALE.PRICE))
GROSS.SQUARE.FEET <- as.numeric(gsub(",","",GROSS.SQUARE.FEET))
LAND.SQUARE.FEET <- as.numeric(gsub(",","",LAND.SQUARE.FEET))
SALE.DATE <- as.Date(gsub("[^]:digit:]]","",SALE.DATE))
YEAR.BUILT <- as.numeric(gsub("[^]:digit:]]","",YEAR.BUILT))
ZIP.CODE <- as.character(gsub("[^]:digit:]]","",ZIP.CODE))

minprice <- 10000
bronx1 <- bronx1[which(SALE.PRICE>=minprice),]
nval <- dim(bronx1)[1]

attach(bronx1)

ADDRESSONLY <- gsub("[,][[:print:]]*","",gsub("[ ]+","",trim(ADDRESS))) 
bronxadd <- unique(data.frame(ADDRESSONLY,ZIP.CODE,stringsAsFactors = FALSE))
name(bronxadd) <- c("ADDRESSONLY","ZIP.CODE")
bronxadd <- bronxadd[order(bronxadd$ADDRESSONLY),]
duplicates <- duplicated(ADDRESSONLY)

for(i in 1:2345){
  if(duplicates[i] == FALSE) dupadd <- bronxadd[bronxadd$duplicates,1]
}

nsample=450

addsample <- bronxadd[sample.int(dim(bronxadd),size=nsample),]
library(ggmap)
addrlist <- paste(addsample$ADDRESSONLY,"NY",addsample$ZIP.CODE,"US",sep = " ")
querylist <- geocode(addrlist)

matched <- (querylist$lat!=0 && querylist$lon!= 0)
addsample <- cbind(addsample,querylist$lat,querylist$lon)
names(addsample)  <- c("ADDRESSONLY","ZIPCODE","Latitude","Longitude")

adduse <- adduse[!is.na(adduse$Latitude),]
mapcoord <- adduse[,c(2,3,24,25)]

table(mapcoord$NEIGHBORHOOD)

mapcoord$NEIGHBORHOOD <- as.factor(mapcoord$NEIGHBORHOOD)
map <- get_map(location = 'Bronx',zoom=12)
ggmap(map) +geom_point(aes(x=mapcoord$Longitude,y=mapcoord$Latitude,size=1,color=mapcoord$NEIGHBORHOOD),data=mapcoord) + theme(legend.position = "none")

mapmeans <- cbind(adduse,as.numeric(mapcoord$NEIGHBORHOOD))
colnames(mapmeans)[26] <- "NEIGHBORHOOD"

keeps <- c("ZIP.CODE","NEIGHBORHOOD","TOTAL.UNITS","LAND.SQUARE.FEET","GROSS.SQUARE.FEET","SALE.PRICE","Latitude","Longitude")
mapmeans <- meapmeans[keeps]
mapmeans$NEIGHBORHOOD <- as.numeric(mapcoord$NEIGHBORHOOD)

for(i in 1:8){
  mapmeans[,i] = as.numeric(mapmeans[,i])
}
mapcoord$class<as.numeric(mapcoord$NEIGHBORHOOD)
nclass <- dim(mapcoord)[1]
split <- .8
trainid <- sample.int(nclass,floot(split*nclass))
testid <- (1:nclass)[-trainid]



kmax <- 10
knnpred <- matrix(NA,ncol = kmax,nrow = length(testid))
knntesterr <- rep(NA,times=kmax)
for(i in 1:kmax){
  knnpred[,i] <- knn(mapcoord[trainid,3:4],mapcoord[testid,3:4],cl=mapcoord[trainid,2],k=i)
  knntesterr[i] <- sum(knnpred[,i]!=mapcoord[testid,2])/length(testid)
}

knntesterr

mapobj <- kmeans(mapmeans,5,iter.max = 10, nstart = 5, algorithm = c("Hartigan-Wong","Lloyd","Forgy","MacQueen"))
fitted(mapobj,method = c("centers","classes"))
mapobj$centers

library(cluster)
cusplot(mapmeans,mapobj$cluster, color=TRUE, shade=TRUE, labels=2,lines=0)

library(fpc)
plotcluster(mapmeans, mapobj$cluster)

mapmeans1 <- mapmeans[,-c(1,3,4)]
mapobjnew <- kmeans(mapmeans1,5,iter.max = 10, nstart = 5, algorithm = c("Hartigan-Wong","Lloyd","Forgy","MacQueen"))
fitted(mapobjnew,method = c("centers","classes"))
clusplot(mapmeans1, mapobjnew$cluster, color=TRUE, shade = TRUE, labels =2, lines = 0)S
plotcluster(mapmeans1, mapobjnew$cluster)
ggmap(map) + geom_point(aes(x=mapcoord$Longitude, y= mapcoord$Latitude, size=1,color = mapobjnew$cluster), data = mapcoord)
