#' Layer Button
#'
#' @param type Type of the layer
#'
#' @return UI button
#' @import shiny
#' @importFrom dplyr case_when
#' @keywords internal

layerBox <- function(type){
  title <- case_when(type == "theme" ~ "Global Theme Options",
                     type == "text_global" ~ "Global Texte Options",
                     type == "point" ~ "Scatter Plot")

  image <- paste0("layer_logo/", type, ".png")
  if (!file.exists(image)) { #DevMode
    image <- paste0("inst/www/", image)
  }

  div <- div(class = "layer-item",
             id = type,
             img(src = image),
             span(title))

  return(div)
}
