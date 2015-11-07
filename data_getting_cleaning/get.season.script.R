## get.seasons.script: given data frame seasons.data from "get.seasons" function,
## scrape through pages on chakoteya.net/NextGen to get stardate from the script

get.seasons.script <- function(seasons.data){
     require(lubridate)
     require(dplyr)
     episodes <- substr(seasons.data$Production,1,3)
     episode.url <- character()
     episode.content <- character()
     stardate <- character()
     for(i in 1:length(episodes)){
         print(i)
         episode.url[i] <- paste("http://www.chakoteya.net/NextGen/",episodes[i],".htm", sep="")
         con <- url(episode.url[i])
         stardate.candidate.lines <- readLines(con,20)[1:20]
         stardate[i] <- stardate.candidate.lines[grep("([0-9]{5}|Unknown)",stardate.candidate.lines)]
         #stardate[i] <- readLines(con, 14)[14]
         close(con)
         
          # episode.content <- read_html(episode.url[i])
          
         # episode.content[i] <- episode.content %>% html_text()
     }
     remove.br <- function(x){
          if(x == "Unknown"){
               "Unknown"
          } else{
               substr(x, 1, nchar(x)-4)
          }
     }
     stardate.no.br <- as.numeric(unname(sapply(stardate, remove.br)))
     seasons.data <- cbind(seasons.data, stardate = stardate.no.br)
     names(seasons.data) <- c("episode.name","episode.num","airdate","season","stardate")
     seasons.data$airdate <- dmy(gsub("Sept","Sep",seasons.data$airdate))
     seasons.data$airdate[seasons.data$airdate == mdy("10/19/1982")] <- mdy("10/19/1992")
     
     seasons.data
}