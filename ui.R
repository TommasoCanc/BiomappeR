##n###############################
# Shiny App BiomappeR v 0.1 - UI #
##################################

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
        tags$head(tags$style(source("./css.R")$value)),
        
        tabItems(
            # First tab content
            tabItem(tabName = "IntMap",
                    fluidRow(
                        column(width = 12 ,
                               box(title = "Terrestrial regions", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = TRUE,
                                   HTML("Insert the taxa richness for each Italian region <br>"),
                                   column(2, numericInput("abruzzo", "Abruzzo", 0)),
                                   column(2, numericInput("basilicata", "Basilicata", 0)),
                                   column(2, numericInput("calabria", "Calabria", 0)),
                                   column(2, numericInput("campania", "Campania", 0)),
                                   column(2, numericInput("emilia", "Emilia-Romagna", 0)),
                                   column(2, numericInput("friuli", "Friuli-Venezia Giulia", 0)),
                                   column(2, numericInput("lazio", "Lazio", 0)),
                                   column(2, numericInput("liguria", "Liguria", 0)),
                                   column(2, numericInput("lombardia", "Lombardia", 0)),
                                   column(2, numericInput("marche", "Marche", 0)),
                                   column(2, numericInput("molise", "Molise", 0)),
                                   column(2, numericInput("piemonte", "Piemonte", 0)),
                                   column(2, numericInput("puglia", "Puglia", 0)),
                                   column(2, numericInput("sardegna", "Sardegna", 0)),
                                   column(2, numericInput("sicilia", "Sicilia", 0)),
                                   column(2, numericInput("toscana", "Toscana", 0)),
                                   column(2, numericInput("trentino", "Trentino-Alto Adige", 0)),
                                   column(2, numericInput("umbria", "Umbria", 0)),
                                   column(2, numericInput("aosta", "Valle d'Aosta", 0)),
                                   column(2, numericInput("veneto", "Veneto", 0)),
                                   column(2, numericInput("vaticano", "Cittá del Vaticano", 0)),
                                   column(2, numericInput("smarino", "San Marino", 0))
                               ),
                               
                               box(title = "Marine regions", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = TRUE,
                                   HTML("Insert the taxa richness for each marine region <br>"),
                                   column(2, numericInput("m1", "Sector 1", 0)),
                                   column(2, numericInput("m2", "Sector 2", 0)),
                                   column(2, numericInput("m3", "Sector 3", 0)),
                                   column(2, numericInput("m4", "Sector 4", 0)),
                                   column(2, numericInput("m5", "Sector 5", 0)),
                                   column(2, numericInput("m6", "Sector 6", 0)),
                                   column(2, numericInput("m7", "Sector 7", 0)),
                                   column(2, numericInput("m8", "Sector 8", 0)),
                                   column(2, numericInput("m9", "Sector 9", 0))
                               ),
                               
                               box(title = "Terrestial Biogeographic regions", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = TRUE,
                                   HTML("Insert the taxa richness for each terrestial biogeographic regions <br>"),
                                   column(2, numericInput("alp", "Alpine", 0)),
                                   column(2, numericInput("con", "Continental", 0)),
                                   column(2, numericInput("med", "Mediterranean", 0))
                               ),
                               
                               box(title = "Plot map", solidHeader = FALSE, width = NULL, collapsible = TRUE, collapsed = FALSE,
                                   column(2, numericInput("ter_bins", "Terrestial n. Bins", 2)),
                                   column(2, numericInput("sea_bins", "Marine n. Bins", 2)),
                                   numericInput("terBio_bins", "TerBioreg n. Bins", 2),
                                   checkboxInput("plotMap", "Plot interactive map", value = FALSE),
                                   uiOutput("download.Map")
                                   )
                          ),
                        
                        column(width = 12,
                               leafletOutput("myMap")
                               )
                        )
            )
        )
    )
)