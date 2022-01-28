##n##############################
# Shiny App FaunaMap v 0.1 - UI #
#################################

# Load libraries
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(DT)
library(leaflet)
library(sf)
library(ggplot2)
library(ggnewscale) # Plot two different scale fill
library(RColorBrewer)
library(gridExtra)
library(grid)


ui <- dashboardPage(skin = "green",
    
# Title header                                    
    dashboardHeader(title = "FaunaMap v. 1.0"),

# Left sidebar    
    dashboardSidebar(
        sidebarMenu(
            #menuItem("About FaunaMap", tabName = "about"),
            menuItem("Interactive Map", tabName = "IntMap")
            )
    ),

# Body
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "IntMap",
                    fluidRow(
                        column(width = 2 ,
                               box(title = "Terrestrial regions", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = TRUE,
                                   HTML("Insert the taxa richness for each Italian region"),
                                   numericInput("abruzzo", "Abruzzo", 0),
                                   numericInput("basilicata", "Basilicata", 0),
                                   numericInput("calabria", "Calabria", 0),
                                   numericInput("campania", "Campania", 0),
                                   numericInput("emilia", "Emilia-Romagna", 0),
                                   numericInput("friuli", "Friuli-Venezia Giulia", 0),
                                   numericInput("lazio", "Lazio", 0),
                                   numericInput("liguria", "Liguria", 0),
                                   numericInput("lombardia", "Lombardia", 0),
                                   numericInput("marche", "Marche", 0),
                                   numericInput("molise", "Molise", 0),
                                   numericInput("piemonte", "Piemonte", 0),
                                   numericInput("puglia", "Puglia", 0),
                                   numericInput("sardegna", "Sardegna", 0),
                                   numericInput("sicilia", "Sicilia", 0),
                                   numericInput("toscana", "Toscana", 0),
                                   numericInput("trentino", "Trentino-Alto Adige", 0),
                                   numericInput("umbria", "Umbria", 0),
                                   numericInput("aosta", "Valle d'Aosta", 0),
                                   numericInput("veneto", "Veneto", 0),
                                   numericInput("vaticano", "Cittá del Vaticano", 0),
                                   numericInput("smarino", "San Marino", 0)
                               ),
                               
                               box(title = "Marine regions", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = TRUE,
                                   HTML("Insert the taxa richness for each marine region"),
                                   numericInput("m1", "Sector 1", 0),
                                   numericInput("m2", "Sector 2", 0),
                                   numericInput("m3", "Sector 3", 0),
                                   numericInput("m4", "Sector 4", 0),
                                   numericInput("m5", "Sector 5", 0),
                                   numericInput("m6", "Sector 6", 0),
                                   numericInput("m7", "Sector 7", 0),
                                   numericInput("m8", "Sector 8", 0),
                                   numericInput("m9", "Sector 9", 0)
                               ),
                               
                               box(title = "Plot map", solidHeader = FALSE, width = NULL,
                                   
                                   numericInput("ter.bins", "Terrestial n. Bins", 2),
                                   numericInput("sea.bins", "Marine n. Bins", 2),
                                   checkboxInput("plotMap", "Plot interactive map", value = FALSE),
                                   uiOutput("download.Map")
                                   )
                               
                               
                          ),
                        
                        #############
                        # Left side #
                        #############
                        
                        column(width = 8,
                               leafletOutput("myMap")
                               )
                        )
            )
        )
    )
)