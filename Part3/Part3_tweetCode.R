#Team members name: anupriya and sadibhat
# 5000 tweets on Flu
library(rtweet)

twitter_token <- create_token(app = "Twitter_project12",
                              consumer_key = "YIOCdZHjofrpDWAobTBFJF9HL",
                              consumer_secret = "qsuVR4MF7cdAlifOogjoEsAU5oU7Ir3EZFpYrGgDNizEy7iink",
                              access_token = "1098723824630153216-kscvMcTHSErtxlg0Gpb5X7NG1zJzVJ",
                              access_secret = "QMxx2XSL6d3wJrf2stqFCxGrnzvSjuNVqnrgH7ZDAuoin")


tweets <- search_tweets(q = "flu OR usflu OR usinfluenza OR influenza OR H3N2 OR H1N1 OR flutests OR positiveflutest OR fluhospitalizations OR flumortality OR UnitedStatesflu OR fluepidemic OR statesflu OR flushot ", n = 5000, token = twitter_token, geocode = lookup_coords("usa"))
tweets
save_as_csv(tweets,"Allflu.csv")
users_data(tweets)

library(ggmap)
tweetcsv<-read.csv(file.choose(), header=T) # input is 'flu.user.csv'
register_google(key =  "AIzaSyCRKNLS1QGT74Fq1IrYuUpVkH3FQw3_reg") 
latlon <- geocode(as.character(tweetcsv$location), override_limit = TRUE, source = "google")
latlon
write.csv(latlon, "allflu_latlon.csv")

library(ggmap)
library(stringr)
d <- read.csv(file.choose(), header=T) # input is 'flu_latlon.csv'
x <- subset(d,lon != 'NA')
result <- data.frame()
for(i in 1:nrow(x)){
  row <- x[i,]
  latlon <- c(row$lon,row$lat)
  latlon <- revgeocode(as.numeric(latlon))
  if(!is.na(latlon)){
    addr<-c(as.character(unlist(strsplit(latlon,","))))
    result<-rbind(result,data.frame(str_sub(addr[3],2,3)))
  }
}
result
write.csv(result, "flu_StateCode.csv")

tweetStates <- read.csv(file.choose(),header = T) 
groupStates <- data.frame(table(tweetStates$str_sub.addr.3...2..3.))
write.csv(groupStates, "combinedFreq.csv")


# Generate heatmap to represent number tweets from each state in USA.
library(plotly)
HeatMap <- read.csv(file.choose(), header=T) # input is 'StateFreq.csv'
p <- plot_geo(HeatMap, locationmode = 'USA-states') %>%
  add_trace(
    z = ~HeatMap$Freq, locations = ~HeatMap$Var1,
    color = ~HeatMap$Freq, colors = 'Greens' ) %>%
  colorbar(title = "Tweet Frequency") %>%
  layout(
    title = '2019 Frequency of Tweets on Flu Categorized by states',
    geo = list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showlakes = TRUE,
      lakecolor = toRGB('white')
    )
  )

p







