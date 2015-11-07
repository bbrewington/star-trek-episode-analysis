## get.seasons: Scrapes through webpage showing 7 different tables of season data, and combines
## data into one data frame called "seasons.data", with a column added for season #

get.seasons <- function(){
     require(rvest)
     
     url <- "http://www.chakoteya.net/NextGen/episodes.htm"
     table_id <- c(3,5,7,9,11,13,15)
     
     season1 <- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[3]/td[2]/table") %>%
          html_table()
     names(season1[[1]]) <- season1[[1]][1,]
     season1[[1]] <- season1[[1]][2:length(season1[[1]][,1]),]
     season1[[1]]$season <- 1
     
     season2<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[5]/td[2]/table") %>%
          html_table()
     names(season2[[1]]) <- season2[[1]][1,]
     season2[[1]] <- season2[[1]][2:length(season2[[1]][,1]),]
     season2[[1]]$season <- 2
     
     season3<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[7]/td[2]/table") %>%
          html_table()
     names(season3[[1]]) <- season3[[1]][1,]
     season3[[1]] <- season3[[1]][2:length(season3[[1]][,1]),]
     season3[[1]]$season <- 3
     
     season4<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[9]/td[2]/table") %>%
          html_table()
     names(season4[[1]]) <- season4[[1]][1,]
     season4[[1]] <- season4[[1]][2:length(season4[[1]][,1]),]
     season4[[1]]$season <- 4
     
     season5<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[11]/td[2]/table") %>%
          html_table()
     names(season5[[1]]) <- season5[[1]][1,]
     season5[[1]] <- season5[[1]][2:length(season5[[1]][,1]),]
     season5[[1]]$season <- 5
     
     season6<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[13]/td[2]/table") %>%
          html_table()
     names(season6[[1]]) <- season6[[1]][1,]
     season6[[1]] <- season6[[1]][2:length(season6[[1]][,1]),]
     season6[[1]]$season <- 6
     
     season7<- url %>% read_html() %>%
          html_nodes(xpath="/html/body/table/tbody/tr[15]/td[2]/table") %>%
          html_table()
     names(season7[[1]]) <- season7[[1]][1,]
     season7[[1]] <- season7[[1]][2:length(season7[[1]][,1]),]
     season7[[1]]$season <- 7
     
     seasons.data <- rbind(season1[[1]],season2[[1]],season3[[1]],season4[[1]],season5[[1]],season6[[1]],season7[[1]])
     
     seasons.data
}
