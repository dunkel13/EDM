require(FactoMineR)
# install.packages("FactoMineR")
require(xtable)
t1.7 <- read.csv2("M_CC.csv", sep = ";")
t1.7 [t1.7==""]<-NA
t1.7<-t1.7[,-1]
# Elimina la primera col "NoForm"

mcat1.7<-MCA(t1.7[,c(1:19)], quali.sup = c(1:5))
plot.MCA(mcat1.7, invisible = c("ind", "quali.sup"), cex=0.75)
plot.MCA(mcat1.7, invisible = c("ind"), cex=0.75, col.quali.sup = "black")

# mcat1.7$var$coord
# var<- a list of matrices containing all the results for the active variables (coordinates, square cosine, contributions...)
round(mcat1.7$var$coord[order(mcat1.7$var$coord[,1]),][,1:2],2)
round(mcat1.7$var$coord[order(mcat1.7$var$coord[,2]),][,2:3],2)
round(mcat1.7$var$coord[order(mcat1.7$var$coord[,3]),][,3:4],2)
round(mcat1.7$var$coord[order(mcat1.7$var$coord[,4]),][,4:5],2)
round(mcat1.7$var$coord[order(mcat1.7$var$coord[,5]),][,5:1],2)

# mcat1.7$var$contrib
round(mcat1.7$var$contrib[order(mcat1.7$var$contrib[,1]),][,1:2],2)
round(mcat1.7$var$contrib[order(mcat1.7$var$contrib[,2]),][,2:3],2)
round(mcat1.7$var$contrib[order(mcat1.7$var$contrib[,3]),][,3:4],2)
round(mcat1.7$var$contrib[order(mcat1.7$var$contrib[,4]),][,4:5],2)
round(mcat1.7$var$contrib[order(mcat1.7$var$contrib[,5]),][,5:1],2)

# mcat1.7$var$cos2
round(mcat1.7$var$cos2[order(mcat1.7$var$cos2[,1]),][,1:2],5)
round(mcat1.7$var$cos2[order(mcat1.7$var$cos2[,2]),][,2:3],5)
round(mcat1.7$var$cos2[order(mcat1.7$var$cos2[,3]),][,3:4],5)
round(mcat1.7$var$cos2[order(mcat1.7$var$cos2[,4]),][,4:5],5)
round(mcat1.7$var$cos2[order(mcat1.7$var$cos2[,5]),][,5:1],5)

# mcat1.7$quali.sup$coord
round(mcat1.7$quali.sup$coord[order(mcat1.7$quali.sup$coord[,1]),][,1:2],5)
round(mcat1.7$quali.sup$coord[order(mcat1.7$quali.sup$coord[,2]),][,2:3],5)
round(mcat1.7$quali.sup$coord[order(mcat1.7$quali.sup$coord[,3]),][,3:4],5)
round(mcat1.7$quali.sup$coord[order(mcat1.7$quali.sup$coord[,4]),][,4:5],5)
round(mcat1.7$quali.sup$coord[order(mcat1.7$quali.sup$coord[,5]),][,5:1],5)

# mcat1.7$quali.sup$cos2
round(mcat1.7$quali.sup$cos2[order(mcat1.7$quali.sup$cos2[,1]),][,1:2],5)
round(mcat1.7$quali.sup$cos2[order(mcat1.7$quali.sup$cos2[,2]),][,2:3],5)
round(mcat1.7$quali.sup$cos2[order(mcat1.7$quali.sup$cos2[,3]),][,3:4],5)
round(mcat1.7$quali.sup$cos2[order(mcat1.7$quali.sup$cos2[,4]),][,4:5],5)
round(mcat1.7$quali.sup$cos2[order(mcat1.7$quali.sup$cos2[,5]),][,5:1],5)
