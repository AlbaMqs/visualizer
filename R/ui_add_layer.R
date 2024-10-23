#' ui_add_layer
#'
#' Add a Layer to the plot
#'
#' @param btn_id Id of the button clicked (type of layer to add)
#' @param input, output, session Standard Shiny parameters
#'
#' @import stringr
#'
#' @return none
#' @export
#' @keywords internal
ui_add_layer <- function(btn_id, input, output, session){

  # Generate id for all components
  type <- str_remove(btn_id, "^btn_")
  id_base <- paste0(type, "_", as.numeric(Sys.time()), "_geom")

  id_layer <- paste0("lb_", id_base)
  id_panel <- paste0("pnl_", id_base)

  # Update the global id_layer_list
  id_layer_list <<- c(id_layer_list, id_layer)

  # Insert the BoxLayer into the #sortable_layer div
  insertUI(
    selector = "#sortable_layer",
    where = "beforeEnd",
    ui = layer_base(type, id_layer)
  )

  # Insert the panel into the #param-sidebar div
  insertUI(
    selector = "#param-sidebar",
    where = "beforeEnd",
    ui = panel_create(type, id_panel)
  )

  # Toggle Panel Event
  onevent("click", id_layer, {
    lapply(id_layer_list, function(layer) {
      removeClass(layer, class = "selected")
    })
    addClass(id_layer, "selected")

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

  # Render plot with the new graph
  output$mainPlot <- renderPlot({
    plot_display(input)})
}
