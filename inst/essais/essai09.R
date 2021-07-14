library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
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
      autoClose = FALSE,
      style = list(boxShadow = "rgba(0, 0, 0, 0.56) 0px 22px 30px 4px")
    )

  })

}

shinyApp(ui, server)

