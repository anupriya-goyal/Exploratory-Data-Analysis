#Team members name: anupriya and sadibhat
library(plotly)
InfluSummary<-read.csv(file.choose(), header=T) # input file : 'InfluenzaNationalSummary.csv'
xaxis <- c(InfluSummary$Week)
y1 <- InfluSummary$Total.A
y2 <- InfluSummary$Total.B
perPositive <- InfluSummary$X..Positive
data <- data.frame(xaxis,y1,y2)
p <- plot_ly(data, x = c(xaxis)) %>%
  add_trace(y = ~y1, type = 'bar', name = 'A',marker = list(color = 'yellow')) %>%
  add_trace(y = ~y2, type = 'bar',name = 'B',marker = list(color = 'green')) %>%
  add_trace(y = ~perPositive, type = 'scatter', mode = 'lines', name = 'Percent Positive',yaxis = 'y2',
            line = list(color='black')) %>%
  add_trace(y = ~c(InfluSummary$Percent.Positive.A), type = 'scatter', mode = 'lines', name = 'Percent Positive',
            yaxis = 'y2',line = list(color='yellow', dash = 'dot')) %>%
  add_trace(y = ~c(InfluSummary$Percent.Positive.B), type = 'scatter', mode = 'lines', name = 'Percent Positive',
            yaxis = 'y2',line = list(color='green', dash = 'dot')) %>%
  layout(xaxis = list(type = 'category',title = "Week"),yaxis = list(range = c(0,100000),title = 'Number of positive specimens'),
         yaxis2 = list(range = c(0,140),overlaying = 'y',side = 'right', title = "Percent Positive"), 
         barmode = 'overlay', title='Influenza PositiveTests National Summary for 52 weeks, 2018-2019 Season')
p

