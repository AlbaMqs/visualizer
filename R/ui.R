#' Define the User Interface for the Shiny App
#'
#' @return A Shiny UI definition using `fluidPage()`.
#' @keywords internal
#' @import shiny
app_ui <- function() {
  fillPage(
    useShinyjs(),
    useCSS("basic_interface.css"),
    useCSS("layer_bar.css"),

    fluidRow(
      layerBar(),

      # Central content with tabs
      div(id = "main",
          tabsetPanel(
            tabPanel("Plot", plotOutput("mainPlot")),
            tabPanel("Code", verbatimTextOutput("codeOutput"))
          ),

          verbatimTextOutput("console_output")
      ),

      paramBar()
    )
  )
}
