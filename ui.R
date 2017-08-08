# ui.R ####
# Coursera Data Science Capstone Project (https://www.coursera.org/course/dsscapstone)
# Shiny UI script
# Developer: Zubeir Siddiqui
# Date: 6th August 2017

# Libraries and options ####
library(shiny)
library(shinythemes)
# setwd("C:/Users/zubeir/Desktop/DataScience/capstone/Word_Prediction")

# Define the app ####

shinyUI(fluidPage(
  
  # Theme
  theme = shinytheme("slate"),
  
  # Application title
  titlePanel("Word Predictor"),
  
  # Sidebar ####    
  sidebarLayout(
    
    sidebarPanel(
      
      # Text input
      textInput("text", label = ('Enter one or more words to get suggestions'), value = ''),
      
      # Number of words slider input
      sliderInput('slider',
                  'Set maximum number of suggested words',
                  min = 0,  max = 100,  value = 5
      ),
      
      # Table output
      dataTableOutput('table')),
    
    # Mainpanel ####
    
    mainPanel(
      
      wellPanel(
        
        # Link to application
        helpText(a('App location on Shiny',
                   href='https://zubeir321.shinyapps.io/Word_Prediction/',
                   target = '_blank')
        ),
        
        # Link to report
        helpText(a('More information on the project',
                   href='Word-Prediction-Shiny-App', 
                   target = '_blank')
        ),
        
        # Link to repo
        helpText(a('Code location on GitHub',
                   href='https://github.com/ZubeirSiddiqui/Capstone',
                   target = '_blank')
        ),
        
        # Wordcloud output
        plotOutput('wordcloud')
      )
    ) 
  )
)
)