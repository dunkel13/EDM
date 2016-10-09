# ACS de las preguntas p23: Cuando usted no cumple acuerdos y p24: cuando no le cumplen un acuerdo 
# modalidades de respuesta: p23_a y p24_g <- elude a la otra persona
p23x24<-table(CCLatin$p23_a,CCLatin$p24_g)
p23x24<-p23x24[-1,-1]
p23x24
CA23x24<-CA(p23x24)
plot.CA(CA23x24, cex=0.9, title = "Plano 1-2. ACS p23_a x p24_g")
par(mfrow=c(1,1))
ellipseCA(CA23x24, ellipse = c("row"))
# elipses alrededor de las modalidades de respuesta
# elipse más pequeña/grande indica modalidad menos/más dispersa
ellipseCA(CA23x24, ellipse = c("col"))

# ACS con las variables nivel educativo y ciudades como suplementarias

p23x7<-table(CCLatin$p23_a,CCLatin$p7)
p23x7<-p23x7[-1,] 
# p23 x nivel educativo
p23_axp24_g.NEd<-cbind(p23x24,p23x7) 
# cbind <- Combine R Objects (vector, matrix or data-frame arguments) by Rows or Columns
# p23 con Ne en columnas
p24<-matrix(NA,8,6) 
# crea matriz auxiliar p24 
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = list(c(rownames),c(colnames)))

citx24<-cbind(table(CCLatin$city,CCLatin$p24_g), p24) 
# crea ciudadx24, las filas son las ciudades(8)  y las columnas las modalidades de p24_g, + las columnas de la matriz p24
citx24<-citx24[,-1]
P23xP24_CNe_Cit<-rbind(p23_axp24_g.NEd,citx24) 
# tabla final p23xp24 + Ne como variable suplementaria
# + ciudades en las filas
P23xP24_CNe_Cit
CA23x24xnexcit<-CA(P23xP24_CNe_Cit, col.sup = 5:10, row.sup = 5:12)
plot.CA(CA23x24xnexcit, cex=0.9, title = "P21 y p25 con niveles educativos y ciudades")
ellipseCA(CA23x24xnexcit, cex=0.7, title="Elipses alrededor de las modalidades")
# elipses más/menos superpuestas entre sí son más homogéneas/dispersas
