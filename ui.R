#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- navbarPage("Contributors",
 tabPanel("Timeline",
  mainPanel(
    selectInput("person", "Choose a person:", choices = people),
    selectInput("repo", "Choose a repo:", choices = repos),
    plotOutput("timeline"), width = "100%", height = "100%"
  )
 ),
 tabPanel("Users",
    mainPanel(
      selectInput("personProfile", "Choose a person:", choices = people),
      plotOutput("userProfile")
    )
  ),
  tabPanel("Repos",
    mainPanel(
      selectInput("repoProfile", "Choose a repo:", choices = repos),
      plotOutput("repoProfile")
    )
  )
)

