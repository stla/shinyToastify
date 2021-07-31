library(shiny)
library(shinyToastify)

shinyUI(
  fluidPage(
    useShinyToastify(),
    br(),
    helpText(
      "This example illustrates the", tags$code("toastUpdate"), "function."
    ),
    helpText(
      "As you can observe, the JavaScript callback of the updated toast is not",
      "executed if the updated toast is at the same position as the initial",
      "toast."
    ),
    tags$hr(),
    actionButton("initialToast", "Initial toast", class = "btn-success btn-lg"),
    br(), tags$hr(), br(),
    wellPanel(
      style = "width: fit-content; background-color: lemonchiffon;",
      actionButton("update", "Update toast", class = "btn-warning btn-block"),
      br(),
      radioButtons(
        "position", label = "Toast position", inline = TRUE,
        choices = c("top-right", "bottom-left")
      )
    )

  )
)
