require(xtable)
sue<-read.csv2("SUE_Taller_11.csv",sep = ";")
sue<-na.omit(sue)
rownames(sue)<-sue$Acronimo
print(sue[1:4,c(4:11)])

require(NbClust)
x<-sue[,c(4:11)]
# construcción de grupos por el método de Ward 
hsue<-hclust(dist(x),"ward.D")
# Hierarchical cluster analysis on a set of dissimilarities and methods for analyzing it.
par(mfrow=c(1,1))
plot(hsue, cex=0.8)
cortearbol<-cutree(hsue,2)
# corte del dendrograma a la altura de el número de grupos deseado
cortearbol[order(cortearbol)]

mediasgr<-xtable(aggregate(x,by=list(cortearbol),FUN=mean))
print(mediasgr, floating = FALSE)

plot(hsue$order)
# a vector giving the permutation of the original observations suitable for plotting, 
# in the sense that a cluster plot using this ordering and matrix merge will not have crossings of the branches.
text(hsue$order, rownames(x), col=cortearbol)
# corte para 3 grupos
cortearbol2<-cutree(hsue,3)
cortearbol2[order(cortearbol2)]
mediasgr2<-xtable(aggregate(x, by=list(cortearbol2),FUN=mean))
print(mediasgr2,floating = FALSE)

plot(hsue$order)
text(hsue$order, rownames(x), col=cortearbol2)
