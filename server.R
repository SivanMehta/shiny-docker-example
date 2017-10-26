# before server starts: 
# 	load dependencies
# 	define plotting functions
# 	pre-load profiles?
source('preboots/generate-fake-data.R')
source('preboots/plotters.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$histogram <- renderPlot({
    
    # draw the histogram with the specified number of bins
    hist(rnorm(1000), main = input$plotType)
    
  })
  
  output$timeline <- renderPlot({
    plot.timeline()
  })
  
})
