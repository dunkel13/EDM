# Clasificación de paises por puntajes promedio de los indicadores del ARWU a partir de un ACP
res.PCA<-PCA(mediaspais[,c(3:8)])
round(res.PCA$eig,2)
res.PCA<-PCA(mediaspais[,(3:8)],ncp=4)
plot.PCA(res.PCA,axes = c(1,2),choix = c("var"))
res.HCPC<-HCPC(res.PCA, nb.clust=-1, min=3, max=6)
plot.HCPC(res.HCPC,axes=c(1,2), choice="3D.map")
plot.HCPC(res.HCPC, axes=c(1,2), choice="map")
# los grupos quedan conformados así:
grup<-cbind(res.HCPC$data.clust[,7], round(res.HCPC$data.clust[,c(2:6)],2))
grup<-grup[order(grup[,1]),]
rename(grup,c("res.HCPC$data.clust[,7]"="Grupo", "Score.on.Alumini"="Alumini","Score.on.Award"="Award","score.on.HiCi"="HiCi","Score.on.N.S"="N.S","Score.on.PUB"="PUB", "Score.on.PCP"="PCP"))
