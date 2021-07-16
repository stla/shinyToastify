library(shiny)
library(shinyToastify)

shinyUI(
  fluidPage(
    useShinyToastify(),
    br(),
    actionButton("btn", "Show toast", class = "btn-primary btn-lg")
  )
)
