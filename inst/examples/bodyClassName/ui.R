library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".bodystyle {",
  "  font-size: 30px;",
  "  font-family: cursive;",
  "}"
)

shinyUI(
  fluidPage(
    useShinyToastify(),
    tags$head(tags$style(CSS)),
    br(),
    helpText("This example illustrates the 'bodyClassName' option."),
    br(),
    actionButton("btn", "Show toast", class = "btn-primary btn-lg")
  )
)
