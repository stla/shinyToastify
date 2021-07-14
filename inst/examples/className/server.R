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
        text = paste0("Here is the ", toastPosition, " position"),
        type = "dark",
        transition = "flip",
        position = toastPosition,
        autoClose = 3000,
        className = "toaststyle"
      )

    })

  }
)
