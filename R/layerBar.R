#' UI for the left sidebar used to select layer
#'
#' @return Shiny UI Object
#' @keywords internal
#' @import shiny
#' @import sortable
#' @import shinyjs

layerBar <- function() {
  div(id = "layers_bar",
      class = "sidebar",

      rank_list(
        labels = list(
          layerBox("theme"),
          layerBox("text_global"),
          layerBox("point")
        ),
        input_id = "sortable_layer",
        options = sortable_options() # Permettre la sélection multiple si nécessaire
      )
  )
}
