#' input_numeric
#'
#' Colour picker input
#'
#' @param id Panel ID
#' @param param Name of the parameter which this input control
#' @param label Label above the input
#' @param default Default value of the input
#' @param mode Mode where parameter is used
#'   \itemize{
#'     \item `"both"`: By default, widget appear in both mode
#'     \item `"advanced"`: Only advanced mode
#'     \item `"basic"`: Only basic mode
#'   }
#'
#' @importFrom colourpicker colorInput
#'
#' @return UI Numeric selector
#'
input_color <- function(id, param, label = "", default = "black", mode = "both"){
  div <- colourInput(
    inputId = paste0(id, "_", param),
    label = label,
    value = default
  )

  if(mode == "basic"){
    div <- conditionalPanel(
      condition = paste0("input.", id, "_mode == 'Basic'"),
      div,
    )
  }
  else if(mode == "advanced"){
    div <- conditionalPanel(
      condition = paste0("input.", id, "_mode == 'Advanced'"),
      div,
    )
  }

  return(div)
}
