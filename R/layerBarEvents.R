#' Layer Bar Event Handlers
#'
#' Encapsulates the logic to handle the layer bar interaction.
#'
#' @param input, output, session Standard Shiny parameters.
#' @param id_layer_list
#'
#' @import shinyjs
#'
#' @keywords internal
layerBarEvents <- function(input, output, session, id_layer_list) {

  # Use shinyjs to handle DOM manipulations
  useShinyjs()

  # Change display setting when clicked
  lapply(id_layer_list, function(layer_id) {
    onclick(layer_id, {

      to_open <- str_replace(layer_id, "^lb_", "pnl_")
      to_close <- lapply(id_layer_list, str_replace, "^lb_", "pnl_")

      lapply(to_close, function(layer) {
        removeClass(layer, class = "visible")
      })

      addClass(to_open, "visible")

    })
  })

  # SORT LIST : input$sortable_layer
}
