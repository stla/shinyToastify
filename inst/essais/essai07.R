library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".toaststyle {",
  "  border-style: solid;",
  "  border-color: orange;",
  "  border-width: 7px;",
  "}"
)

ui <- fluidPage(
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

server <- function(input, output, session){

  toastPositions <- c(
    "top-left", "top-right", "top-center",
    "bottom-left", "bottom-right", "bottom-center"
  )

  observeEvent(input[["btn"]], {

    toastPosition <- toastPositions[1L + (input[["btn"]] %% 6L)]

    showToast(
      session,
      input,
      text = paste0("Here is the ", toastPosition, " position"),
      type = "dark",
      transition = "flip",
      position = toastPosition,
      autoClose = 3000,
      className = "toaststyle"
    )

  })

}

shinyApp(ui, server)

