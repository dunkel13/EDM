require(FactoMineR)
# install.packages("FactoMineR")
require(xtable)
CCLatin <- read.csv2("Muestra_CC.csv", sep = ";")
# lee el archivo Muestra_CC, que debe estar guardado en el directorio de trabajo
CCLatin [CCLatin==""]<-NA
CiuXNed<-table(CCLatin$city, CCLatin$p7)
# Crea la tabla de contingencias CiuXNed con las columnas city y p7
Ne<-c("Sined","Prim","Sec","Tec","Uni", "Pos")
stad<-c("B Hor","Bog","Car","LPaz","Med","Mex","Mont","Quit")
# Crea los vectores Ne y Stad para asignar los nombres a las columnas y filas respectivamente
colnames(CiuXNed)<-Ne
rownames(CiuXNed)<-stad
# Asigna los nombres a las columnas y filas de CiuXNed
CC<-xtable(CiuXNed, Caption = "Nivel educativo de encuestados en la ECC por ciudades")
# Asigna a CC la tabla de contingencias, la cual pueda ser impresa como una tabla LaTeX
print(CC)
v<-c(rep(0,6))
# Crea un vector de ceros
for(i in 1:6){v[i]<-sum(CC[,i])}
# Asigna a cada componente del vector el total de la suma por columnas
print(v)
F<-round(prop.table(CiuXNed),3)
# prop.table <- Express Table Entries as Fraction of Marginal Table
colnames(F)<-Ne
rownames(F)<-stad
frecs<-xtable(F, caption="Matriz F de frecuencias relativas", digts=c(3))
# Asigna a frecs la tabla F de frecuencias relativas, que puede ser impresa como una tabla LaTeX
print(frecs)

CCperfilas<-round(prop.table(CiuXNed,1),4)
filas<-xtable(CCperfilas, caption=c("Perfiles fila"), digits=4)
# tabla perfiles fila
print(filas)

CCpercolumn<-round(prop.table(CiuXNed,2),4)
columns<-xtable(CCpercolumn, caption=c("Perfiles columna"),digits=4)
# tabla perfiles columna
print(columns)

colnames(CCperfilas)<-Ne 
par(mfrow=c(2,4))
for(j in 1:8){barplot(CCperfilas[j,], main=stad[j], ylim=c(0,0.55))}

# Análisis por columnas

resciu.ne<-CA(CiuXNed)
# CA <- Performs Correspondence Analysis (CA) including supplementary row and/or column points.
round(resciu.ne$col$coord[order(resciu.ne$col$coord[,1]),][,1:2],2)
# Coordenadas factor 1 (eje x)
round(resciu.ne$col$coord[order(resciu.ne$col$coord[,2]),][,1:2],2)
# Coorednadas factor 2 (eje y)
round(resciu.ne$col$contrib[order(-resciu.ne$col$contrib[,1]),][,1:2],2)
# contribuciones  factor 1
round(resciu.ne$col$contrib[order(-resciu.ne$col$contrib[,2]),][,1:2],2)
# contribuciones factor 2
round(resciu.ne$col$cos[order(-resciu.ne$col$cos2[,1]),],2)[,1:2]
# cosenos cuadrados, modalidades mejor representadas  en el factor 1
round(resciu.ne$col$cos[order(-resciu.ne$col$cos2[,2]),],2)[,1:2]
# cosenos cuadrados, modalidades mejor representadas  en el factor 2

# Análisis por filas

round(resciu.ne$row$coord[order(resciu.ne$row$coord[,1]),][,1:2],2)
# valores de coordenadas del factor 1 para las ciudades
round(resciu.ne$row$coord[order(resciu.ne$row$coord[,2]),][,1:2],2)
# valores de coordenadas del factor 2 para las ciudades
round(resciu.ne$row$contrib[order(-resciu.ne$row$contrib[,1]),][,1:2],2)
# valores de contribuciones del factor 1 para las ciudades
round(resciu.ne$row$contrib[order(-resciu.ne$row$contrib[,2]),][,1:2],2)
# valores de contribuciones del factor 2 para las ciudades
round(resciu.ne$row$cos[order(-resciu.ne$row$cos2[,1]),][,1:2],2)
# valores de cosenos cuadrados del factor 1 para las ciudades
round(resciu.ne$row$cos[order(-resciu.ne$row$cos2[,2]),][,1:2],2)
# valores de cosenos cuadrados del factor 2 para las ciudades
