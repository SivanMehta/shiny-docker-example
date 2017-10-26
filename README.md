# R Tasks

1. Generate fake contributor data where each row is as follows:
  - `username` --> from random list of 20 names
  - `timestamp` --> normally distributed over 1 day, uniformly throughout the year
  - `repository` --> random from list of 100 repositories
  - `type` --> either "pr" or "commit"
  - `message`? (optional) --> just a join of random words

2. Load and preprocess data on server start
3. Visualize every contribution as "landing page" of shiny app
4. User, Repo Profile (predefined, but make easily configurable)

# Docker Tasks

1. Create barebones Shiny app
2. Make (1) use a Dockerfile to ensure dependencies exist (eg. `tidyverse`)
3. Deploy (2) to Heroku with Dockerfile as basis for app

# Shiny Tasks

1. Integrate R visualizations into barebones app
2. Deploy complex app
