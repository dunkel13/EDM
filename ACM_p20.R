# Análisis de las respuestas de la pregunta 20 de Muestra_CC

mca64.74<-MCA(CCLatin[,c(3,8,64:74)], quali.sup = c(1,2))
plot.MCA(mca64.74, invisible = c("ind", "quali.sup"), cex=0.9)
par(mfrow=c(1,1))
mcap20<-MCA(CCLatin[,c(4,8,64:74)], quali.sup = c(1,2))
plot.MCA(mcap20, invisible = c("ind", "quali.sup"), cex=0.9)

plot.MCA(mcap20, invisible = c("ind"), cex=0.75, col.quali.sup = "black")
