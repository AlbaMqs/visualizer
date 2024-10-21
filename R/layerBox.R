#' Layer Button
#'
#' @param type Type of the layer
#' @param drag Dragable box
#'
#' @return UI button
#' @import shiny
#' @importFrom dplyr case_when
#' @keywords internal

layerBox <- function(type, id = NULL, drag = T, session = getDefaultReactiveDomain()){
  title <- case_when(type == "theme" ~ "Global Theme Options",
                     type == "line" ~ "Line",
                     type == "text_global" ~ "Global Texte Options",
                     type == "point" ~ "Scatter Plot",
                     type == "bar" ~ "Bar plot")

  image <- paste0("layer_logo/", type, ".png")
  if (!file.exists(image)) { #DevMode
    image <- paste0("inst/www/", image)
  }

  class <- ifelse(drag,
                  "layer-item",
                  "layer-item non-drag")

  if(is.null(id)) {
    id <- paste0("lb_", type, "_", id_layer)
    id_layer <<- id_layer + 1
  }

  if(type %in% geom_list){
    id <- paste0(id, "_geom")
  }
  id_layer_list <<- c(id_layer_list, id)

  div <- div(class = class,
             id = id,
             img(src = image),
             span(title))

  return(div)
}
