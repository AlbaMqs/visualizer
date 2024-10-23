# R/server.R

#' Define the Server Logic for the Shiny App
#'
#' @param input, output, session Standard Shiny parameters
#'
#' @return None. The function is used for its side effects.
#' @keywords internal
#' @import shiny
#' @importFrom stringr str_replace
#'
app_server <- function(input, output, session) {

  session$onFlushed(function() {
    runjs("shinyjs.resizeWindow(1024, 768);") # Dimensions en pixels (ex. 1024x768)
  })

  ## Selecting dataframe

  ## Encapsulated dataframe selection logic
  selected_df <- ui_df_selection(input, output, session)

  # Once the dataframe is selected, store it globally
  observe({
    if (!is.null(selected_df())) {
      work_df <<- selected_df()  # Store the selected dataframe globally
    }
  })

  ## Layer Bar events
  ui_layer_events(input, output, session)

  output$mainPlot <- renderPlot({
    plot_display(input)})
}
