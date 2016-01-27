library(shiny)

# Welcome to Number Game
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