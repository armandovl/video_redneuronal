install.packages("neuralnet")
install.packages("readxl")

library(neuralnet)
library(readxl)

getwd()
dfbase=read_excel("covid_cdmx.xlsx",sheet="Hoja1")
dfbase= dfbase[2:4000,]
test=read_excel("covid_cdmx.xlsx",sheet="Hoja2")
View(head(dfbase))

neuronal_net= neuralnet(DEFUNCION~., data=dfbase, hidden=10,act.fct="logistic", linear.output=F)

plot(neuronal_net)

red_prediccion=compute(neuronal_net , test)

a= red_prediccion$net.result
resultado=ifelse(a>0.5,1,0)
resultado

View(head(test,10))