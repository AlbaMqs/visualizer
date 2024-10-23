#' Layer base
#'
#' Constructor for the layers
#'
#' @param type String contain type of the layer
#' @param drag Box is dragable ?
#' @param id string ID of the layer
#' @param session Standard Shiny parameters
#'
#' @return UI button
#' @import shiny
#' @importFrom dplyr case_when
#' @keywords internal

layer_base <- function(type, id = NULL, drag = T, session = getDefaultReactiveDomain()){
  title <- case_when(type == "theme" ~ "Global Theme Options",
                     type == "line" ~ "Line",
                     type == "text_global" ~ "Global Texte Options",
                     type == "point" ~ "Scatter Plot",
                     type == "bar" ~ "Bar plot",
                     type == "text" ~ "Text")

  image <- paste0("layer_logo/", type, ".png")
  if (!file.exists(image)) { #DevMode
    image <- paste0("inst/www/", image)
  }

  class <- ifelse(drag,
                  "layer-item",
                  "layer-item non-drag")

  id_layer_list <<- c(id_layer_list, id)

  div <- div(class = class,
             id = id,
             img(src = image),
             span(title))

  return(div)
}
