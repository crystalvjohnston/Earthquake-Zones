library(shiny)
library(leaflet)


source("source/sidebar_ui.R")
source("source/sidebar_server.R")

g_SlopeFauilure <- readRDS("data/saved/slopeFailure.RDS")
