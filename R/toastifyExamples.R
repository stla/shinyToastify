#' @title Shiny Toastify examples
#' @description List of examples.
#'
#' @return No return value, just prints a message listing the example names.
#'
#' @export
#'
#' @examples
#' shinyToastifyExamples()
#' if(interactive()){
#'   shinyToastifyExample("TypeAndTransition")
#' }
shinyToastifyExamples <- function(){
  Folder <- system.file("examples", package = "shinyToastify")
  Examples <- list.dirs(Folder, full.names = FALSE, recursive = FALSE)
  message("Shiny Toastify examples: ", toString(Examples), ".")
  message('Type `shinyToastifyExample("ExampleName")` to run an example.')
}

#' @title Run a Shiny Toastify example
#' @description A function to run examples of Shiny apps using the
#'   \code{shinyToastify} package.
#'
#' @param example example name
#' @param display.mode the display mode to use when running the example; see
#'   \code{\link[shiny:runApp]{runApp}}
#' @param ... arguments passed to \code{\link[shiny:runApp]{runApp}}
#'
#' @return No return value, just launches a Shiny app.
#'
#' @export
#' @importFrom shiny runApp
#'
#' @examples
#' if(interactive()){
#'   shinyToastifyExample("bodyClassName")
#' }
#' if(interactive()){
#'   shinyToastifyExample("className")
#' }
#' if(interactive()){
#'   shinyToastifyExample("progressClassName")
#' }
#' if(interactive()){
#'   shinyToastifyExample("TypeAndTransition")
#' }
shinyToastifyExample <- function(example, display.mode = "showcase", ...) {
  Folder <- system.file("examples", package = "shinyToastify")
  Examples <- list.dirs(Folder, full.names = FALSE, recursive = FALSE)
  if(example %in% Examples){
    appname <- normalizePath(file.path(Folder, example))
    runApp(appname, display.mode = display.mode, ...)
  }else{
    stop(
      "Could not find example: '", example, "'.",
      "\nAvailable examples are: ", paste0(Examples, collapse = ", "), "."
    )
  }
}
