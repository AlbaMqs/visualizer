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

  init(session)

  ## Selecting dataframe

  ## Encapsulated dataframe selection logic
  selected_df <- dataframe_selection(input, output, session)

  # Once the dataframe is selected, store it globally
  observe({
    if (!is.null(selected_df())) {
      work_df <<- selected_df()  # Store the selected dataframe globally
      print(work_df)
    }
  })

  ## Layer Bar events
  layerBarEvents(input, output, session)

  output$mainPlot <- renderPlot({
    print("Render plot triggered")
    plotDisplay(input)})

  session$onSessionEnded(function() {
    out(session)
  })
}
