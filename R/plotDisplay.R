#' GGplot renderer
#'
#' @param input Standard Shiny parameters
#' @return GGplot2 plot
#' @keywords internal
#' @import ggplot2

plotDisplay <- function(input) {
  plot <- ggplot(mtcars)

  plot <- plot +
    labs(title = "Relation entre le poids de la voiture et la consommation d'essence", x = "Poids de la voiture (1000 lbs)", y = "Miles par gallon") +
    geom_point(aes(x = wt, y = mpg))

  # Theme
  plot <- plot +
    do.call(paste0("theme_", input$theme_name), list())

  return(plot)
}
