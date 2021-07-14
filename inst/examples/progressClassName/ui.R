library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".prgbar {",
  "  height: 20px;",
  "  background-color: firebrick;",
  "  background-image: linear-gradient(to right, firebrick, lime);",
  "}"
)

shinyUI(
  fluidPage(
    useShinyToastify(),
    tags$head(tags$style(CSS)),
    br(),
    helpText("This example illustrates the 'progressClassName' option."),
    br(),
    actionButton("btn", "Show toast", class = "btn-primary btn-lg")
  )
)
