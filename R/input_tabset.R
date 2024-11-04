#' input_tabset
#'
#' Exclusive tab
#'
#' @param id Panel ID
#' @param param Name of the parameter which this input control
#' @param choices Vector of panel's names
#' @param mode Mode where parameter is used
#'   \itemize{
#'     \item `"both"`: By default, widget appear in both mode
#'     \item `"advanced"`: Only advanced mode
#'     \item `"basic"`: Only basic mode
#'   }
#'
#' @return UI List
#'
input_list <- function(id, param, choices, mode = "both") {
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
