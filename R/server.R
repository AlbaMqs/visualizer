# R/server.R

#' Define the Server Logic for the Shiny App
#'
#' @param input, output, session Standard Shiny parameters
#'
#' @return None. The function is used for its side effects.
#' @keywords internal
#' @import shiny
#'
app_server <- function(input, output, session) {

  # Observe the layer's order
  observeEvent(input$layer_clicked, {
    print(paste("Div cliquée:", input$layer_clicked))
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

  # Exécuter le code JS après que l'interface a été générée
  runjs(js_code)

  output$mainPlot <- renderPlot({plotDisplay(input)})
}
