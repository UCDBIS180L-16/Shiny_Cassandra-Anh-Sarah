#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a violin plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Rice Seed Data"),

  # Application description
  helpText("This application creates a violin plot to examine rice seed data",
           "from different regions and ancestral populations.",
           "Please use the radio boxes below to choose a trait",
           "for plotting and select coloring by region or population."),
    
  # Sidebar with a a radio box to input which trait will be plotted  
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Select a trait:",
                   c("Seed.number.per.panicle",
                     "Seed.length",
                     "Seed.width",
                     "Seed.volume",
                     "Seed.surface.area",
                     "Seed.length.width.ratio"
                     )
      )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("violinPlot")
    )
  )
))
))
