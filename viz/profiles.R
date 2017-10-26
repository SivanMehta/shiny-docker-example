source('viz/generate-fake-data.R')

# hard coded data that will be interactive in the future
person <- "Lucy"
since <- as.Date("2016/11/01")
repository <- "Mecifgog"

# user profile
data %>%
  filter(username == person) %>%
  group_by(repo) %>%
  summarise(count = n()) %>%
  mutate(repo = reorder(repo, count)) %>%
  ggplot() +
    aes(repo, count) +
    geom_col() +
    labs(x = "Repository", y = 'Relative Experience',
         title = paste("Experience by", person, "per Repository")) +
    coord_flip()

# repo profile
data %>%
  filter(repo == repository) %>%
  group_by(username) %>%
  summarise(count = n()) %>%
  mutate(username = reorder(username, count)) %>%
  ggplot() +
  aes(username, count) +
  geom_col() +
  labs(x = "username", y = 'Relative Experience', 
       title = paste("Experience in", repository, "per User")) +
  coord_flip()
