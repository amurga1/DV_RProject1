<<<<<<< HEAD
require("jsonlite")
require("RCurl")
require("ggplot2")

df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null and survived is 1"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_ams6624', PASS='orcl_ams6624', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
=======
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null and AGE <= 10"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs347_professor', PASS='orcl_professor', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
>>>>>>> 74f44b56cfc8971b763651cdc7e7c1cdcc6373b4
df
summary(df)
head(df)

<<<<<<< HEAD
require(extrafont)
ggplot(data = df, 
       mapping = aes(x = factor(PCLASS), color =SEX, fill =SEX)) +
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_continuous()+
  labs(title='Titanic') +
  labs(x="Pclass", y=paste("count"))+
  layer(geom = "bar",
        position = "dodge",
        stat = "bin",
        data = df, 
        mapping = aes(x = factor(PCLASS), color =SEX))
=======
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  facet_grid(PCLASS~SURVIVED) +
  labs(title='Titanic where age <= 10') +
  labs(x="SURVIVED", y=paste("FARE")) +
  layer(data=df, 
        mapping=aes(x=SEX, y=as.numeric(as.character(FARE)), color=as.character(SEX)), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
>>>>>>> 74f44b56cfc8971b763651cdc7e7c1cdcc6373b4
