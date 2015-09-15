require("ggplot2")
require("jsonlite")
require("RCurl")

#Graph 6
# Change the USER and PASS below to be your UTEid
df6 <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_alm3657', PASS='orcl_alm3657', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df6
summary(df6)
head(df6)
require(extrafont)
ggplot(data = df6, 
      mapping = aes(x = factor(PCLASS), color =SEX, fill =SEX)) +
 coord_cartesian() +
 scale_x_discrete() +
 scale_y_continuous() +
 labs(title='Titanic') +
 labs(x=paste("Pclass"), y=paste("count")) +
 layer(geom = "bar",
          position = "dodge",
          stat = "bin",
          data = df6, 
          mapping = aes(x = factor(PCLASS), color =SEX))
