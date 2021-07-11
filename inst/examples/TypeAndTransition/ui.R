library(shiny)
library(shinyToastify)

shinyUI(
  fluidPage(
    useShinyToastify(),
    br(),
    actionButton("btn", "Show toast", class = "btn-primary btn-lg"),
    br(), br(),
    wellPanel(
      style = "width: fit-content;",
      radioButtons(
        "type", label = "Toast type", inline = TRUE,
        choices = c("info", "success", "warning", "error", "default", "dark")
      )
    ),
    wellPanel(
      style = "width: fit-content;",
      radioButtons(
        "transition", label = "Toast transition", inline = TRUE,
        choices = c("slide", "zoom", "flip", "bounce")
      )
    )
  )
)
