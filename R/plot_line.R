#' plot_line
#'
#' Create a line on the plot (h, v or ab)
#'
#' @param param List of parameters value for this geom
#' @param id ID of the geom
#' @param plot GGplot on which to add the line.
#'
#' @return GGplot with a new line geom
#'

plot_line <- function(param, id, plot){

  # Basic Mode
  if(param$mode == "Basic"){

    if(param$tline == "Vertical"){
      plot <- plot +
        geom_vline(xintercept = param$intercept,
                   color = param$color,
                   linetype = param$linetype,
                   linewidth = param$size)
    }
    else if(param$tline == "Horizontal"){
      plot <- plot +
        geom_hline(yintercept = param$intercept,
                   color = param$color,
                   linetype = param$linetype,
                   linewidth = param$size)
    }
    else if(param$tline == "Diagonal"){
      plot <- plot +
        geom_abline(slope = param$slope, intercept = param$intercept,
                    color = param$color,
                    linetype = param$linetype,
                    linewidth = param$size)
    }
  }

  #Advanced mode
  else{
    if(param$tline == "Vertical"){
      plot <- plot +
        geom_vline(xintercept = param$intercept,
                   color = param$color,
                   linetype = param$linetype,
                   linewidth = param$size,
                   alpha = param$alpha)
    }
    else if(param$tline == "Horizontal"){
      plot <- plot +
        geom_hline(yintercept = param$intercept,
                   color = param$color,
                   linetype = param$linetype,
                   linewidth = param$size,
                   alpha = param$alpha)
    }
    else if(param$tline == "Diagonal"){
      plot <- plot +
        geom_abline(slope = param$slope, intercept = param$intercept,
                    color = param$color,
                    linetype = param$linetype,
                    linewidth = param$size,
                    alpha = param$alpha)
    }
  }

  return(plot)
}
