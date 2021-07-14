library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".toaststyle {",
  "  border-style: solid;",
  "  border-color: orange;",
  "  border-width: 7px;",
  "}"
)

shinyUI(
  fluidPage(
    useShinyToastify(),
    tags$head(tags$style(CSS)),
    br(),
    helpText(
      "This example illustrates the 'className' option.",
      "Alternatively, you can use the 'style' option:"
    ),
    tags$p(tags$code(
      'style = list(borderStyle = "solid", borderColor = "orange", borderWidth = "7px")'
    )),
    br(),
    actionButton("btn", "Show toast", class = "btn-primary btn-lg")
  )
)
