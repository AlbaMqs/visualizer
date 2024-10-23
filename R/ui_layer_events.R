#' ui_layer_events
#'
#' Encapsulates the logic to handle the layer bar interaction.
#'
#' @param input, output, session Standard Shiny parameters.
#'
#' @import shinyjs
#'
#' @keywords internal
ui_layer_events <- function(input, output, session) {

  # Use shinyjs to handle DOM manipulations
  useShinyjs()

  # Attach onclick to existing layers at startup
  lapply(id_layer_list, function(layer_id) {
    onevent("click", layer_id, {

      to_open <- str_replace(layer_id, "^lb_", "pnl_")
      to_close <- lapply(id_layer_list, str_replace, "^lb_", "pnl_")

      # Remove 'visible' class from all layers
      lapply(to_close, function(layer) {
        removeClass(layer, class = "visible")
      })

      # Add 'visible' class to the clicked layer
      addClass(to_open, "visible")
      cat("Click on:", to_open, fill = TRUE)
    })
  })

  # Add a new layer when "add-layer" is clicked
  onclick("add-layer", { showModal(layer_select_new()) })

  # Handle the buttons in the modal to add layers dynamically
  button_ids <- c("btn_line", "btn_point", "btn_bar", "btn_text")

  # Attach an observer to each button in the modal
  lapply(button_ids, function(btn_id) {
    observeEvent(input[[btn_id]], {
      ui_add_layer(btn_id, input, output, session)  # Add the new layer and attach `onevent`
      removeModal()  # Close the modal after adding the layer
    })
  })

  # Handle the Cancel button in the modal
  observeEvent(input$btn_cancel, {
    removeModal()
  })
}


# SORT LIST : input$sortable_layer
