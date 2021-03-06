plot.timeline <- function(person = "", repo = "") {
  localized.day <- function(day) {
    localized <- day
    month(localized) <- 1
    day(localized) <- 1
    year(localized) <- 2016
    localized
  }

  person.filter <- ifelse(nchar(person), person, '.')
  repo.filter <- ifelse(nchar(repo), repo, '.')

  data %>%
    mutate(is.highlighted = (grepl(person.filter, username) & grepl(repo.filter, repo))) %>%
    mutate(local.day = localized.day(timestamp)) %>%
    ggplot() +
      aes(x = timestamp, y = local.day, color = is.highlighted, alpha = is.highlighted) +
      geom_point() +
      ylim('2016/01/02', '2016/01/01') +
      labs(x = 'Date', y = 'Time of Day') +
      scale_colour_manual(values = c("grey", "black")) +
      scale_alpha_manual(values = c(.1, 1)) +
      scale_size_manual(values = c(1, 3)) +
      theme(legend.position="none")
}