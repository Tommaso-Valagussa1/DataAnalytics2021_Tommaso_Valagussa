days <- c('Mon', 'Tue','Wed', 'Thur','Fri','Sat','Sun')
temp <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T','T','F','F','T','T','F')
help("data.frame")
RPI_Weather_Week <- data.frame(days,temp,snowed)

RPI_Weather_Week
head(RPI_Weather_Week)

str(RPI_Weather_Week)

summary(RPI_Weather_Week)
RPI_Weather_Week[1,]
RPI_Weather_Week[,1]

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5,c("days","temp")]
RPI_Weather_Week$temp
subset(RPI_Weather_Week,subset = snowed==TRUE)

sorted.snowed <- order(RPI_Weather_Week['snowed'])
sorted.snowed
RPI_Weather_Week[sorted.snowed,]

dec.snow <- order(-RPI_Weather_Week$temp)
dec.snow

empty.Dataframe <- data.frame()
v1 <- 1:10
v1
letters
v2 <- letters[1:10]
def <- data.frame(col.name.1 = v1, col.name.2 = v2)
df
write.csv(df,file = 'saved_df1.csv')
df2 <- read.csv('saved_df1.csv')
df2







help("read.csv")
EPI_data <- read.csv("2010EPI_data.csv")
View(EPI_data)
attach(EPI_data)
fix(EPI_data)

EPI
tf <- is.na(EPI)
E <- EPI[!tf]

summary(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.))
rug(EPI)


plot(ecdf(EPI),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(EPI);
qqline(EPI)
x<- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)


AIR_H
tf <- is.na(AIR_H)
E <- AIR_H[!tf]

summary(AIR_H)
fivenum(AIR_H,na.rm = TRUE)
stem(AIR_H)
hist(AIR_H)
hist(AIR_H,seq(30.,95.,1.0),prob=TRUE)
lines(density(AIR_H,na.rm=TRUE,bw=1.))
rug(AIR_H)


plot(ecdf(AIR_H),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(AIR_H);
qqline(AIR_H)

boxplot(EPI,AIR_H)

WATER_H
tf <- is.na(WATER_H)
E <- WATER_H[!tf]

summary(WATER_H)
fivenum(WATER_H,na.rm = TRUE)
stem(WATER_H)
hist(WATER_H)
hist(WATER_H,seq(30.,95.,1.0),prob=TRUE)
lines(density(WATER_H,na.rm=TRUE,bw=1.))
rug(WATER_H)


plot(ecdf(WATER_H),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(WATER_H);
qqline(WATER_H)

boxplot(EPI,WATER_H)
boxplot(AIR_H,WATER_H)

qqplot(EPI,AIR_H)
qqplot(EPI,WATER_H)
qqplot(WATER_H,AIR_H)



EPILand <- EPI[!Landlock]
View(EPILand)
Eland <- EPILand[!is.na(EPILand)]
View(Eland)
hist(Eland)
hist(Eland,seq(30.,95.,1.0),prob=TRUE)

Eland
tf <- is.na(Eland)
E <- Eland[!tf]

summary(Eland)
fivenum(Eland,na.rm = TRUE)
stem(Eland)
lines(density(Eland,na.rm=TRUE,bw=1.))
rug(Eland)


plot(ecdf(Eland),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(Eland);
qqline(Eland)

EPI_South_Asia <- EPI[EPI_regions == "South Asia"]
View(EPI_South_Asia)
hist(EPI_South_Asia)
hist(EPI_South_Asia,seq(30.,95.,1.0),prob=TRUE)

summary(EPI_South_Asia)
fivenum(EPI_South_Asia,na.rm = TRUE)
stem(EPI_South_Asia)
lines(density(EPI_South_Asia,na.rm=TRUE,bw=1.))
rug(EPI_South_Asia)


plot(ecdf(EPI_South_Asia),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(EPI_South_Asia);
qqline(EPI_South_Asia)




