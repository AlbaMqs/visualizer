#' panel_line
#'
#' Constructor of global theme option panel
#'
#' @param id String of layer's ID
#'
#' @return Div of a global theme option panel
#'
panel_theme_opt <- function(id){
  div(id = id,
      class = "panel pnl_theme visible",

      h3("Global Options"),

      h4("Theme"),

      selectInput(
        inputId = "theme_name",
        label = "Base Theme",
        c("minimal", "classic", "dark", "light", "bw", "void"),
        selected = "minimal"
      ),

      actionButton("action", label = "Action") ,
      checkboxInput("checkbox", label = "Choice A", value = TRUE),
      checkboxGroupInput("checkGroup", label = h3("Checkbox group"),
                         choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                         selected = 1),
      dateRangeInput("dates", label = h3("Date range")),
      hr(),
      numericInput("num", label = h3("Numeric input"), value = 1),
      radioButtons("radio", label = h3("Radio buttons"),
                   choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                   selected = 1),
      selectInput("select", label = h3("Select box"),
                  choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                  selected = 1),
      hr(),
      sliderInput("slider2", label = h3("Slider Range"), min = 0,
                  max = 100, value = c(40, 60)),
      textInput("text", label = h3("Text input"), value = "Enter text..."),
      fileInput("file", label = h3("File input")),

      h4("Scales")
  )
}
