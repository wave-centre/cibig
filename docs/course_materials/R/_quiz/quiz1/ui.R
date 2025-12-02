library(shiny)
library(shinyjs)
library(timeR)

timer <<- timeR::createTimer(precision = "s")
timer$start("quizz")
timer$toggleVerbose()

fluidPage(
  useShinyjs(),         # for hide/show
  textOutput("timer"),
  textInput("student", "Enter your full name:"),
  
  uiOutput("mcq_ui"),
  uiOutput("code_ui"),
  
  actionButton("submit", "Submit Answers"),
  actionButton("quit", "Quit", style = "display:none;"),
  br(),
  textOutput("result")
)
