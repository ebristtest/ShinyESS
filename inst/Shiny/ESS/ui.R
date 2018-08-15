# -------------------------------------------------------------------------------------------------- 
# UI primary
# --------------------------------------------------------------------------------------------------

# Packages ----------------------------------------------------------------------------------------- 

library(shiny)

library(shinyBS)

library(shinydashboard)

library(shinythemes)

library(dplyr)

library(ggplot2)

library(shinycssloaders)

library(knitr)

library(rmarkdown)


# UI -----------------------------------------------------------------------------------------------

shinyUI(
  
  # Create dashboard -------------------------------------------------------------------------------
  
  dashboardPage(
  
  # Set Browser Title ------------------------------------------------------------------------------  
  
  title = "ShinyESS",
  
  # Set skin color to black ------------------------------------------------------------------------
  
  skin = "black",
  
  # Create title -----------------------------------------------------------------------------------
  
  dashboardHeader(
    
    title = span(
      
      tagList(
        
        icon("search"),
        
        "ShinyESS"
      )
    ), 
    
    titleWidth = 230,
    
    tags$li(
      
      class = "dropdown", 
            
      actionButton(
        
        inputId = "open_help", 
        
        label = "Help", 
        
        icon = icon("question")
      )
    )
    
  ),
  
  # Sidebar ----------------------------------------------------------------------------------------
  
  dashboardSidebar(
    
    sidebarMenu(
      
      # tab id -------------------------------------------------------------------------------------
      id = "tabs",
      
      # Home page ----------------------------------------------------------------------------------  
      menuItem(
        
        text = "Home", 
        
        tabName = "home", 
        
        icon = icon("home")
      ),
      
      # Chapter 3 tools ----------------------------------------------------------------------------  
      menuItem(
        
        text = "Chapter 3 (Basic Concepts)", 
        
        tabName = "ch3", 
        
        icon = icon("book"),
               
        # Confidence Interval Demo -----------------------------------------------------------------
        
        menuSubItem(
          
          text = "Confidence Interval Demo", 
          
          tabName = "ch3app1", 
          
          icon = icon("play-circle")
        ), 
               
        # Distribution of the Means Demo -----------------------------------------------------------
        
        menuSubItem(
          
          text = "Distribution of the Means Demo", 
          
          tabName = "ch3app2", 
                           
          icon = icon("play-circle")
        )
      ),
      
      # Chapter 4 tools ----------------------------------------------------------------------------  
      
      menuItem(
        
        text = "Chapter 4 (SRS)", 
        
        tabName = "ch4", 
        
        icon = icon("book"),
               
        # SRS Estimation of a Population Mean and Total --------------------------------------------
               
        menuSubItem(
          
          text = "Estimation of a Population Mean or Total", 
          
          tabName = "ch4app1", 
           
          icon = icon("wrench")
        ), 
               
        # SRS Sample Size for a Population Mean and Total ------------------------------------------
               
        menuSubItem(
          
          text = "Sample Size Selection for a Population Mean or Total", 
          
          tabName = "ch4app2", 
                           
          icon = icon("wrench")
        ),
        
        # SRS Estimation of a Population Proportion ------------------------------------------------
               
        menuSubItem(
          
          text = "Estimation of a Population Proportion", 
          
          tabName = "ch4app3", 
                           
          icon = icon("wrench")
        ),
        
        # SRS Sample Size Selection for a Population Proportion ------------------------------------
               
        menuSubItem(
          
          text = "Sample Size Selection for a Population Proportion", 
          
          tabName = "ch4app4", 
                           
          icon = icon("wrench")
        ),
        
        # SRS Estimation of a Difference in Means --------------------------------------------------
               
        menuSubItem(
          
          text = "Estimation of a Difference in Independent Means", 
          
          tabName = "ch4app5", 
                           
          icon = icon("wrench")),
        
        # SRS Estimation of a Difference in Proportions --------------------------------------------
        
        menuSubItem(
          
          text = "Estimation of a Difference in Independent Proportions", 
          
          tabName = "ch4app6", 
                           
          icon = icon("wrench")
        ),
        
        # SRS Estimation of a Difference in Proportions --------------------------------------------
        
        menuSubItem(
          
          text = "Estimation of a Difference in Dependent Proportions", 
          
          tabName = "ch4app7", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 5 tools ----------------------------------------------------------------------------
      
      menuItem(
        
        text = "Chapter 5 (Stratified)", 
        
        tabName = "ch5", 
        
        icon = icon("book"),
        
        # Stratified Estimation of a Population Mean or Total --------------------------------------
               
        menuSubItem(
          
          text = "Estimation of a Population Mean or Total", 
          
          tabName = "ch5app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch5app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch5app3", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 6 tools ----------------------------------------------------------------------------
      menuItem(
        
        text = "Chapter 6 (Regresson)", 
        
        tabName = "ch6", 
        
        icon = icon("book"),
               
        menuSubItem(
          
          text = "App1", 
          
          tabName = "ch6app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch6app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch6app3", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 7 tools ----------------------------------------------------------------------------  
      menuItem(
        
        text = "Chapter 7 (Systematic)", 
        
        tabName = "ch7", 
        
        icon = icon("book"),
        
        menuSubItem(
          
          text = "App1", 
          
          tabName = "ch7app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch7app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch7app3", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 8 tools ---------------------------------------------------------------------------- 
      menuItem(
        
        text = "Chapter 8 (Cluster)", 
        
        tabName = "ch8", 
        
        icon = icon("book"),
               
        menuSubItem(
          
          text = "Means and Totals", 
          
          tabName = "ch8app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "Proportions", 
          
          tabName = "ch8app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "Sample Sizes", 
          
          tabName = "ch8app3", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "PPS Sampler", 
          
          tabName = "ch8app4", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "PPS Estimation", 
          
          tabName = "ch8app5", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 9 tools ----------------------------------------------------------------------------  
      
      menuItem(
        
        text = "Chapter 9 (Two-Stage)", 
        
        tabName = "ch9", 
        
        icon = icon("book"),
               
        menuSubItem(
          
          text = "App1", 
          
          tabName = "ch9app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch9app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch9app3", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 10 tools ---------------------------------------------------------------------------
      
      menuItem(
        
        text = "Chapter 10 (Populations)", 
        
        tabName = "ch10", 
        
        icon = icon("book"),
               
        menuSubItem(
          
          text = "App1", 
          
          tabName = "ch10app1", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch10app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch10app3", 
          
          icon = icon("wrench")
        )
      ),
      
      # Chapter 11 tools ---------------------------------------------------------------------------
      
      menuItem(
        
        text = "Chapter 11", 
        
        tabName = "ch11", 
        
        icon = icon("book"),
        
        menuSubItem(
          
          text = "App1", 
          
          tabName = "ch11app1", 
          
          icon = icon("wrench")
        ),
              
        menuSubItem(
          
          text = "App2", 
          
          tabName = "ch11app2", 
          
          icon = icon("wrench")
        ),
               
        menuSubItem(
          
          text = "App3", 
          
          tabName = "ch11app3", 
          
          icon = icon("play-circle")
        )
      )
      
    ) # End: sidebarMenu()
    
  ), # End dashboardSidebar()
  
  # Dashboard Body ---------------------------------------------------------------------------------  
  
  dashboardBody(
    
    tags$li(
      # Help Window
      
      style = "
        height: 0px;
        color: white;
      ",
      
      bsModal(
        
        id = "help_window", 
        
        title = "Help", 
        
        trigger = "open_help",
        
        size = "large",
        
        fluidRow(
          
          column(
            
            width = 12,
            
            eval(parse(file = "help/help_ui.R"))
          )
        )
      )
    ),
    
    # Load custom .css file ------------------------------------------------------------------------ 
    
    
    # Global  --------------------------------------------------------------------------------------
    
    includeCSS("www/global.css"),
    
    
    # Chapter 3 ------------------------------------------------------------------------------------
    
    includeCSS("www/ch3/ch3app1.css"),
    
    includeCSS("www/ch3/ch3app2.css"),
    
    
    # Chapter 4 ------------------------------------------------------------------------------------
    
    includeCSS("www/ch4/ch4app1.css"),
    
    includeCSS("www/ch4/ch4app2.css"),
    
    includeCSS("www/ch4/ch4app3.css"),
    
    includeCSS("www/ch4/ch4app4.css"),
    
    includeCSS("www/ch4/ch4app5.css"),
    
    includeCSS("www/ch4/ch4app6.css"),
    
    includeCSS("www/ch4/ch4app7.css"),
    
    
    # Chapter 5 ------------------------------------------------------------------------------------
    
    includeCSS("www/ch5/ch5app1.css"),
    
    
    # Help Pages -----------------------------------------------------------------------------------
    
    includeCSS("www/help/help.css"),
    
    
    
    # Main body panels ----------------------------------------------------------------------------- 
    
    tabItems(
      
      # Homepage ----------------------------------------------------------------------------------- 
      
      tabItem("home",
              
        fluidPage(
                
          # css for title -------------------------------------------------------------------------- 
          
          tags$head(
            
            tags$style(
                    
              HTML("
                    
                    #welcome {
                      text-align: center;
                      font-size: 32pt;
                      color: black;
                      font-weight: bolder;
                    } 
                    
                    pre { 
                      white-space: pre-wrap; word-break: keep-all; 
                    }
                   "
              )
            ),
            
            tags$style(
              
              HTML("
                   .box {
                     border: none;
                     box-shadow: none;
                   }
                   "
              )
            )
          ),
          
          column(3), 
          
          column(6,
                 
          shinydashboard::box(
          
            width = 12,
            
            # Title --------------------------------------------------------------------------------
            
            fluidRow(
              
              div(style = "height:50px"),
              
                textOutput("welcome")
            ),
            
            # Image --------------------------------------------------------------------------------
            
            fluidRow(
              
              column(12,
              
                tags$img(src = 'images/background.jpg', width = '100%')
              )
            
            )
          )
            
          )
                
        ) # End home page 
      ), # End home page tab
      
      # A UI main body for each tool and demo ------------------------------------------------------ 
      
      # Chapter 3
      
      tabItem("ch3app1", eval(parse(file = "ch3/ch3app1_ui.R"))),
      
      tabItem("ch3app2", eval(parse(file = "ch3/ch3app2_ui.R"))),
      
      
      # Chapter 4
      
      tabItem("ch4app1", eval(parse(file = "ch4/ch4app1_ui.R"))),
      
      tabItem("ch4app2", eval(parse(file = "ch4/ch4app2_ui.R"))),
      
      tabItem("ch4app3", eval(parse(file = "ch4/ch4app3_ui.R"))),
      
      tabItem("ch4app4", eval(parse(file = "ch4/ch4app4_ui.R"))),
      
      tabItem("ch4app5", eval(parse(file = "ch4/ch4app5_ui.R"))),
      
      tabItem("ch4app6", eval(parse(file = "ch4/ch4app6_ui.R"))),
      
      tabItem("ch4app7", eval(parse(file = "ch4/ch4app7_ui.R"))),
      
      
      # Chapter 5
      
      tabItem("ch5app1", eval(parse(file = "ch5/ch5app1_ui.R"))),
      
      
      # Chapter 8
      
      tabItem("ch8app1", eval(parse(file = "ch8/ch8app1_ui.R"))),
      
      tabItem("ch8app3", eval(parse(file = "ch8/ch8app3_ui.R")))
      
      
    ) # End tab items 
  
  ) # End: dashboardBody()
     
  ) # End: dashboardPage()
    
) # End: shinyUI()

# --------------------------------------------------------------------------------------------------
# END UI primary
# --------------------------------------------------------------------------------------------------

