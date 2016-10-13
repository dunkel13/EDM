ARWU1<-read.csv2("ARWU_100_top_sin_university.CSV", sep = ";")
mediaspais<-aggregate(ARWU1, by=list(ARWU1$Country), FUN = mean)
rownames(mediaspais)<-mediaspais$Group.1
mediaspais$Group.1<-NULL
mediaspais<-mediaspais[,-c(1:3)]
mediaspais
library(FactoMineR)

par(mfrow=c(1,2))
res.HCPC<-HCPC(mediaspais[,c(4:9)], nb.clust = -1, min = 3, max = 5)
# Performs an agglomerative hierarchical clustering on results from a factor analysis
plot.HCPC(res.HCPC, choice = "tree", tree.barplot = T)
# dendograma
plot.HCPC(res.HCPC, axes = c(1,2), choice="3D.map")
# grupos posicionados sobre el primer plano factorial
# pertenencia a los grupos y los valores de las variables originales para los paises  
grupos<-cbind(res.HCPC$data.clust[,7],round(res.HCPC$data.clust[,1:6],digits=2))
grupos<-grupos[order(grupos[,1]),]
library(plyr)
# install.packages("plyr")
rename(grupos, c("res.HCPC$data.clust[,7]"="Grupo", "Score.on.Alumni"="Alumni","Score.on.Award"="Award", "Score.on.HiCi"="HiCi", "Score.on.N.S"="N.S","Score.on.PUB"="PUB","Score.on.PCP"="PCP"))
# pertenencia a los grupos y los valores de las variables originales para los países

G1<-xtable(res.HCPC$desc.var$quanti$`1`)
# The description of the classes by the variables
print(G1, floating = FALSE)

G2<-xtable(res.HCPC$desc.var$quanti$`2`)

G3<-xtable(res.HCPC$desc.var$quanti$`3`)
G4<-xtable(res.HCPC$desc.var$quanti$`4`)
