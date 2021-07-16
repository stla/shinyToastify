library(shiny)
library(shinyToastify)
library(fontawesome)

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

    html <- #HTML(as.character(
      tags$span(
        fa_i("car", style = "color:yellow"),
        "Here is the <em>", toastPosition, "</em> position"
      )
    #))

    showToast(
      session,
      input,
      text = html,
      type = "success",
      transition = "zoom",
      position = toastPosition,
      autoClose = FALSE,
      style = list(boxShadow = "rgba(0, 0, 0, 0.56) 0px 22px 30px 4px")
    )

  })

}

shinyApp(ui, server)

