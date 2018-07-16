# ------------------------------------------------------------------------------
# UI ch3app2 
# ------------------------------------------------------------------------------

fluidPage(
  
  shinyjs::useShinyjs(),
  
  fluidRow(
           
    column(12, offset = 0.5, 
                  
      textOutput("title32")
           
    )
  
  ),
  
  fluidRow(
    
    column(6, offset = 0,
      
      fluidRow(
      
        column(12, 
          
          shinydashboard::box(
            
            title = "Inputs", 
            
            width = "100%", 
            
            collapsible = T,
            
            status = "success", 
            
            solidHeader = T, 
            
            fluidRow(
              
              column(
                
                width = 12,
                
                actionButton(
                  
                  inputId = "draw32", 
                  
                  label = "New Random Sample", 
                  
                  icon("play"), 
                  
                  style = "
                  color: white; 
                  font-weight: bolder; 
                  background-color: #3c95af; 
                  border: 4px solid black;
                  margin-top: 5px;
                  margin-right: 20px;
                  margin-bottom: 5px;
                  "
                ),
                
                actionButton(
                  
                  inputId = "run_sim32", 
                  
                  label = "New Simulation", 
                  
                  icon("play"), 
                  
                  style = "
                         color: white; 
                         font-weight: bolder; 
                         background-color: #3c95af; 
                         border: 4px solid black;
                         margin-top: 5px;
                         margin-bottom: 5px;"
                )
              )
            ),
            
            fluidRow(
              
              div(
                
                style = "height:10px;"
                
              ),
            
              column(
                
                width = 6, 
              
                uiOutput("skew32")
              ),
              
              column(
                
                width = 6,
                
                uiOutput("size32")
              )
            ),
            
            fluidRow(
              
              column(
                
                width = 6, 
                
                uiOutput("simsize32")
              )
            )
          )
        )
      ),
      
      fluidRow(
        
        column(12, 
        
          shinydashboard::box(
            
            title = "Random Sample", 
            
            width = "100%", 
            
            collapsible = T,
            
            status = "primary", 
            
            solidHeader = T, 
            
            column(12, 
                   
                   withSpinner(
                     
                     plotOutput("samp32", height = 250), 
                     
                     type = 1,
                     
                     color = "#2eb469"
                     
                   ),
                   
                   textOutput("text_samp32")
            )
          )  
        )
      )
    ),
    
    column(6, offset = 0,   
      
      fluidRow(
      
        column(12, 
          
          shinydashboard::box(
            
            title = "Population Distribution", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "warning", 
            
            solidHeader = T, 
          
            column(12, 
            
              withSpinner(
                
                plotOutput("population32", height = 198),
                
                type = 1,
                
                color = "#dca909"
                
              ),
            
              textOutput("text_pop32")
            )
          )
        )
      ),
      
      fluidRow(
        
        column(12, 
          
          shinydashboard::box(
            
            title = "Distribution of the Means", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "danger", 
            
            solidHeader = T, 
            
            column(12, 
                   
              withSpinner(
                
                plotOutput("sim32", height = 231), 
                
                type = 1,
                
                color = "#8b4a8b"
                
              ),
                   
              textOutput("text_sim32")
            )     
          )
        )
      )
    
    ) # End right column
  
  ) # End fluidRow

) # End fulidPage

# ------------------------------------------------------------------------------
# END UI ch3app2
# ------------------------------------------------------------------------------

