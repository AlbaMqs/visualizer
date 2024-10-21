#' UI for the left sidebar used to control parameters
#'
#' @return Shiny UI Object
#' @keywords internal
#' @import shiny

paramBar <- function() {
  div(id = "param-sidebar",
      class = "sidebar",

      theme_opt_panel(id = "pnl_theme_opt"),
      line_panel(id = "pnl_line_0_geom")
  )
}
