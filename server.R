server <- function(input, output) {
  
  sidebarValue <- sidebarServer("sidebar")
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()
  })
  
  observeEvent(sidebarValue(), {
    dat <- g_SlopeFauilure %>% subset(LSKEY >= sidebarValue()[1] & LSKEY <= sidebarValue()[2])
    
    qpal <- colorBin("YlOrRd",
                     g_SlopeFauilure$LSKEY,
                     bins = 5,
                     na.color = "#f0f0f0",
                     right = T)
    
    leafletProxy("map") %>% 
      clearShapes() %>% 
      addPolygons(
        data = dat,
        fillColor = ~ qpal(dat$LSKEY),
        weight = 1,
        color = "white",
        fillOpacity = 0.8,
        highlight = highlightOptions(
          weight = 1,
          color = "black",
          bringToFront = TRUE,
          fillOpacity = 1
        )
      )
  })
  
}