#install.packages("shiny")
library(shiny)

shinyUI( pageWithSidebar(
  #  Title
  headerPanel("Welcome to Number Game!"),
  
  sidebarPanel(
    textInput('guess', 'Number', value = ""),
    actionButton("goButton", "Roll..")
  ), 
  mainPanel(
    h2('Guess an integer between 1 and 50'),
    h5('Lets see if you can beat the Machine !'),
    h3('Results'),
    h4('Your Entry'),
    verbatimTextOutput("inputValue"),
    h4('And the answer is ...'),
    verbatimTextOutput("outputValue")
   )
)
)