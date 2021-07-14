isBoolean <- function(x){
  is.logical(x) && (length(x) == 1L) && !is.na(x)
}

isString <- function(x){
  is.character(x) && (length(x) == 1L) && !is.na(x)
}

isNumber <- function(x){
  is.numeric(x) && (length(x) == 1L) && !is.na(x)
}

isFunction <- function(x){
  inherits(x, "function")
}

dropNulls <- function(x){
  Filter(Negate(is.null), x)
}

isNamedList <- function(x){
  is.list(x) && !is.null(names(x)) && all(names(x) != "")
}
