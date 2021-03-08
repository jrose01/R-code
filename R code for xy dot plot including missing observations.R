# R code for very cool x,y dot plot including NAs as a different color
ggplot(cars_info, aes(x = mpg, y = acceleration, color = horsepower)) + 
  geom_point(show.legend = TRUE) +
  labs(x = 'Mpg', y='Acceleration',  title = "Auto MPG",
       color = 'Horsepower') + 
  scale_color_gradient(low = "green", high = "red",
                       na.value = "blue", guide = "legend") +
  theme_minimal()+theme(legend.position="bottom")