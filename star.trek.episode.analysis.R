## Parent function; calls child functions to get and plot data

star.trek.episode.analysis <- function(){
     source("data_getting_cleaning/get.seasons.R")
     seasons.data <- get.seasons()
     
     source("data_getting_cleaning/get.season.script.R")
     seasons.data.cleaned <- get.seasons.script(seasons.data)
     
     source("visualization/plot.stardate.vs.airdate.R")
     plot.stardate.vs.airdate(seasons.data.cleaned)
     
     source("visualization/plot.stardate.vs.episode.R")
     plot.stardate.vs.episode(seasons.data.cleaned)
}