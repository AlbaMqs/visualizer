#' input_get
#'
#' Get value of an input
#'
#' @param input Standard Shiny parameters
#' @param id ID of geom
#' @param parameter Name of the parameter
#'
#' @return Value of the parameter

input_get <- function(input, id, parameter){
  widget <- paste0(id, "_", parameter)
  out <- input[[widget]]

  return(out)
}
