#Team members name: anupriya and sadibhat
library(plotly)
TableData<-read.csv(file.choose(), header=T) # input file : 'Mortality.csv'
TableData$NewCol <- paste(TableData$Year, TableData$Week, sep='')
d<-data.frame(TableData$Week,TableData$Threshold,TableData$Expected,TableData$Percent.of.Deaths.Due.to.Pneumonia.and.Influenza)
final<-plot_ly(d, x = ~TableData$NewCol) %>%
  add_trace(y = ~c(TableData$Threshold),type = 'scatter', mode = 'lines', name = 'Threshold', 
            line = list(color='black',width =4)) %>%
  add_trace(y = ~c(TableData$Expected), type = 'scatter', mode = 'lines', name = 'Base Line',
            line = list(color='black')) %>%
  add_trace(y = ~c(TableData$Percent.of.Deaths.Due.to.Pneumonia.and.Influenza), type = 'scatter', 
            mode = 'lines', name = 'Percent P&I',line = list(color='red')) %>%
  layout(xaxis = list(title = "Week", type = "category",categoryarray=c(0,432)), 
         #xaxis2 = list(range = c(0,432), overlaying = 'x',side = 'top', type = "category"),
         yaxis = list(range = c(4,12),title = '% of All Deaths due to P&I'),
         title='Pneumonia and Influenza Mortality Data \nthe week ending January 2009, as of Feburary 16, 2019')
final