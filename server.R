rm(list = ls())
source('preboots/generate-fake-data.R')
source('preboots/plotters.R')
source('ui.R')
print('Starting server...')

server = function(input, output) {
  # timeline
  output$timeline <- renderPlot({
    plot.timeline(input$person, input$repo)
  })

  # profiles
  output$userProfile <- renderPlot({
    plot.user.profile(people[1])
  })

  output$repoProfile <- renderPlot({
   plot.repo.profile(repos[1])
  })
}


app <- shinyApp(ui, server)
runApp(app, port = 8080)
