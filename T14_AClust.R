require(NbClust)
T14ARWU<-read.csv2("ARWU.csv",sep=";")
T14ARWU<-na.omit(T14ARWU)
rownames(T14ARWU)<-T14ARWU$X
x1<-T14ARWU[,c(5:10)]
res.T14ARWU<-NbClust(x1,distance = "euclidean", min.nc=2,max.nc = 10,method = "kmeans", index="hartigan")
# índice de Hartigan
res.T14ARWU$All.index
# Values of indices for each partition of the dataset obtained with a number of clusters between min.nc and max.nc
res.T14ARWU$Best.nc
# Best number of clusters proposed by each index and the corresponding index value
sort(res.T14ARWU$Best.partition)
kmediaT14ARWU<-kmeans(x1,4,nstart=1000)
# nstart if centers is a number, how many random sets should be chosen?
plot(x1,col=kmediaT14ARWU$cluster,main="Posición de las universidades respecto a las variables")
points(kmediaT14ARWU$centers, col= kmediaT14ARWU$cluster, pch=23, cex=1.5)
