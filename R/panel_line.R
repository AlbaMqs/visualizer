#' panel_line
#'
#' Constructor of line panel
#'
#' @param id String of layer's ID
#'
#' @return Div of a line panel
#'
panel_line <- function(id) {

  div(class = "panel",
      id = id,

      h3('Line Options'),

      tabsetPanel(
        id = paste0(id, "_mode"),
        tabPanel("Basic"),
        tabPanel("Advanced")),

      h4('Geometry'),
      input_list(id, "tline",
                 "Type",
                 c("Vertical", "Horizontal", "Diagonal")),


      input_numeric(id, "intercept",
                    "Position"),


      conditionalPanel(
        condition = paste0("input.", id, "_tline == 'Diagonal'"),
        input_numeric(id, "slope",
                      "Slope"),
      ),

      # Aesthetic Option ------------------
      h4('Aesthetic'),

      div(class = "hdiv",
        # Color of the line
        input_color(id, "color",
                 "Color",
                 "black"),


        # Opacity
        input_numeric(id, "alpha",
                    "Opacity",
                    default = 1,
                    mode = "advanced")),

      div(class = "hdiv",
        # Style of the line
        input_list(id, "linetype",
                   "Line Type",
                   linetypes <- c(
                     "solid",
                     "dashed",
                     "dotted",
                     "dotdash",
                     "longdash",
                     "twodash"
                   )),

        # Size of the line
        input_numeric(id, "size",
                      "Size",
                      default = 1)),

      # Legend Option ------------------

  )
}
