# ACS de las preguntas p17_a:  actúa conforme a la ley y p20_g: justifica o no desobedecer la ley cuando es bastante seguro que uno no será castigado

p17ax20g<-table(CCLatin$p17_a,CCLatin$P20_g)
p17ax20g<-p17ax20g[-1,]
CAp17ax20g<-CA(p17ax20g)
# No se puede graficar un plano porque con una tabla de contingencias de tamaño I x J el numero de ejes factoriales es min{(I-1),(J-1)}
# dim(p17ax20g) = 4x2   así que no se tiene un plano factorial sino un eje (porque dim=1=min(4-1,2-1))

# relación entre las respuestas a dichas preguntas y el nivel educativo

p17ax7<-table(CCLatin$p17_a,CCLatin$p7)
p17ax7<-p17ax7[-1,]
p17ax20gxNEd<-cbind(p17ax20g,p17ax7)
CA17ax20gxNEd<-CA(p17ax20gxNEd, col.sup = 3:8)
