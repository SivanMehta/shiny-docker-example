source('viz/generate-fake-data.R')
library(ggplot2)

reset.day <- function(df) {
  year(df$local.day) <- 2016
  df$local.time <- df$local.day
  day(df$local.time) <- 1
  month(df$local.time) <- 1
  tz(df$local.time) <- 'America/Los_Angeles'
  return(df)
}

tibble(x = as.Date(round(runif(n) * 365), origin = '2016/01/01'), y = rnorm(n)) %>% 
  ggplot() + 
    aes(x, y) + 
    geom_point()
