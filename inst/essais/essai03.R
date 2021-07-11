library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  br(),
  actionButton("btn", "Show toast", class = "btn-primary")
)

server <- function(input, output, session){

  toastTypes <- c(
    "info", "success", "warning", "error", "default", "dark"
  )

  observeEvent(input[["btn"]], {

    toastType <- toastTypes[input[["btn"]]]
    html <- HTML(sprintf(
      '<span style="font-size: 30px; font-family: cursive;">%s</span>',
      paste0(toastType, " toast")
    ))

    showToast(
      session,
      text = html,
      type = toastType,
      transition = "flip",
      autoClose = 3000
    )

  })

}

shinyApp(ui, server)

