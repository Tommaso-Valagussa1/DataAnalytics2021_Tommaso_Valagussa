EPI_data1 <- read.csv("2010EPI_data.csv")
names(EPI_data1) <- as.matrix(EPI_data1[1,])
EPI_data1[] <- lapply(EPI_data1, function(x)type.convert(as.character(x)))
EPI_data1
#EPI_data <- EPI_data[-c(1),]
View(EPI_data1)
attach(EPI_data1)
fix(EPI_data1)


EPI
summary(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw1.))
rug(EPI)


plot(ecdf(EPI),do.points=FALSE,verticals=TRUE)
par(pty="s")
qqnorm(EPI);qqline(EPI)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)