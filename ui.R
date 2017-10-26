#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
navbarPage("Contributors!",
 tabPanel("timeline",
  mainPanel(
    plotOutput("timeline", width = "100%")
  )
 ),
 tabPanel("Profiles",
  mainPanel(
    plotOutput("distPlot")
  )
 )
)