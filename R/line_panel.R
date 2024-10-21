line_panel <- function(id) {
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
