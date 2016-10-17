require(NbClust)
require(xtable)
require(FactoMineR)
T14ARWU<-read.csv2("ARWU.csv",sep=";")
# Punto 1(a)
T14ARWU<-na.omit(T14ARWU)
rownames(T14ARWU)<-T14ARWU$X
x1<-T14ARWU[,c(5:10)]
res.T14ARWU<-NbClust(x1,distance = "euclidean", min.nc=2,max.nc = 10,method = "kmeans", index="hartigan")
# índice de Hartigan
res.T14ARWU$All.index
# Values of indices for each partition of the dataset obtained with a number of clusters between min.nc and max.nc
res.T14ARWU$Best.nc
# Punto 1 (b) <- Número aprox. de grupos es 4
# Best number of clusters proposed by each index and the corresponding index value
sort(res.T14ARWU$Best.partition)
kmediaT14ARWU<-kmeans(x1,4,nstart=1000)
# nstart if centers is a number, how many random sets should be chosen?
plot(x1,col=kmediaT14ARWU$cluster,main="Posición de las universidades respecto a las variables")
# Punto 1 (d) <- parte gráfica
points(kmediaT14ARWU$centers, col= kmediaT14ARWU$cluster, pch=23, cex=1.5)
# Punto 1 (e)
print(sort(kmediaT14ARWU$centers))
# tabla de medias de cada grupo
print(sort(kmediaT14ARWU$cluster))
# objetos de cada grupo
print(kmediaT14ARWU$withinss)
# Vector of within-cluster sum of squares, one component per cluster.
print(kmediah$betweenss)
# The between-cluster sum of squares
#############################################################################
mediaspais<-aggregate(T14ARWU, by=list(T14ARWU$Country), FUN = mean)
rownames(mediaspais)<-mediaspais$Group.1
mediaspais$Group.1<-NULL
mediaspais<-mediaspais[,-c(1:4)]
mediaspais
par(mfrow=c(1,2))
res.HCPC<-HCPC(mediaspais[,c(1:6)], nb.clust = -1, min = 3, max = 5)
grupos<-cbind(res.HCPC$data.clust[,7],round(res.HCPC$data.clust[,1:6],digits=2))
grupos<-grupos[order(grupos[,1]),]
G1<-xtable(res.HCPC$desc.var$quanti$`1`)
G2<-xtable(res.HCPC$desc.var$quanti$`2`)
G3<-xtable(res.HCPC$desc.var$quanti$`3`)
G4<-xtable(res.HCPC$desc.var$quanti$`4`)
#############################################################################
res.PCA<-PCA(mediaspais[,c(1:6)])
round(res.PCA$eig,2)
res.PCA<-PCA(mediaspais[,(1:6)],ncp=4)
plot.PCA(res.PCA,axes = c(1,2),choix = c("var"))
res.HCPC<-HCPC(res.PCA, nb.clust=-1, min=3, max=6)
grup<-cbind(res.HCPC$data.clust[,7], round(res.HCPC$data.clust[,c(2:6)],2))
grup<-grup[order(grup[,1]),]
grup
