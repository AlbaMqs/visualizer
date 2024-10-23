# R/launch_app.R

#' Launch the Shiny Application
#'
#' This function launches the Shiny application by combining the user interface (UI)
#' and the server logic into a single app. It serves as the entry point for the app.
#'
#' @return A running Shiny app instance.
#' @examples
#' if (interactive()) {
#'   LaunchApp()
#' }
#' @import shiny
LaunchApp <- function() {
  shinyApp(ui = app_ui(), server = app_server)
}
