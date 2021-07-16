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
  icons <- c(
    "error"   = "times",
    "info"    = "info",
    "success" = "check",
    "warning" = "exclamation",
    "default" = "thumbs-up",
    "dark"    = "moon"
  )
  types <- names(icons)

  observeEvent(input[["btn"]], {

    i <- 1L + (input[["btn"]] %% 6L)

    toastPosition <- toastPositions[i]
    icon          <- icons[i]
    type          <- types[i]

    html <- tags$span(
      fa_i(icon, style = "font-size:2rem; vertical-align:middle;"),
      "&nbsp;", "Here is the <em>", toastPosition, "</em> position"
    )

    showToast(
      session,
      input,
      text = html,
      type = type,
      transition = "zoom",
      position = toastPosition,
      autoClose = FALSE,
      style = list(boxShadow = "rgba(0, 0, 0, 0.56) 0px 22px 30px 4px")
    )

  })

}

shinyApp(ui, server)

