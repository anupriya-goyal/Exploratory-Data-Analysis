#Team members name: anupriya and sadibhat
library(plotly)
library("ggmap")
library("maptools")
library(maps)
HeatMap <- read.csv(file.choose(), header=T) # input file : 'FluHeatMap_USA.csv'
p <- plot_geo(HeatMap, locationmode = 'USA-states') %>%
  add_trace(
    z = ~HeatMap$LEVEL, locations = ~HeatMap$STATE,
    color = ~HeatMap$LEVEL, colors = 'Reds' ) %>%
  colorbar(title = "Activity_Level") %>%
  layout(
    title = '2017-18 Influenza Season Week 4 ending Jan 27, 2018',
    geo = list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showlakes = TRUE,
      lakecolor = toRGB('white')
    )
  )

p


