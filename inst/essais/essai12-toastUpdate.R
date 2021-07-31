library(shiny)
library(shinyToastify)

ui <- fluidPage(
  useShinyToastify(),
  br(),
  helpText(
    "This example illustrates the", tags$code("toastUpdate"), "function."
  ),
  helpText(
    "As you can observe, the JavaScript callback of the updated toast is not",
    "executed if the updated toast is at the same position as the initial",
    "toast."
  ),
  tags$hr(),
  # br(),
  actionButton("btn", "Initial toast", class = "btn-success btn-lg"),
  br(), tags$hr(), br(),
  wellPanel(
    style = "width: fit-content; background-color: lemonchiffon;",
    actionButton("update", "Update toast", class = "btn-warning btn-block"),
    br(),
    radioButtons(
      "position", label = "Toast position", inline = TRUE,
      choices = c("top-right", "bottom-left")
    )
  )

)

server <- function(input, output, session){

  observeEvent(input[["btn"]], {

    html <- tags$span(
      style="font-size: 30px; font-family: cursive;", "I am the toast!"
    )

    showToast(
      session,
      input,
      id = "mytoast",
      text = html,
      type = "success",
      transition = "zoom",
      autoClose = FALSE,
      JScallback = "alert('Callback initial toast!')"
    )

  })

  observeEvent(input[["mytoast_closed"]], {
    showNotification(
      tags$span(
        style="font-size: 25px; font-family: cursive;",
        "The initial toast is closed now."
      )
    )
  })

  observeEvent(input[["update"]], {

    html <- tags$span(
      style="font-size: 30px; font-family: cursive;", "You updated the toast!"
    )

    toastUpdate(
      session,
      toastId = "mytoast",
      text = html,
      type = "warning",
      position = input[["position"]],
      transition = "bounce",
      autoClose = 4000,
      JScallback = "alert('Callback updated toast!!')"
    )

  })

}

shinyApp(ui, server)

