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

      h4('Geometry'),
      selectInput(
        inputId = paste0(id, "_tline"),
        label = "Line type",
        c("Vertical", "Horizontal", "Oblique"),
        selected = "Vertical"
      ),

      numericInput(
        inputId = 'fhrfrvg',
        label = "test",
        value = 1
      ),

      h4('Aesthetic')
  )
}
