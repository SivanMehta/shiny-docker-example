# hard coded data that will be interactive in the future
since <- as.Date("2016/11/01")

form.title <- function(selector, profile.type) {
  paste(
    ifelse(nchar(selector), selector, paste('Every ', profile.type, sep = '')),
    "'s experience ranked by ",
    ifelse(profile.type == 'repo', 'user', 'repo'),
    sep = ''
  )
}

plot.repo.profile <- function(repo) {
  repo.filter <- ifelse(nchar(repo), repo, '.')
  graph.title <- form.title(repo, 'repo')
  data %>%
    filter(grepl(repo.filter, repo)) %>%
    group_by(username) %>%
    summarise(count = n()) %>%
    mutate(username = reorder(username, count)) %>%
    ggplot() +
      aes(username, count) +
      geom_col() +
      labs(x = "User", y = 'Relative Experience', title = graph.title) +
      coord_flip()
}

plot.user.profile <- function(username) {
  username.filter <- ifelse(nchar(username), username, '.')
  graph.title <- form.title(username, 'user')
  data %>%
    filter(grepl(username.filter, username)) %>%
    group_by(repo) %>%
    summarise(count = n()) %>%
    mutate(repo = reorder(repo, count)) %>%
    ggplot() +
      aes(repo, count) +
      geom_col() +
      labs(x = "Repository", y = 'Relative Experience', title = graph.title) +
      coord_flip()
}
