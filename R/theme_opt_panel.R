theme_opt_panel <- function(id){
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

      h4("Scales")
  )
}
