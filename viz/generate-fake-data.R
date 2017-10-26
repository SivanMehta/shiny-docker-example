library(jsonlite)
library(lubridate)
library(dplyr)

people <- fromJSON("viz/fake-people.json")
repos <- fromJSON("viz/fake-repos.json")
messages <- fromJSON("viz/fake-messages.json")
num.contributions <- length(people) * length(repos) * 100

generate.col <- function(from) {
  sample(from, num.contributions, replace=TRUE)
}

data <- tibble(
  username = generate.col(people),
  repo = generate.col(repos),
  timestamp = 1, # make uniform distribution of days, but normal distribution of time centered at noon
  type = generate.col(c("pr", "commit")),
  message = generate.col(messages)
)
