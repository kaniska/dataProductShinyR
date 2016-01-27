---
title       : Magic Number Game
subtitle    : Guess a number to beat the Machine
author      : Kaniska
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Welcome to Number Game

shinyApp folder contains the code for Number Game

--- 

## Server Code


```r
library(shiny)
number <- floor(runif(1,1,51))
guessNumber <- function(guess, number) {
  result <- "Welcome to Number Game."
  if (guess > 50) {
    result <- 'You can not cross 50 ! \nNext lucky draw between 1 and 50.'
    }
  else if (guess < 1) {
    result <- 'Ooho Wrong choice! \n Choose a positive integer!'
    }
  else if (guess > number) {
    result <- 'You beat the machine ! You win !'
    }
  else if (guess < number) {
    result <- 'Hmm.. you scored lower than machine ! \nGood luck next time!'
    }
  else if (guess == number) {
    result <- 'Its a tie! \n Go for another shot!'
    }
  result
  }
shinyServer( 
  function(input, output) {
    output$inputValue <- renderPrint({as.numeric(input$guess)})
    output$outputValue <- renderText({
      if (input$goButton == 0) "Guess a Number!"
      else if (input$goButton >= 1) guessNumber(as.numeric(input$guess), number)
      })
    }
  )
```

---

## UI Code

library(shiny)

shinyUI( pageWithSidebar(

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


---

## Beat the Machine

Play the Game by invoking the command runApp("shinyApp") and follow the instructions on screen.  





