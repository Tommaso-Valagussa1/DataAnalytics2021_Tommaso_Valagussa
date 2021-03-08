install.packages("randomForest")
library(randomForest)

data1 <- read.csv(file.choose(),header=TRUE)
head(data1)

colname(data1) <- c("BuyingPrice","Maintenance","NumDoors","NumPersons","BootSpace","Safety","Condition")
head(data1)
str(data1)

levels(data1$Condition)
summary(data1)


set.seed(100)
train <- sample(nrow(data1),.7*nrow(data1),replace=FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[train,]
summary(TrainSet)
summary(ValidSet)

help(randomForest)

model1 <- randomForest(Condition ~ ., data = TrainSet, importance = TRUE)
model1

model2 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2

predTrain <- predict(model2, TrainSet, type = "class")
table(predTrain, TrainSet$Condition)

predValid <- predict(model2, ValidSet, type = "class")
table(predValid, ValidSet$Condition)

importance(model2)
varImpPlot(model2)

a = c()
i = 5
for(i in 3:8) {
  model3 <- randomForest(Condition ~ ., data = TrainSet, ntree = 500, mtry = i, importance = TRUE)
  predValid <- predict(model3, ValidSet, type = "class")
  a[i-2] = mean(predValid == ValidSet$Condition)
}
a
plot(3:8,a)


library(rpart)
library(caret)
library(e1071)

model_dt <- train(Condition ~ ., data = TrainSet, method = 'rpart')
model_dt_1 = predict(model_dt, data = TrainSet)
table(model_dt_1, TrainSet$Condition)
mean(model_dt_1 == TrainSet$Condition)
table(model_dt_1, TrainSet$Condition)
mean(model_dt_1 == TrainSet$Condition)

model_dt_vs = predict(model_dt, newdata = ValidSet)
table(model_dt_vs, ValidSet$Condition)
mean(model_dt_vs == ValidSet$Condition)
