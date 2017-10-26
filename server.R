# before server starts: 
# 	load dependencies
# 	define plotting functions
# 	pre-load profiles?
source('preboots/generate-fake-data.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$histogram <- renderPlot({
    
    # draw the histogram with the specified number of bins
    hist(rnorm(1000), main = input$plotType)
    
  })
  
  output$timeline <- renderPlot({
    tibble(x = runif(1000), y = rnorm(1000)) %>% ggplot() +
      aes(x, y) +
      geom_point()
  })
  
})
