# ui.R ####
# Coursera Data Science Capstone Project (https://www.coursera.org/course/dsscapstone)
# Shiny UI script
# Developer: Zubeir Siddiqui
# Date: 6th August 2017

# Libraries and options ####
library(shiny)
library(shinythemes)

# Define the app ####

shinyUI(
  fluidPage(
  # Theme
  theme = shinytheme("slate"),
  navbarPage("Tab Navigation:",id ="navpanel",
  tabPanel("Application Home",
  
  # Application title
  titlePanel("Next Word Prediction Application: Data Science Capstone Project"),
  
  # Sidebar ####    
  sidebarLayout(
    
    sidebarPanel(
      
      # Text input
      textInput("text", label = ('Enter word/phrase to get suggestions'), value = ''),
      
      # Number of words slider input
      sliderInput('slider',
                  'Set maximum number of preficted words',
                  min = 0,  max = 100,  value = 5
      ),
      
      # Table output
      dataTableOutput('table')),
    
    # Mainpanel ####
    
    mainPanel(
      
      wellPanel(
        
        h4('Word cloud for suitable choice of next word'),   
        # Wordcloud output
        plotOutput('wordcloud'),
        hr()
      )
    ) 
  )
)
,
tabPanel("References",
         
         # Application title
         h3("1. Instructions"),
         hr(),
         HTML('<div class="sidebarStyle">'),
         HTML("<p>This Shiny App predicts the next word based on the text you typed."),
         HTML("<br><br>The input fields are as follows:"),
         HTML("<li><b>Enter word/phrase</b>: Text entered for prediction of next word."),
         HTML("<br>"),
         HTML("<li><b>No. of Predictions</b>: Number of words that the application will predict."),
         HTML("<br>"),
         hr(),
         HTML("The below output will be produced reactively as you type."),
         HTML("<br>"),
         hr(),
         HTML("<li><b>Predicted Next Word</b>: The predicted next word(s), shown when the app detects that you have finsihed typing one or more words."),
         HTML("<li><b>Last Word Being Typed</b>: The predicted word(s) being typed, shown when the app detects that you are typing a word partially."),
         hr(),
         HTML('<div class="instructionsColorTime">Please allow a few seconds for the output to appear.</div>'),
         hr(),
         h3("2. References"),
         HTML("Following are references provided to get additional understanding and code of application."),
         hr(),
  # Mainpanel ####
           
           mainPanel(
              wellPanel(
               h4(helpText(a('App location on Shiny',
                             href='https://zubeir321.shinyapps.io/Word_Prediction/',
                             target = '_blank'))
               ),
               # Link to report
               h4(helpText(a('More information on the project',
                          href='Word-Prediction-Shiny-App', 
                          target = '_blank'))
               ),
               
               # Link to repo
               h4(helpText(a('Code location on GitHub',
                          href='https://github.com/ZubeirSiddiqui/Capstone',
                          target = '_blank'))
               ),
               HTML('</div>'),
               hr(),
               h3("3. Solution partners:"),
               HTML("Following are our solution partners for project to provide data, technology and understanding."),
               hr(),
               img(src="http://images.hacktabs.com//2013/06/swiftkey_logo_feature.png", height=100, width=200),
               img(src="http://media.tumblr.com/92a71d62ace9940f8ddd540400444fc4/tumblr_inline_mppo32jFBC1qz4rgp.png", height=100, width=200),
               img(src="http://brand.jhu.edu/content/uploads/2014/06/university.logo_.small_.horizontal.blue_.jpg", height=100, width=200),
               HTML("</br>"),
               HTML('</div>')
             )
           )
       )
)
)
)



