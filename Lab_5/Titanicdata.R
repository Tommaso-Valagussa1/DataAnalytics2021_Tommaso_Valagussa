install.packages("titanic")

require(rpart)

Titanic_rpart <- rpart(Survived ~., data = Titanic)
plot(Titanic_rpart)

require(party)
Titanic_ctree <- ctree(Survived ~., data =  Titanic)
plot(Titanic_ctree)


require(randomForest)

Titanic_forest <- randomForest(Survived ~., data = Titanic )
plot(Titanic_forest)

require(graphics)
Titanic_hclust <- hclust(Survived~., data = Titanic)
plot(Titanic_hclust)