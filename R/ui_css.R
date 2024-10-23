#' Import a CSS file either the package is installed or not
#'
#' @param file Name of the CSS file
#'
#' @keywords internal
#' @import shiny
ui_css <- function(file){
  dev_mode <- paste0("inst/www/", file)

  includeCSS(
    if (file.exists(dev_mode)) {
      # Development mode (when running without installing the package)
      dev_mode
    } else {
    # Package installed mode
    system.file("www", file, package = "visualizer")
    }
  )
}
