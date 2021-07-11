# #' Title
# #'
# #' @export
# #' @importFrom shiny addResourcePath
# #' @importFrom htmltools tags
#' @title xxx
#' @export
useShinyToastify <- function(){
  toastifyInput()
  # addResourcePath(
  #   "wwwToastify",
  #   system.file(
  #     "www", "shinyToastify", "toastify",
  #     package = "shinyToastify"
  #   )
  # )
  # addResourcePath(
  #   "wwwReact",
  #   system.file(
  #     "www", "react",
  #     package = "reactR"
  #   )
  # )
  # tags$head(
  #   tags$script(src = "wwwReact/react.min.js"),
  #   tags$script(src = "wwwReact/react-dom.min.js"),
  #   tags$script(src = "wwwToastify/toastify.js")
  # )
}

#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#' @noRd
toastifyInput <- function(){
  createReactShinyInput(
    inputId = "ToastContainer-React-Toastify",
    class = "toastify",
    dependencies = htmlDependency(
      name = "toastify-input",
      version = "1.0.0",
      src = "www/shinyToastify/toastify",
      package = "shinyToastify",
      script = "toastify.js"
    ),
    default = NULL,
    configuration = list(),
    container = tags$div
  )
}

#' Title
#'
#' @param session
#' @param text
#' @param type
#' @param position
#' @param autoClose
#' @param hideProgressBar
#' @param newestOnTop
#' @param closeOnClick
#' @param rtl
#' @param pauseOnFocusLoss
#' @param draggable
#' @param pauseOnHover
#'
#' @return
#' @export
#'
#' @examples
showToast <- function(
  session,
  text,
  type = "default",
  position = "top-right",
  autoClose = 5000,
  hideProgressBar = FALSE,
  newestOnTop = FALSE,
  closeOnClick = TRUE,
  rtl = FALSE,
  pauseOnFocusLoss = TRUE,
  draggable = TRUE,
  pauseOnHover = TRUE
){
  stopifnot(isBoolean(hideProgressBar))
  stopifnot(isBoolean(newestOnTop))
  stopifnot(isBoolean(closeOnClick))
  stopifnot(isBoolean(rtl))
  stopifnot(isBoolean(pauseOnFocusLoss))
  stopifnot(isBoolean(draggable))
  stopifnot(isBoolean(pauseOnHover))
  message <- list(
    "text" = text,
    "type" = match.arg(
      type,
      c("info", "success", "warning", "error", "default", "dark")
    ),
    "config" = list(
      "position" = match.arg(
        position,
        c(
          "top-left", "top-right", "top-center",
          "bottom-left", "bottom-right", "bottom-center"
        )
      ),
      "autoClose" = autoClose,
      "hideProgressBar" = hideProgressBar,
      "newestOnTop" = newestOnTop,
      "closeOnClick" = closeOnClick,
      "rtl" = rtl,
      "pauseOnFocusLoss" = pauseOnFocusLoss,
      "draggable" = draggable,
      "pauseOnHover" = pauseOnHover
    )
  )
  session$sendCustomMessage("shinyToastify", message)
}
