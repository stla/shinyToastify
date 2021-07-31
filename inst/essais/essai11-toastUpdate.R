library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  br(),
  actionButton("btn", "Show toast", class = "btn-primary btn-lg"),
  br(),
  actionButton("update", "Update toast", class = "btn-primary btn-lg"),
  br(), br(),
  wellPanel(
    style = "width: fit-content;",
    radioButtons(
      "type", label = "Toast type", inline = TRUE,
      choices = c("info", "success", "warning", "error", "default", "dark")
    )
  ),
  wellPanel(
    style = "width: fit-content;",
    radioButtons(
      "transition", label = "Toast transition", inline = TRUE,
      choices = c("slide", "zoom", "flip", "bounce")
    )
  )

)

server <- function(input, output, session){

  RV <- reactiveVal()

  observe({
    cat("RV:\n")
    print(RV())
  })

  observe({
    cat("test:\n")
    print(input[["test"]])
  })

  observe({
    cat("test2:\n")
    print(input[["test2"]])
  })

  observeEvent(input[["btn"]], {

    toastType <- input[["type"]]

    html <- HTML(sprintf(
      '<span style="font-size: 30px; font-family: cursive;">%s</span>',
      paste0(toastType, " toast")
    ))

    showToast(
      session,
      input,
      id = "mytoast",
      text = html,
      type = toastType,
      transition = input[["transition"]],
      autoClose = FALSE,
      Rcallback = function() RV(input[["btn"]]),
      JScallback = "Shiny.setInputValue('test', 'HELLO', {priority: 'event'})"
    )

  })

  observeEvent(input[["mytoast_closed"]], {
    cat("\n")
    print("id works")
  })

  observeEvent(input[["update"]], {

    html <- HTML(sprintf(
      '<span style="font-size: 30px; font-family: cursive;">%s</span>',
      "UPDATED TOAST"
    ))

    toastUpdate(
      session,
      # input,
      toastId = "mytoast",
      text = html,
      type = "default",
      position = "top-center",
      transition = "bounce",
      autoClose = 5000,
      Rcallback = function() RV(input[["btn"]]),
      JScallback = "Shiny.setInputValue('test2', 'HELLO2', {priority: 'event'})"
    )

  })

}

shinyApp(ui, server)

