require(FactoMineR)
# install.packages("FactoMineR")
require(xtable)
CCLatin <- read.csv2("Muestra_CC.csv", sep = ";")
CCLatin [CCLatin==""]<-NA
CiuXNed<-table(CCLatin$city, CCLatin$p7)
Ne<-c("Sined","Prim","Sec","Tec","Uni", "Pos")
stad<-c("B Hor","Bog","Car","LPaz","Med","Mex","Mont","Quit")
colnames(CiuXNed)<-Ne
rownames(CiuXNed)<-stad
CC<-xtable(CiuXNed, Caption = "Nivel educativo de encuestados en la ECC por ciudades")
print(CC)
