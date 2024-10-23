#' panel_create
#'
#' Constructor of the parameters panel
#'
#' @param type String of layer's type
#' @param id_panel String of layer's ID
#'
#' @return Div of a parameters panel

panel_create <- function(type, id_panel){
  fnct <- paste0("panel_", type)
  div <- do.call(fnct, list(id_panel))
  return(div)
}
