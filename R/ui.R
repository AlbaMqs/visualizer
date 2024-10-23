#' Define the User Interface for the Shiny App
#'
#' @return A Shiny UI definition using `fluidPage()`.
#' @keywords internal
#' @import shiny
app_ui <- function() {
  fillPage(
    tags$head(
      tags$script(
        "shinyjs.resizeWindow = function(width, height) {
          window.resizeTo(width, height);
      };"
      )
    ),

    useShinyjs(),
    ui_css("basic_interface.css"),
    ui_css("layer_bar.css"),
    ui_css("param_bar.css"),

    fluidRow(
      ui_sidebar_layer(),

      # Central content with tabs
      div(id = "main",
          tabsetPanel(
            tabPanel("Plot", plotOutput("mainPlot")),
            tabPanel("Code", verbatimTextOutput("codeOutput"))
          ),

          verbatimTextOutput("console_output")
      ),

      ui_sidebar_parameters()
    )
  )
}
