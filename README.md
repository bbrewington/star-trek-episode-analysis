# star-trek-episode-analysis
Scrape Star Trek episode info from the web, and analyze the data.  This is probably one of the nerdiest pieces of online content I've ever created :)

##### This code is written in R

### Usage:

1. Git clone this repo to your computer, and set it as the working directory
2. Source the parent function: `source(star.trek.episode.analysis.R)`
3. Run the parent function: `star.trek.episode.analysis()`
4. The functions in the "/vizualization" subfolder are called by the parent function, and generate 1 plot each

To get the full text of all seasons, first run the child function "/data_getting_cleaning/get.seasons.R" to get a data frame of the seasons, then use the function in "data_getting_cleaning/get.season.script.R", with adjustments to the code shown below, to get a different # of lines with the "readLines" part.

    for(i in 1:length(episodes)){
             print(i)
             episode.url[i] <- paste("http://www.chakoteya.net/NextGen/",episodes[i],".htm", sep="")
             con <- url(episode.url[i])
             stardate.candidate.lines <- readLines(con,20)[1:20]
             stardate[i] <- stardate.candidate.lines[grep("([0-9]{5}|Unknown)",stardate.candidate.lines)]
             close(con)
    }
    
### Example Plot:

![](https://pbs.twimg.com/media/CTOzLY4WEAAidnW.png:large)
