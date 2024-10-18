#' Layer Button
#'
#' @param type Type of the layer
#' @param drag Dragable box
#'
#' @return UI button
#' @import shiny
#' @importFrom dplyr case_when
#' @keywords internal

layerBox <- function(type, drag = T){
  title <- case_when(type == "theme" ~ "Global Theme Options",
                     type == "vline" ~ "Vertical Line",
                     type == "hline" ~ "Horizontal Line",
                     type == "text_global" ~ "Global Texte Options",
                     type == "point" ~ "Scatter Plot")

  image <- paste0("layer_logo/", type, ".png")
  if (!file.exists(image)) { #DevMode
    image <- paste0("inst/www/", image)
  }

  class <- ifelse(drag,
                  "layer-item",
                  "layer-item non-drag")

  div <- div(class = class,
             id = type,
             img(src = image),
             span(title))

  return(div)
}
