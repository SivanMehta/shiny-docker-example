plot.timeline <- function() {
  localized.day <- function(day) {
    localized <- day
    month(localized) <- 1
    day(localized) <- 1
    year(localized) <- 2016
    localized
  }

  data %>%
    mutate(local.day = localized.day(timestamp)) %>%
    ggplot() +
      aes(x = timestamp, y = local.day) +
      geom_point(size = 1) +
      ylim('2016/01/02', '2016/01/01') +
      labs(x = 'Date', y = 'Time of Day')
  
}