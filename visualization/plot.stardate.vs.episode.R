## plot.stardate.vs.episode: given seasons.data data frame, creates a plot using ggplot, and
## colors points by season

plot.stardate.vs.episode <- function(seasons.data){
     p2 <- ggplot(seasons.data, aes(as.numeric(episode.num), stardate, color=factor(season))) + 
               geom_point(size=2) +
               ggtitle("Star Trek TNG: Stardate vs. Episode #") +
               ylab("Stardate") +
               xlab("Episode #") +
               scale_color_discrete(name="Season #", 
                          breaks=rev(levels(factor(seasons.data$season))), 
                          labels=rev(levels(factor(seasons.data$season)))) + 
               geom_line()
     
     print(p2)
}