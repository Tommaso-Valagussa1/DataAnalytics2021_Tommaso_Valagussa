require(randomForest)
library(rpart)
fitKF <- randomForest(kyphosis ~ Age + Number + Start, data = kyphosis)
print(fitFK)
importance(fitKF)

fitSwiss <- randomForest(Fertility ~ Agriculture + Education + Catholic, data = swiss)
print(fitSwiss)
importance(fitSwiss)
varimpPlot(fitSwiss)

plot(fitSwiss)

getTree(fitSwiss,1,labelVar = TRUE)
help(randomForest)

help(rfcv)
