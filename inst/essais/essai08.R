library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".prgbar {",
  "  height: 20px;",
  "  background-color: firebrick;",
  "  background-image: linear-gradient(to right, firebrick, lime);",
  "}"
)

ui <- fluidPage(
  useShinyToastify(),
  tags$head(tags$style(CSS)),
  br(),
  helpText("This example illustrates the 'progressClassName' option."),
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
      text = HTML("Here is the <em>", toastPosition, "</em> position"),
      type = "dark",
      transition = "zoom",
      position = toastPosition,
      autoClose = 3000,
      progressClassName = "prgbar"
    )

  })

}

shinyApp(ui, server)

