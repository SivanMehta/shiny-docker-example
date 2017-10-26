rm(list = ls())
source('preboots/generate-fake-data.R')
source('preboots/plotters.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$timeline <- renderPlot({
    plot.timeline()
  })

  output$userProfile <- renderPlot({
    plot.user.profile('Lucy')
  })

  output$repoProfile <- renderPlot({
   plot.repo.profile('Mecifgog')
  })
})
