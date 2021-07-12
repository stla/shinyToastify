library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  br(),
  actionButton("btn", "Show toast", class = "btn-primary btn-lg")
)

server <- function(input, output, session){

  toastTransitions <- c(
    "Zoom", "Bounce", "Flip", "Slide"
  )

  observeEvent(input[["btn"]], {

    toastTransition <- toastTransitions[1L + (input[["btn"]] %% 4L)]

    html <- HTML(
      '<span style="font-size: 30px; font-family: cursive;">',
      paste0(toastTransition, " transition"),
      '</span>',
    )

    showToast(
      session,
      input,
      text = html,
      type = "success",
      transition = tolower(toastTransition),
      autoClose = 3000
    )

  })

}

shinyApp(ui, server)

