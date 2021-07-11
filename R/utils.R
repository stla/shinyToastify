isBoolean <- function(x){
  is.logical(x) && (length(x) == 1L) && !is.na(x)
}

isString <- function(x){
  is.character(x) && (length(x) == 1L) && !is.na(x)
}

isNumber <- function(x){
  is.numeric(x) && (length(x) == 1L) && !is.na(x)
}
