# ACS de las preguntas p17_a:  actúa conforme a la ley y p17_b: le queda fácil actuar conforme a la ley

require(FactoMineR)
# install.packages("FactoMineR")
CCLatin <- read.csv2("Muestra_CC.csv", sep = ";")
# lee el archivo Muestra_CC, que debe estar guardado en el directorio de trabajo
CCLatin [CCLatin==""]<-NA
p17ax17b<-table(CCLatin$p17_a,CCLatin$p17_b)
p17ax17b<-p17ax17b[-1,-1]
CAp17ax17b<-CA(p17ax17b)
plot.CA(CAp17ax17b, cex=0.9, title = "Plano 1-2. ACS p17a x p17b")
par(mfrow=c(1,2))
# A vector of the form c(nr, nc). Subsequent figures will be drawn in an nr-by-nc array on the device by rows (mfrow)
ellipseCA(CAp17ax17b, ellipse = c("row"))
ellipseCA(CAp17ax17b, ellipse = c("col"))

# relación entre las respuestas a dichas preguntas y el nivel educativo de la p7

p17ax7<-table(CCLatin$p17_a,CCLatin$p7)
p17ax7<-p17ax7[-1,]
p17ax17b.NEd<-cbind(p17ax17b,p17ax7)
CA17ax17bxNEd<-CA(p17ax17b.NEd, col.sup =5:10 )
plot.CA(CA17ax17bxNEd,cex=0.9, title= "p17a y p17b con niveles educativos")
ellipseCA(CA17ax17bxNEd, cex=0.7, title="Elipses alrededor de las modalidades")
