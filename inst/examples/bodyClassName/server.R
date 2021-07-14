library(shiny)
library(shinyToastify)

shinyServer(
  function(input, output, session){

    toastTransitions <- c(
      "Zoom", "Bounce", "Flip", "Slide"
    )

    observeEvent(input[["btn"]], {

      toastTransition <- toastTransitions[1L + (input[["btn"]] %% 4L)]

      showToast(
        session,
        input,
        text = paste0(toastTransition, " transition"),
        type = "success",
        transition = tolower(toastTransition),
        autoClose = 3000,
        bodyClassName = "bodystyle"
      )

    })

  }
)


