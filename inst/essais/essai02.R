library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  actionButton("btn", "Show toast")
)

server <- function(input, output, session){

  observeEvent(input[["btn"]], {

    showToast(
      session,
      HTML("<span style='color:yellow;'>YELLOW<span>"),
      type = "dark"
    )

  })

}

shinyApp(ui, server)

