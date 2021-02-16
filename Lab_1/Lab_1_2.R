temperature <- 84.5
class(temperature)
RPI <- "Rensselaer Polytechnic Institue"
class(RPI)
Rpi <- 3.14159265359
class(Rpi)
isSnowing <- TRUE
class(isSnowing)
R <- FALSE
class(R)

num_vec <- c(1,3,5,99) 
class(num_vec)

cha_vec <- c("R","P","I")
class(cha_vec)
boolean_vec <- c(T,FALSE) # T = TRUE, you can simply use T for TURE
class(boolean_vec)
vec_mixed <- c("RPI", 1824, 3.14)
vec_mixed
class(vec_mixed) # Note: the 20 and 3.14 are converted to characters
vec_mixed_boolean <- c(TRUE,"RPI", 1824, 3.14)
vec_mixed_boolean
class(vec_mixed_boolean)
vec_numeric_boolean <- c(TRUE,1824,3.14)
vec_numeric_boolean
class(vec_numeric_boolean)


temperature <- c(80,81.3,83,84.2,82.5)
names(temperature) <- c("Mon","Tue","Web","Thur","Fri")
temperature
Week_Days <-c("Mon","Tue","Web","Thur","Fri")
names(temperature) <- Week_Days
temperature


vec1 <- c('R','P','I')
vec2 <- c(1,8,2,4)
vec1[1]
vec2[2]

m <- c(1:10)
m
matrix(m,nrow = 2)
matrix(1:12,byrow = FALSE,nrow = 4)
matrix(1:12,byrow = TRUE,nrow = 4)

C
FB <- c(223,224,225,223.5,222)
tech.stocks <- rbind(stock.matrix,FB) # Row bind
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks,avg) # Column bind
tech.stocks
mat <- matrix(1:50,byrow = T, nrow = 5)
mat
mat[1,] # first row with all the columns
mat[,1] # first column and all the rows
mat[1:3,]
mat[1:2,1:3]
mat[,9:10]
mat[2:3,5:6]

animal <- c('d','c','d','c','c')
id <- c(1,2,3,4,5)
temps <- c('cold','med','hot','hot','hot','cold','med')
temps
fact.temps <- factor(temps, ordered = TRUE, levels = c('cold','med','hot'))
fact.temps
summary(fact.temps)
summary(temps)

undergrads <-c('Freshman','Junior', 'Sophomore','Junior','Senior','Sophomore','Junior','Freshman','Senior','Junior')
undergrads
factor.undergrads <-factor(undergrads,ordered = TRUE,levels = c('Freshman','Sophomore','Junior','Senior'))
factor.undergrads
summary(factor.undergrads)

A <- c(1,2,3)
B <- c(4,5,6)
A <- rbind(A,B)
A
mat <- matrix(1:9, nrow = 3)
mat
is.matrix(mat)
mat2 <- matrix(1:25, byrow = T, nrow = 5)
mat2
mat2[2:3,2:3]
mat2[4:5,4:5]
sum(mat2)
help("runif")
u <- runif(20)
u
runif(matrix(20))
matrix(runif(20),nrow = 4)


plot(mtcars$wt,mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg,data=mtcars)
ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()
plot(pressure$temperature,pressure$pressure,type="l")
points(pressure$temperature,pressure$pressure)

lines(pressure$temperature,pressure$pressure/2,col="red")
points(pressure$temperature,pressure$pressure/2,col="blue")
library(ggplot2)
qplot(pressure$temperature,pressure$pressure,geom="line")
qplot(temperature,pressure,data=pressure,geom="line")
ggplot(pressure,aes(x=temperature,y=pressure))+geom_lineI()+geom_point()
ggplot(pressure,aes(x=temperature,y=pressure))+geom_line()+geom_point()

barplot(BOD$demand,names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))
qplot(factor(cyl),data=mtcars)
ggplot(factor(cyl),aes(x=factor(cyl)))+geom_bar()

plot(ToothGrowth$supp,ToothGrowth$len)
boxplot(len~supp,data=ToothGrowth)
boxplot(len~supp+dose,data=ToothGrowth)
library(ggplot2)
qplot(ToothGrowth$supp,ToothGrowth$len,geom="boxplot")
qplot(supp,len,data=ToothGrowth,geom="boxplot")
ggplot(ToothGrowth,aes(x=supp,y=len))+geom_boxplot()
qplot(interaction(ToothGrowth$supp,ToothGrowth$dose),ToothGrowth$len,geom="boxplot")
qplot(interaction(supp,dose),len,data=ToothGrowth,geom="boxplot")
ggplot(ToothGrowth,aes(x=interaction(supp,dose),y=len))+geom_boxplot()


library(gcookbook)
ggplot(pg_mean,aes(x=group,y=weight)) + geom_bar(stat="identity")
sstr(BOD)
ggplot(BOD,aes(x=TIME,y=demand)) + goem_bar(stat="identity")
ggplot(BOD,aes(x=factor(TIME),y=demand)) + geom_bar(stat = "identity")
ggplot(pg_mean, aes(x=group, y=weight)) +geom_bar(stat = "identity", fill="lightblue", colour = "red")
ggplot(BOD, aes(x=factor(Time), y=demand)) +geom_bar(stat = "identity", fill="orange", colour = "red")

library(gcookbook)
library(ggplot2)
cabbage_exp
ggplot(cabbage_exp,aes(x=Date,fill=Cultivar)) + geom_bar(position = "dodge")

ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar)) + geom_bar(stat = "identity")

ggplot(diamonds,aes(x=cut)) +geom_bar()
diamonds
ggplot(diamonds,aes(x=carat)) + geom_bar()
ggplot(diamonds,aes(x=carat)) + geom_histogram()

library(gcookbook)
ups <- subset(uspopchange,rank(Change)>40)
ups
ggplot(ups,aes(x=Abb,y=Change,fill=Region))+geom_bar(stat = "identity")

ggplot(ups,aes(x=Abb,y=Change,fill=Region))+geom_bin2d()
ggplot(ups,aes(x=Abb,y=Change,fill=Region))+geom_col()

ggplot(ups,aes(x=reorder(Abb,Change),y=Change,fill=Region))+geom_bar(stat = "identity",colour="red")+scale_fill_manual(values=c("#669933","#FFCC66"))+xlab("US-States")
ggplot(ups,aes(x=reorder(Abb,Change),y=Change,fill=Region))+geom_bar(stat = "identity",colour="purple")+scale_fill_manual(values=c("#224455","#DDCC33"))+xlab("US-States")

library(gcookbook)
csub <- subset(climate, source="Berkeley" & Year >= 1900)
csub
csub$pos <- csub$Anomaly10y >=0
csub
ggplot(csub, aes(x=Year, y=Anomaly10y, fill= pos)) + geom_bar(stat = "identity", position = "identity")

ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat="identity", colour="black", size=0.25)+scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE)
library(gcookbook) 
ggplot(pg_mean, aes(x=group, y=weight)) +geom_bar(stat="identity")
ggplot(pg_mean, aes(x=group, y=weight)) +geom_bar(stat="identity", width = 0.5)
ggplot(pg_mean, aes(x=group, y=weight)) +geom_bar(stat = "identity", width = 0.95)

ggplot(cabbage_exp, aes(x=Date, y= Weight, fill=Cultivar)) + geom_bar(stat = "identity", width = 0.5, position = "dodge")
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.7))

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat = "identity")
cabbage_exp
ggplot(cabbage_exp, aes(x= Date, y= Weight, fill=Cultivar)) + geom_bar(stat = "identity") + guides(fill=guide_legend(reverse = TRUE))
ggplot(cabbage_exp, aes(x=interaction(Date,Cultivar), y=Weight)) +geom_bar(stat = "identity") + geom_text(aes(label=Weight),vjust=1.5,colour="white")
ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +  geom_bar(stat="identity") +  geom_text(aes(label=Weight), vjust=-0.2) +  ylim(0, max(cabbage_exp$Weight) * 1.05)

ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) +  geom_bar(stat="identity") +  geom_text(aes(y=Weight+0.1, label=Weight))
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +  geom_bar(stat="identity", position="dodge") +  geom_text(aes(label=Weight), vjust=1.5, colour="white",position=position_dodge(.9), size=3)

tophit <- tophitters2001[1:25,] # take top 25 top hitters
tophit
ggplot(tophit, aes(x=avg, y=name)) + geom_point()
tophit[,c("name","lg","avg")]
ggplot(tophit, aes(x=avg, y= reorder(name,avg))) + geom_point(size=3, colour="red") + theme_bw() +theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour ="grey60",linetype="dashed"))
ggplot(tophit, aes(x=avg, y=reorder(name,avg))) + geom_point(size=2.5, colour="blue") + theme_classic() + theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank(),panel.grid.major.y = element_line(colour = "grey60", linetype = twodash))

nameorder <- tophit$name[order(tophit$lg, tophit$avg)]
tophit$name <- factor(tophit$name, levels = nameorder)
ggplot(tophit, aes(x=avg, y=name)) +geom_segment(aes(yend=name), xend=0, colour="grey70")+geom_point(size=3, aes(colour=lg)) +scale_color_brewer(palette="Set1", limits=c("NL","AL")) + theme_bw() +theme(panel.grid.major.y = element_blank(),legend.position = c(1,0.55),legend.justification = c(1,0.5))
ggplot(tophit, aes(x=avg, y=name)) +geom_segment(aes(yend=name), xend=0, colour="grey40") + geom_point(size=3, aes(colour=lg)) +scale_color_brewer(palette="Set1", limits=c("NL","AL"), guide=FALSE) +theme_bw() +theme(panel.grid.major.y = element_blank()) +facet_grid(lg ~ ., scales = "free_y", space="free_y")





