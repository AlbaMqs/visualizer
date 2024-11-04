#' input_variable
#'
#' Variable input, can be a variable, a numeric value or a formula
#'
#' @param id Panel ID
#' @param param Name of the parameter which this input control
#' @param mode Mode where parameter is used
#'   \itemize{
#'     \item `"both"`: Widget appear in both mode
#'     \item `"advanced"`: Only advanced mode
#'     \item `"basic"`: Only basic mode
#'     \item `"mixed"`: By default, multiple input choix only avalaible in advanced mode
#'   }
#' @param basic_choice Input choice avalaible in basic mode
#'   \itemize{
#'     \item `"numeric"`: By default, only numeric input avalaible in basic mode
#'     \item `"advanced"`: Only variable input avalaible in basic mode
#'     \item `"basic"`: Only numeric input avalaible in basic mode
#'  }
#'
#' @return UI List
#'
input_variable <- function(id, param, mode = "mixed", basic_choice = "numeric") {
  tabs <- lapply(choices, function(choice) {
    tabPanel(title = choice)
  })

  div <- tabsetPanel(
    id = paste0(id, "_", param),
    tabs)

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
