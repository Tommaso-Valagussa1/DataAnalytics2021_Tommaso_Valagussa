library(ISLR)

head(iris)
str(iris)

irisplot <- ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))
print(irisplot + geom_point(size=3))


set.seed(101)
help("kmeans")

irisclusters <- kmean(iris[,1:4],3,nstart=20)
print(irisclusters)