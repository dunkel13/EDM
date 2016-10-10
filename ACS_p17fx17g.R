# ACS de las preguntas p17_f: lo ordenado por la ley coincide con la costumbre y p17_b: lo ordenado por la ley coinicde con lo ordenado por su conciencia 

p17fx17g<-table(CCLatin$p17_f,CCLatin$p17_g)
p17fx17g<-p17fx17g[-1,-1]
CAp17fx17g<-CA(p17fx17g)
plot.CA(CAp17fx17g, cex=0.9, title = "Plano 1-2. ACS p17f x p17g")
par(mfrow=c(1,2))
ellipseCA(CAp17fx17g, ellipse = c("row"))
ellipseCA(CAp17fx17g, ellipse = c("col"))

# relación entre las respuestas a dichas preguntas y las ciudades.

Citxp17g<-table(CCLatin$city,CCLatin$p17_g)
Citxp17g<-Citxp17g[,-1]
p17fx17gxCit<-rbind(p17fx17g,Citxp17g)
CA17fx17gxCit<-CA(p17fx17gxCit, row.sup = 5:12)
plot.CA(CA17fx17gxCit, cex=0.9, title = "Plano 1-2. ACS p17f x p17g con ciudades")
ellipseCA(CA17fx17gxCit, cex=0.7, title="Elipses alrededor de las modalidades")
