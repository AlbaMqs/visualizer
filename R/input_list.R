#' input_list
#'
#' Basic list input
#'
#' @param id Panel ID
#' @param param Name of the parameter which this input control
#' @param label Label above the input
#' @param choices Vector of choices in the list
#' @param mode Mode where parameter is used
#'   \itemize{
#'     \item `"both"`: By default, widget appear in both mode
#'     \item `"advanced"`: Only advanced mode
#'     \item `"basic"`: Only basic mode
#'   }
#'
#' @return UI List
#'
input_list <- function(id, param, label = "", choices, mode = "both") {
  div <- selectInput(
    inputId = paste0(id, "_", param),
    label = label,
    choices,
    selected = choices[1]
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
