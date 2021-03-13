fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)

plot(fit2M, uniform = TRUE, main = "CI Tree Tree for MIleage")
text(fit2M, use.na = TRUE, all = TRUE, cex.8)
