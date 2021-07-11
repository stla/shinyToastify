library(shiny)
library(shinyToastify)

shinyServer(
  function(input, output, session){

    observeEvent(input[["btn"]], {

      toastType <- input[["type"]]

      html <- HTML(
        '<span style="font-size: 30px; font-family: cursive;">',
        paste0(toastType, " toast"),
        '</span>'
      )

      showToast(
        session,
        text = html,
        type = toastType,
        transition = input[["transition"]],
        autoClose = 3000
      )

    })

  }
)

