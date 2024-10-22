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

      h4(id = "info-box-layer",
         class = "visible",
         "Add a layer by clicking the button below"),

      rank_list(
        labels = list(),
        input_id = "sortable_layer",
        class = "invisible",
        options = sortable_options() # Permettre la sélection multiple si nécessaire
      ),

      layerBox("theme", id = "lb_theme_opt", drag = F),
      layerBox("text_global", id = "lb_text_opt", drag = F),

      div(class = "layer-item non-drag",
          id = "add-layer",
          img(src = "add.png"),
          span("Add layer"))
  )
}
