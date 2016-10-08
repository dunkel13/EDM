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
