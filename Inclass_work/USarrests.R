data("USArrests")

states = row.names(USArrests)
states

names(USArrests)

apply(USArrests,2,mean)


apply(USArrests,2,var)

pr.out = prcomp(USArrests,scale= TRUE)
names(pr.out)

pr.out$center
pr.out$scales

pr.out$rotation

dim(pr.out$x)
biplot(pr.out,scale=0)

pr.out$sdev


pr.var = pr.out$sdev^2
pr.var

pve = pr.var/sum(pr.var)
pve

