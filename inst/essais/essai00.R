library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  # toastifyInput("xxx"),
  actionButton("btn", "Show toast")
)

server <- function(input, output, session){

  observeEvent(input[["btn"]], {

    session$sendCustomMessage("shinyToastify", "test")

  })

}

shinyApp(ui, server)

