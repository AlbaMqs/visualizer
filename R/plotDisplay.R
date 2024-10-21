#' GGplot renderer
#'
#' @param input Standard Shiny parameters
#' @return GGplot2 plot
#' @keywords internal
#' @import ggplot2
#' @import rlang

plotDisplay <- function(input) {
  print(work_df)
  if(work_df == ""){
    return(NULL)
    print("a")
  }
  print("b")
  plot <- ggplot(get(work_df, envir = .GlobalEnv))

  plot <- plot +
    labs(title = "Relation entre le poids de la voiture et la consommation d'essence", x = "Poids de la voiture (1000 lbs)", y = "Miles par gallon") +
    geom_point(aes_string(x = xvar, y = yvar))

  # Theme
  plot <- plot +
    do.call(paste0("theme_", input$theme_name), list())

  # Geom
  geom_index <- grep("geom", id_layer_list)
  geom_to_add <- id_layer_list[geom_index] |>
    str_replace("^lb_", "pnl_")

  for(geom in geom_to_add){
    #Line
    if(grepl("pnl_line_\\d+_geom", geom)){
      line_type <- paste0(geom, "_tline")

      if(input[[line_type]] == "Vertical"){
        plot <- plot +
          geom_vline(xintercept = 1)
      }
      else if(input[[line_type]] == "Horizontal"){
        plot <- plot +
          geom_hline(yintercept = 1)
      }
    }
  }

  return(plot)
}
