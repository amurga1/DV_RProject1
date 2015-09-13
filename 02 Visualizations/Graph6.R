require("jsonlite")
require("RCurl")

#Graph 6
# Change the USER and PASS below to be your UTEid
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic where sex is not null"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs347_professor', PASS='orcl_professor', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
df
summary(df)
head(df)
require(extrafont)
ggplot(data = df, 
      mapping = aes(x = factor(PCLASS), color =SEX, fill =SEX)) +
 coord_cartesian() +
 scale_x_discrete() +
 scale_y_continuous() +
 labs(title='Titanic') +
 labs(x=paste("Pclass"), y=paste("count")) +
 layer(geom = "bar",
          position = "dodge",
          stat = "bin",
          data = df, 
          mapping = aes(x = factor(PCLASS), color =SEX))
