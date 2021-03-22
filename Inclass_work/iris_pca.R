data("iris")
head(iris)

irisdata1 <- iris[,1:4]
irisdata1 

head(irisdata1)

help("princomp")
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
summary(principal_components)

plot(principal_components)
plot(principal_components, type = "l")

help("biplot")
biplot(principal_components)

