#' addLayer
#'
#' Add a Layer to the plot
#'
#' @param btn_id Id of the button clicked (type of layer to add)
#'
#' @import stringr
#'
#' @return none
#' @export
#' @keywords internal
addLayer <- function(btn_id, session){

  # Generate id for all components
  type <- str_remove(btn_id, "^btn_")
  id_base <- paste0(type, "_", as.numeric(Sys.time()), "_geom")

  id_layer <- paste0("lb_", id_base)
  id_panel <- paste0("pl_", id_base)

  # Update the global id_layer_list
  id_layer_list <<- c(id_layer_list, id_layer)

  # Insert the BoxLayer into the #sortable_layer div
  insertUI(
    selector = "#sortable_layer",
    where = "beforeEnd",
    ui = layerBox(type, id_layer)
  )

  # Toggle Panel Event
  onevent("click", id_layer, {
    to_open <- str_replace(id_layer, "^lb_", "pnl_")
    to_close <- lapply(id_layer_list, str_replace, "^lb_", "pnl_")

    lapply(to_close, function(layer) {
      removeClass(layer, class = "visible")
    })

    addClass(to_open, "visible")
  })

  # Display Layer list
  removeClass("rank-list-sortable_layer", "invisible")
  addClass("rank-list-sortable_layer", "visible")
  removeClass("info-box-layer", "visible")
  addClass("info-box-layer", "invisible")
}
