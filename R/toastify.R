#' @title Use Shiny toastify
#' @description This function must be called once in your Shiny \code{ui} to
#'   allow to use \code{\link{showToast}}.
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#' @export
useShinyToastify <- function(){
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

#' @title Show a toast
#' @description Show a toast in a Shiny application.
#'
#' @param session the Shiny \code{session} object
#' @param input the Shiny \code{input} object
#' @param text the text displayed in the toast, a character string or an html
#'   element created with the \code{\link[htmltools:HTML]{HTML}} function
#' @param type toast type, one of \code{"info"}, \code{"success"},
#'   \code{"warning"}, \code{"error"}, \code{"default"} or \code{"dark"}
#' @param position toast position, one of \code{"top-left"},
#'   \code{"top-right"}, \code{"top-center"}, \code{"bottom-left"},
#'   \code{"bottom-right"} or \code{"bottom-center"}
#' @param transition the transition effect, one of \code{"slide"},
#'   \code{"zoom"}, \code{"flip"} or \code{"bounce"}
#' @param autoClose either a number, the time in ms to close the toast, or
#'   \code{FALSE} to close the toast manually
#' @param hideProgressBar Boolean, whether to hide the progress bar
#' @param newestOnTop ??????
#' @param closeOnClick Boolean, whether to dismiss the toast on click
#' @param rtl Boolean, right to left
#' @param pauseOnFocusLoss Boolean, whether to pause the toast on focus loss
#' @param draggable Boolean, ability to drag the toast
#' @param draggableDirection \code{"x"} or \code{"y"}
#' @param pauseOnHover Boolean, whether to pause the toast on hover
#' @param Rcallback a R function without arguments to be executed when the
#'   toast is close
#' @param JScallback some JavaScript code given as a string to be executed
#'   when the toast is close
#'
#' @export
#' @importFrom utils URLencode
#' @importFrom shiny observeEvent
#'
#' @examples
showToast <- function(
  session,
  input,
  text,
  type = "default",
  position = "top-right",
  transition = "slide",
  autoClose = 5000,
  hideProgressBar = FALSE,
  newestOnTop = FALSE,
  closeOnClick = TRUE,
  rtl = FALSE,
  pauseOnFocusLoss = TRUE,
  draggable = TRUE,
  draggableDirection = "x",
  pauseOnHover = TRUE,
  Rcallback = function(){NULL},
  JScallback = NULL
){
  stopifnot(isString(type))
  stopifnot(isString(position))
  stopifnot(isString(transition))
  stopifnot(isBoolean(hideProgressBar))
  stopifnot(isBoolean(newestOnTop))
  stopifnot(isBoolean(closeOnClick))
  stopifnot(isBoolean(rtl))
  stopifnot(isBoolean(pauseOnFocusLoss))
  stopifnot(isBoolean(draggable))
  stopifnot(isString(draggableDirection))
  stopifnot(isBoolean(pauseOnHover))
  stopifnot(isNumber(autoClose) || isFALSE(autoClose))
  stopifnot(isFunction(Rcallback))
  if(!is.null(formals(Rcallback))){
    stop(
      "The `Rcallback` argument must a function without arguments.",
      call. = TRUE
    )
  }
  stopifnot(is.null(JScallback) || isString(JScallback))
  if(inherits(text, "html")){
    text <- list("__html" = URLencode(as.character(text)))
  }else if(!isString(text)){
    stop(
      "The `text` argument must be either an ordinary character string or ",
      "a html string created with the `HTML` function.",
      call. = TRUE
    )
  }
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
      "transition" = match.arg(
        transition,
        c("slide", "zoom", "flip", "bounce")
      ),
      "autoClose" = autoClose,
      "hideProgressBar" = hideProgressBar,
      "newestOnTop" = newestOnTop,
      "closeOnClick" = closeOnClick,
      "rtl" = rtl,
      "pauseOnFocusLoss" = pauseOnFocusLoss,
      "draggable" = draggable,
      "draggableDirection" = match.arg(draggableDirection, c("x", "y")),
      "pauseOnHover" = pauseOnHover
    ),
    "JScallback" = if(!is.null(JScallback)) URLencode(JScallback)
  )
  session$sendCustomMessage("shinyToastify", message)
  observeEvent(input[["shinyToastifyOnClose"]], {
    Rcallback()
  }, once = TRUE)
}
