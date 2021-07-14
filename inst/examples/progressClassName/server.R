library(shiny)
library(shinyToastify)

shinyServer(
  function(input, output, session){

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
        autoClose = 5000,
        progressClassName = "prgbar"
      )

    })

  }
)
