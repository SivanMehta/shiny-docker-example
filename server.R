rm(list = ls())
source('preboots/generate-fake-data.R')
source('preboots/plotters.R')

print('Starting server...')
shinyServer(function(input, output) {

  # timeline
  output$timeline <- renderPlot({
    plot.timeline()
  })

  output$personFilter <- renderUI({
    selectInput("Person", "Choose a person:", as.list(people))
  })

  output$repoFilter <- renderUI({
    selectInput("Repo", "Choose a repo:", as.list(repos))
  })

  # profiles
  output$userProfile <- renderPlot({
    plot.user.profile(people[1])
  })

  output$repoProfile <- renderPlot({
   plot.repo.profile(repos[1])
  })

  output$personSelector <- renderUI({
    selectInput("Person", "Choose a person:", as.list(people))
  })

  output$repoSelector <- renderUI({
    selectInput("Repo", "Choose a repo:", as.list(repos))
  })
})
