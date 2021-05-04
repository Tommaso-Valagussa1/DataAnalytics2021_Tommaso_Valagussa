winedata <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",sep = ",")
head(winedata)

nrow(winedata)

colnames(winedata) <- c("Cvs","Alcohol","Malic_Acid","Ash","Alkalinity_of_Ash","Magnesium","Total_Phenols","Flavanoids","NonFlavanoid_Phenols","Proanthocyanins","Color_Intensity","Hue","OD280/OD315_of_Diluted_Wine","Proline")
head(winedata)


help("heatmap")

heatmap(cor(winedata),Rowv = NA, Colv = NA)


help("factor")

cultivarClasses <- factor(winedata$Cvs)
cultivarClasses

winedata_pca <- prcomp(scale(winedata[,-1]))
winedata_pca

plot(winedata_pca)

summary(winedata_pca)

