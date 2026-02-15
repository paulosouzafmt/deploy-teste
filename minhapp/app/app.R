library(shiny)
## Release 2
ui <- fluidPage(
  h2("deploy-teste"),
  verbatimTextOutput("info")
)

server <- function(input, output, session) {
  output$info <- renderPrint({
    list(
      time = Sys.time(),
      release_conf = tryCatch(readLines("release.conf"), error = function(e) "release.conf não encontrado")
    )
  })
}

shinyApp(ui, server)
