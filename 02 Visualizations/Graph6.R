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
