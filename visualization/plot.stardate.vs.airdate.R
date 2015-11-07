## plot.stardate.vs.airdate: given seasons.data data frame, creates a plot using ggplot, and
## colors points by season

plot.stardate.vs.airdate <- function(seasons.data){
     p1 <- ggplot(seasons.data, aes(airdate, stardate, color=factor(season))) + 
          geom_point(size=3) + 
          ggtitle("Star Trek TNG: Stardate vs. Airdate") +
          ylab("Stardate") +
          scale_color_discrete(name="Season #", 
                               breaks=rev(levels(factor(seasons.data$season))), 
                               labels=rev(levels(factor(seasons.data$season)))) + 
          geom_line()
     print(p1)
}