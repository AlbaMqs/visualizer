#' GGplot renderer
#'
#' Dynamic renderer of the plot
#'
#' @param input Standard Shiny parameters
#'
#' @return GGplot2 plot
#' @keywords internal
#' @import ggplot2
#' @import rlang
#' @improt stringr

plot_display <- function(input) {
  plot <- ggplot(get(work_df, envir = .GlobalEnv))

  plot <- plot +
    labs(title = "Relation entre le poids de la voiture et la consommation d'essence", x = "Poids de la voiture (1000 lbs)", y = "Miles par gallon") +
    geom_point(aes_string(x = xvar, y = yvar))

  # Theme
  plot <- plot +
    do.call(paste0("theme_", input$theme_name), list())

  # Geom
  geom_list <- id_layer_list |>
    str_subset("geom") |>
    str_replace("^lb_", "pnl_")

  for(geom in geom_list){

    geom_type <- str_extract(geom, "(?<=pnl_)[^_]+")
    input_names <- names(input)
    geom_inputs <- input_names[grep(str_escape(geom), input_names)]
    geom_param <- lapply(geom_inputs, function(input_name) input[[input_name]])
    names(geom_param) <- geom_inputs |>
      str_remove(str_escape(paste0(geom, "_")))

    plot <- do.call(paste0("plot_", geom_type), list(geom_param, geom, plot))
  }

  return(plot)
}
