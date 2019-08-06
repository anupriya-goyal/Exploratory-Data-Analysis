#Team members name: anupriya and sadibhat
library(plotly)
TableData1<-read.csv(file.choose(), header=T) # input file : 'ILI-16-17.csv'

TableData2<-read.csv(file.choose(), header=T) # input file : 'ILI-15-16.csv'

TableData3<-read.csv(file.choose(), header=T) # input file : 'ILI-14-15.csv'

TableData4<-read.csv(file.choose(), header=T) # input file : 'ILI-11-12.csv'

TableData5<-read.csv(file.choose(), header=T) # input file : 'ILI-9-10.csv'

TableData6<-read.csv(file.choose(), header=T) # input file : 'ILI-17-18.csv'


TableData1$NewCol <- paste(TableData1$YEAR, TableData1$WEEK, sep='')
d<-data.frame(TableData1$X..WEIGHTED.ILI)
s <- TableData1$WEEK
final<-plot_ly(d) %>%
  add_trace(y = ~c(TableData1$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines', name = '2017-18 Season', 
            line = list(color='grey')) %>%
  add_trace(y = ~c(TableData2$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines', name = '2016-17 Season', 
            line = list(color='green')) %>%
  add_trace(y = ~c(TableData3$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines', name = '2015-16 Season', 
            line = list(color='pink')) %>%
  add_trace(y = ~c(TableData4$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines', name = '2014-15 Season', 
            line = list(color='orange')) %>%
  add_trace(y = ~c(TableData5$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines', name = '2013-14 Season', 
            line = list(color='blue')) %>%
  add_trace(y = ~c(TableData6$X..WEIGHTED.ILI), type = 'scatter', mode = 'lines+markers', name = '2018-2019', 
            line = list(color='red')) %>%
  add_trace(y = ~c(rep(2.2,times = 60)), type = 'scatter', mode = 'lines', name = 'National Baseline', 
            line = list(color='black', dash = 'dash')) %>%
  
  layout(xaxis = list(range = c(0,60),title = "Week", type = "category"),yaxis = list(title = '% of Visits for ILI'),
         title='Percentage of visits for Influenza-like Illines(ILI) \nWeekly National Summary, 2018-2019 and Selected Previous Seasons')
final