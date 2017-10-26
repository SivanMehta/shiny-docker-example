print('Loading dependencies..')
library(shiny)
library(ggplot2)
library(dplyr)
library(lubridate)

print('Loading JSON data....')
people <- fromJSON("preboots/fake-people.json")
repos <- fromJSON("preboots/fake-repos.json")
messages <- fromJSON("preboots/fake-messages.json")
num.contributions <- length(people) * length(repos) * 100

generate.col <- function(from) {
  sample(from, num.contributions, replace = TRUE)
}

jitter.dates <- function(dates) {
  date.count <- length(dates)

  # normal distribution of minutes, with 95% percent falling in + or - 4 hours from center
  jittered.minutes <- round(rnorm(date.count, sd = .5) * 120)
  jittered.dates <- ymd_hms(as.Date(dates) +
                              # center around 1pm (midpoint of a 9-5 schedule)
                              hours(12) + minutes(jittered.minutes))

  return(jittered.dates)
}


print('Generating dataset....')
times = seq(as.Date('2016/01/01'), as.Date('2017/01/01'), length.out = num.contributions) %>%
  jitter.dates()

data <- tibble(
  username = generate.col(people),
  repo = generate.col(repos),
  type = generate.col(c("pr", "commit")),
  timestamp = times,
  message = generate.col(messages)
)

print('Cleaning up environment...')
rm(times, jitter.dates, people, repos, messages, num.contributions, generate.col)
