#' layer_select_new
#'
#' Modal window UI where user can select the type of new layer
#'
#' @return A modalDialog object with custom content.
#' @export
#'
#' @keywords internal
layer_select_new <- function() {
  modalDialog(
    title = "Choose a Layer to Add",

    # Main container div
    tags$div(
      id = "box-layer-type",

      # Geometry section
      tags$div(
        id = "box-layer-geom",
        tags$h3("Geometry"),

        actionButton("btn_point", "Point", class = "btn-primary"),
        actionButton("btn_bar", "Bar", class = "btn-primary")
      ),

      # Annotation section
      tags$div(
        id = "box-layer-annotation",
        tags$h3("Annotation"),

        actionButton("btn_line", "Line", class = "btn-primary"),
        actionButton("btn_text", "Text", class = "btn-primary")
      )
    ),

    footer = actionButton("btn_cancel", "Cancel", class = "btn-secondary"),
    easyClose = TRUE
  )
}
