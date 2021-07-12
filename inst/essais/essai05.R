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

    toastTransition <- toastTransitions[input[["btn"]]]
    html <- HTML(sprintf(
      '<span style="font-size: 30px; font-family: cursive;">%s</span>',
      paste0(toastTransition, " transition")
    ))

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

