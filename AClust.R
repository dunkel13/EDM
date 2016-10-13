require(xtable)
sue<-read.csv2("SUE_Taller_11.csv",sep = ";")
sue<-na.omit(sue)
rownames(sue)<-sue$Acronimo
print(sue[1:4,c(4:11)])

require(NbClust)
x<-sue[,c(4:11)]
res.sue<-NbClust(x,distance="euclidean",min.nc = 2, max.nc = 10, method = "kmeans", index = "ch")
# índice de Carlinski-Harabasz o criterio de razón de varianzas
res.sue$All.index
# Values of indices for each partition of the dataset obtained with a number of clusters between min.nc and max.nc
res.sue$Best.nc
# Numero de grupos Best number of clusters proposed by each index and the corresponding index value
sort(res.sue$Best.partition)
# Partition that corresponds to the best number of clusters
# La clasificacion en 8 grupos es la siguiente
kmedia<-kmeans(x,8,nstart = 1000)
print(kmedia$centers)
# A matrix of cluster centres

res.sueh<-NbClust(x,distance = "euclidean", min.nc=2,max.nc = 10,method = "kmeans", index="hartigan")
# índice de Hartigan
names(res.sueh)
res.sueh$All.index
res.sueh$Best.nc
sort(res.sueh$Best.partition)
# La calsificacion en 7 grupos es la siguiente
kmediah<-kmeans(x,7,nstart=1000)
plot(x,col=kmediah$cluster, main="Posición de las universidades respecto a las variables")
points(kmediah$centers, col= kmediah$cluster, pch=23, cex=1.5)
print(sort(kmediah$cluster))
print(kmediah$centers)
print(kmediah$withinss)
# Vector of within-cluster sum of squares, one component per cluster.
print(kmediah$betweenss)
# The between-cluster sum of squares

# Gráficos complementarios a la salida de kmeans

par(mfrow=c(3,2))
for (i in 5:7){for (j in (i+1):8){plot(sue[,c(j,i)], col=kmediah$cluster, main = paste("Plano", i, "-", j))
  points(kmediah$centers, col=kmediah$cluster, pch=23, cex=1.5)
  text(sue[,c(j,i)],rownames(sue),col = kmediah$cluster, cex=0.7)
}
}
