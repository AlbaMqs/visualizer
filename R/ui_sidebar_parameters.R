#' ui_sidebar_parameters
#'
#' UI for the left sidebar used to control parameters
#'
#' @return Shiny UI Object
#' @keywords internal
#' @import shiny

ui_sidebar_parameters <- function() {
  div(id = "param-sidebar",
      class = "sidebar",

      panel_theme_opt(id = "pnl_theme_opt")
  )
}
