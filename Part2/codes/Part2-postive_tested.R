#Team members name: anupriya and sadibhat
library(plotly)
PositiveTested<-read.csv(file.choose(), header=T) # input file : 'Positive tested.csv'
xaxis <- c(PositiveTested$Week)

Asubtype <- PositiveTested$A.Subtyping.not.performed.
Ah3n2 <- PositiveTested$A.H3N2v.
Ah1n1 <- PositiveTested$A..H1N1.pdm09
Ah3 <- PositiveTested$A.H3.
B <- PositiveTested$B
Bvic <- PositiveTested$BVIC
Byam <- PositiveTested$BYAM

data <- data.frame(xaxis,Asubtype,Ah3n2,Ah1n1,Ah3,B,Bvic,Byam)

p <- plot_ly(data,x = c(xaxis)) %>%
  add_trace(y = ~Byam, type = 'bar', name = 'B(Yamagata Lineage)',marker = list(color = c('rgba(24,179,20,89)'))) %>%
  add_trace(y = ~Bvic, type = 'bar', name = 'B(Victoria Lineage)',marker = list(color = c('rgba(59,229,54,67)'))) %>%
  add_trace(y = ~B, type = 'bar', name = 'B(Lineage Not Performed)',marker = list(color = c('rgba(17,86,15,100)'))) %>%
  add_trace(y = ~Ah3n2, type = 'bar', name = 'H3N2v',marker = list(color = c('rgba(20,101,179,89)'))) %>%
  add_trace(y = ~Ah3, type = 'bar', name = 'A(H3N2)',marker = list(color = 'red')) %>%
  add_trace(y = ~Ah1n1, type = 'bar', name = 'A (H1N1)pdm09',marker = list(color = 'orange')) %>%
  add_trace(y = ~Asubtype, type = 'bar', name = 'A(Subtyping not performed)',marker = list(color = 'yellow')) %>%
  
  layout(xaxis = list(type = 'category',title='Week'), 
         yaxis=list(range = c(0,4000), title='Number of positive specimens'),
         barmode = 'stack')
p