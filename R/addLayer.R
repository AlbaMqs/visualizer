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
  cat(paste(btn_id, "button clicked\n"))

  # Generate a unique ID for the new layer (e.g., lb_line_1234_geom)
  id_layer <- paste0("lb_", str_remove(btn_id, "^btn_"), "_", as.numeric(Sys.time()), "_geom")
  type <- str_remove(btn_id, "^btn_")

  # Update the global id_layer_list
  id_layer_list <<- c(id_layer_list, id_layer)

  # Insert the BoxLayer into the #sortable_layer div
  insertUI(
    selector = "#sortable_layer", # Target the container where you want to add the new element
    where = "beforeEnd",          # Insert at the end of the container
    ui = layerBox(type, id_layer) # Use the BoxLayer function to generate the new UI with the unique id
  )

  # Attach the click event to the new layer after it is inserted using `onevent`
  onevent("click", id_layer, {
    to_open <- str_replace(id_layer, "^lb_", "pnl_")
    to_close <- lapply(id_layer_list, str_replace, "^lb_", "pnl_")

    # Remove the 'visible' class from all layers
    lapply(to_close, function(layer) {
      removeClass(layer, class = "visible")
    })

    # Add the 'visible' class to the clicked layer
    addClass(to_open, "visible")
    cat("Click on:", to_open, fill = TRUE)
  })

  # Display Layer list
  removeClass("rank-list-sortable_layer", "invisible")
  addClass("rank-list-sortable_layer", "visible")
  removeClass("info-box-layer", "visible")
  addClass("info-box-layer", "invisible")
}
