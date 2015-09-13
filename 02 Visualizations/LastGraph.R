
require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_ams6624', PASS='orcl_ams6624', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)

require(extrafont)
ggplot(data = df, 
      mapping = aes(x = factor(PCLASS), color =SEX, fill =SEX))
+ coord_cartesian() 
+ scale_x_discrete() 
+ scale_y_continuous()
+ labs(title='Titanic') 
+ labs(x=paste("Pclass"), y=paste("count"))
+ layer(geom = "bar",
          position = "dodge",
          stat = "bin",
          data = df, 
          mapping = aes(x = factor(PCLASS), color =SEX))