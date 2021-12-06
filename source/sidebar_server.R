sidebarServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      toReturn <- reactive({
        input$intensity
      })
      
      return(toReturn)
    }
  )
}