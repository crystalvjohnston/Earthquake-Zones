sidebarUI <- function(id){
  ns <- NS(id)
  sidebarPanel(
    sliderInput(ns("intensity"), "Select intensity", min = 1, max = 5, value = c(2,3))
  )
}