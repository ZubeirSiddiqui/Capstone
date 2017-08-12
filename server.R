# server.R ####
# Coursera Data Science Capstone Project (https://www.coursera.org/course/dsscapstone)
# Shiny server script
# Developer: Zubeir Siddiqui
# Date: 6th August 2017

# Libraries and options ####
source('global.R')
source('Capstone_Scripts_To_Predict_Data.R')

library(shiny)
require(tm)

# Define application ####

shinyServer(function(input, output) {
  
  # Reactive statement for prediction function when user input changes ####
  prediction =  reactive( {
    
    # Get input
    inputText = tolower(input$text)
    nSuggestion = input$slider
    
    # Predict
    prediction = fun.predict(inputText, n = nSuggestion)
  })
  
  # Output data table ####
  output$table = renderDataTable(prediction(),
                                 option = list(pageLength = 5,
                                               lengthMenu = list(c(5, 10, 100), c('5', '10', '100')),
                                               columnDefs = list(list(visible = F, targets = 1))
                                 )
  )
  
  # Output word cloud ####
  wordcloud_rep = repeatable(wordcloud)
  output$wordcloud = renderPlot(
    wordcloud_rep(
      prediction()$NextWord,
      prediction()$Frequency,
      colors = brewer.pal(8, 'Dark2'),
      scale=c(8, 0.5),
      max.words = 100
    )
  )
})