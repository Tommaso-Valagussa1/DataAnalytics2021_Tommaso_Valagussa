fitk <- ctree(Kyphosis ~ Age + Number +Start, data = kyphosis)
plot(fitk, main = "Conditional Inference Tree for Kyphosis")
plot(fitk, main = "Conditional Inference for Kyphosis", type = "simple")

