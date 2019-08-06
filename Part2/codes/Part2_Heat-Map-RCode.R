#Team members name: anupriya and sadibhat
install.packages("usmap")
install.packages("maps")
install.packages("mapproj")

library(ggplot2)
library(maps)
library(mapproj)
library(usmap)

us <- map_data("state")

heat_map_data <- read.csv(file.choose(),header=T)
heat_map_data$statelower <- tolower(heat_map_data$STATENAME)
summary(heat_map_data$ACTIVITY.LEVEL)

heat_map_data$fact_acivity_level <- factor(heat_map_data$ACTIVITY.LEVEL, levels = c("Level 10","Level 9","Level 8","Level 7","Level 6","Level 5","Level 4","Level 3","Level 2","Level 1"))

ggplot(heat_map_data,aes(map_id = heat_map_data$statelower,fill = heat_map_data$fact_acivity_level))+
  geom_map(map=us,color = "black")+
  expand_limits(x=us$long,y=us$lat)+
  scale_fill_manual(values = c("#cc0000","#fa4f00","#fc8200","#fcb100","#f7df00","#e0f500","#baf700","#8cf700","#00ff00","#00c200","white"),drop=FALSE)+
  coord_map("bonne",lat0=20)+
  labs(fill="ILI Activity Level",title = "2018-2019 Influenza Season week 4 ending Feb 28 ,2019",x="",y="")+
  theme(panel.grid = element_blank(),axis.title.x = element_blank(),
        axis.title.y = element_blank(),axis.text.x = element_blank(),
        axis.text.y = element_blank(),axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),line = element_blank(),plot.title = element_text(hjust = 0.5,face='bold',size = 10),
        legend.title = element_text(face='bold',size = 8))
