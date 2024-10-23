#' ui_df_selection
#'
#' This function handles the display of a modal dialog to select a dataframe
#' from the Global Environment and returns the name of the selected dataframe.
#'
#' @param input, output, session Standard Shiny parameters.
#'
#' @return name of the selected dataframe.
#' @keywords internal
#' @importFrom shiny showModal modalDialog selectInput modalButton actionButton removeModal req

ui_df_selection <- function(input, output, session) {

  # Reactive expression that lists dataframes in the Global Environment
  liste_objets <- reactive({
    objets <- ls(envir = .GlobalEnv)
    objets[unlist(lapply(objets, function(x) {
      is.data.frame(get(x, envir = .GlobalEnv))
    }))]
  })

  # Reactive value to store the selected dataframe name
  selected_df <- reactiveVal(NULL)

  # Observe the environment and show the modal in a reactive context
  observe({
    showModal(modalDialog(
      title = "Choose a dataframe",
      selectInput("choice", "Dataframe to use :", choices = liste_objets()),
      footer = tagList(
        modalButton("Cancel"),
        actionButton("validate", "Validate")
      )
    ))
  })

  # Observe the validation event to store the dataframe choice (as name)
  observeEvent(input$validate, {
    req(input$choice)
    removeModal()
    selected_df(input$choice)  # Store selected dataframe name in reactive value
  })

  return(selected_df)  # Return the reactive value containing the dataframe name
}
