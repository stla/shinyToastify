library(shiny)
library(shinyToastify)

shinyServer(
  function(input, output, session){

    observeEvent(input[["initialToast"]], {

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
)

