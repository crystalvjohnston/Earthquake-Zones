fluidPage(
  fluidRow(h1("Earthquake zones")),
  sidebarLayout(
    sidebarUI("sidebar"),
    mainPanel( style="height:100vh",
      leafletOutput("map", height = "100%")
    )
  )
)