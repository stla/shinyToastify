library(shiny)
library(shinyToastify)

CSS <- HTML(
  ".bodystyle {",
  "  font-size: 30px;",
  "  font-family: cursive;",
  "}"
)

ui <- fluidPage(
  useShinyToastify(),
  tags$head(tags$style(CSS)),
  br(),
  helpText("This example illustrates the 'bodyClassName' option."),
  br(),
  actionButton("btn", "Show toast", class = "btn-primary btn-lg")
)

server <- function(input, output, session){

  toastTransitions <- c(
    "Zoom", "Bounce", "Flip", "Slide"
  )

  observeEvent(input[["btn"]], {

    toastTransition <- toastTransitions[1L + (input[["btn"]] %% 4L)]

    showToast(
      session,
      input,
      text = paste0(toastTransition, " transition"),
      type = "success",
      transition = tolower(toastTransition),
      autoClose = 3000,
      bodyClassName = "bodystyle"
    )

  })

}

shinyApp(ui, server)

