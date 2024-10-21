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
#
#   liste_objets <- reactive({
#     objets <- ls(envir = .GlobalEnv)
#     objets[unlist(lapply(objets, function(x) {
#       is.data.frame(get(x, envir = .GlobalEnv))
#     }))]
#   })
#
#   observe({
#     showModal(modalDialog(
#       title = "Choose a dataframe",
#       selectInput("choice", "Dataframe to use :",
#                   choices = liste_objets()),
#       footer = tagList(
#         modalButton("Cancel"),
#         actionButton("validate", "Validate")
#       )
#     ))
#   })
#
#   observeEvent(input$validate, {
#     req(input$choice)
#     removeModal()
#     work_df <<- input$choice
#   })

  # Layer opening
  observeEvent(input$layer_clicked, {
    to_open <- stringr::str_replace(input$layer_clicked, "^lb_", "pnl_")
    cat('To open :', "to_open", fill = T)
    to_close <- lapply(id_layer_list, str_replace, "^lb_", "pnl_")
    lapply(to_close, removeClass, class = "visible")
    addClass(to_open, "visible")
  })

  observe({print(input$sortable_layer)})

  js_code <- "
    document.querySelectorAll('.layer-item').forEach(function(div) {
      div.addEventListener('click', function(event) {
        if (!event.detail.dragging) {
          Shiny.setInputValue('layer_clicked', div.id, {priority: 'event'});
        }
      });
    });
  "

  runjs(js_code)

  output$mainPlot <- renderPlot({
    print("Render plot triggered")
    plotDisplay(input)})

  session$onSessionEnded(function() {
    out(session)
  })
}
