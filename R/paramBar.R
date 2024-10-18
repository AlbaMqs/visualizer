#' UI for the left sidebar used to control parameters
#'
#' @return Shiny UI Object
#' @keywords internal
#' @import shiny

paramBar <- function() {
  div(id = "param-sidebar",
      class = "sidebar",
      h3("Theme"),

      selectInput(
        "theme_name",
        "Theme",
        c("minimal", "classic", "dark", "light", "bw", "void"),
        selected = "minimal"
      )
  )
}
