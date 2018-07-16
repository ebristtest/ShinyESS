# ------------------------------------------------------------------------------
# UI ch3app1 
# ------------------------------------------------------------------------------

fluidPage(
  
  # Use Shiny JavaScript ------------------------------------------------------- 
  
  shinyjs::useShinyjs(),
  
  # Title ----------------------------------------------------------------------
  
  fluidRow(
    
    div(
      
      style = "height: 10px;"
    ),
           
    column(
      
      width = 10, 
      
      offset = 0.5, 
              
      textOutput("title3_1")
    )
  ),
  
  # Population info ------------------------------------------------------------
  
  fluidRow(
    
    div(
      
      style = "height:10px;"
      
    ),
    
    column(
      
      width = 5,
      
      actionButton(
        
        inputId = "show_pop_info3_1",
        
        label = "Background",
        
        width = "150px",
        
        style = "
        
        color: white; 
        font-weight: bolder; 
        font-size: 10pt;
        background-color: #646464; 
        border: 6px solid black;
        margin-top: 6px;
        margin-right: 10px;
        "
      ),
      
      actionButton(
        
        inputId = "qa3_1",
        
        label = "Questions",
        
        width = "150px",
        
        style = "
        
        color: white; 
        font-weight: bolder; 
        font-size: 10pt;
        background-color: #646464; 
        border: 6px solid black;
        margin-top: 5px;
        "
      )
    )
  ),
  
  # Inputs ---------------------------------------------------------------------
  
  fluidRow(
    
    bsModal(
      
      id = "popup_background3_1",
      
      title = "Background Information",
      
      trigger = "show_pop_info3_1",
      
      size = "small",
      
      textOutput("background3_1")
    ),
    
    bsModal(
      
      id = "popup_questions3_1", 
      
      title = "Questions", 
      
      trigger = "qa3_1",
      
      size = "large",
      
      fluidRow(                       
        
        shinydashboard::box(
          
          title = NULL, 
          
          width = "100%", 
          
          collapsible = F,
          
          status = "danger", 
          
          solidHeader = F, 
          
          column(
            
            width = 5,
            
            offset = 0,
                 
            fluidRow(
                   
              div(
                
                style = "height:15px" 
              ),
                   
              column(
                     
                width = 8,
                     
                textOutput("Q13_1")
              ),
                   
              column(
                     
                width = 4,
                     
                actionButton(
                       
                  inputId = "H13_1", 
                       
                  label = "Hint", 
                       
                  style = "
                       
                    color: white; 
                    font-weight: bolder; 
                    font-size: 10pt;
                    background-color: #4d004d; 
                    border: 5px solid black;
                    margin-top: 5px;
                  "
                ),
                
                actionButton(
                       
                  inputId = "A13_1", 
                       
                  label = "Answer", 
                       
                  style = "
   
                    color: white; 
                    font-weight: bolder; 
                    font-size: 10pt;
                    background-color: grey; 
                    border: 5px solid black;
                    margin-top: 5px;
                  "
                )
              )
            ),
                 
            fluidRow(
                   
              div(
               
                style = "height:15px"
               
              ),
                   
              column(
                
                width = 8, 
                          
                textOutput("Q23_1")
              ),
                   
                   column(4,
                          
                          actionButton(
                            
                            inputId = "H23_1", 
                            
                            label = "Hint",
                            
                            style = "
                            color: white; 
                            font-weight: bolder; 
                            font-size: 10pt;
                            background-color: #4d004d; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          ),
                          
                          actionButton(
                            
                            inputId = "A23_1", 
                            
                            label = "Answer", 
                            
                            style = "
                            color: white; 
                            font-weight: bolder;
                            font-size: 10pt; 
                            background-color: grey; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          )
                          )          
                          ),
                 
                 fluidRow(
                   
                   div(style = "height:15px"),
                   
                   column(8, 
                          
                          textOutput("Q33_1")
                   ),
                   
                   column(4,
                          
                          actionButton(
                            
                            inputId = "H33_1", 
                            
                            label = "Hint",
                            
                            style = "
                            color: white; 
                            font-weight: bolder; 
                            font-size: 10pt;
                            background-color: #4d004d; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          ),
                          
                          actionButton(
                            
                            inputId = "A33_1", 
                            
                            label = "Answer", 
                            
                            style = "
                            color: white; 
                            font-weight: bolder;
                            font-size: 10pt; 
                            background-color: grey; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          )
                          )   
                          ),
                 
                 fluidRow(
                   
                   div(style = "height:15px"),
                   
                   column(8, 
                          
                          textOutput("Q43_1")
                   ),
                   
                   column(4,
                          
                          
                          actionButton(
                            
                            inputId = "H43_1", 
                            
                            label = "Hint",
                            
                            style = "
                            color: white; 
                            font-weight: bolder; 
                            font-size: 10pt;
                            background-color: #4d004d; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          ),
                          
                          actionButton(
                            
                            inputId = "A43_1", 
                            
                            label = "Answer", 
                            
                            style = "
                            color: white; 
                            font-weight: bolder;
                            font-size: 10pt; 
                            background-color: grey; 
                            border: 5px solid black;
                            margin-top: 5px;
                            "
                          )
                          )   
                          ) 
                          ), # End left help column
          
          column(
            
            width = 5, 
            
            offset = 0,
                 
                 fluidRow(
                   
                   div(style = "height:10px;"),
                   
                   # Hint and Answer Text Boxes -----------------------------------------
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cph13_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.H13_1"),
                         
                         textOutput("H1text3_1")
                         
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cpa13_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.A13_1"),
                         
                         textOutput("A1text3_1")
                         
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cph23_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.H23_1"),
                         
                         textOutput("H2text3_1")
                         
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cpa23_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.A23_1"),
                         
                         textOutput("A2text3_1")
                         
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cph33_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.H33_1"),
                         
                         textOutput("H3text3_1")
                         
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cpa33_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.A33_1"),
                         
                         textOutput("A3text3_1")
                       )
                     )
                   ),
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cph43_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.H43_1"),
                         
                         textOutput("H4text3_1")
                         
                       )
                     )
                   ),                                 
                   
                   shinyjs::hidden(
                     
                     div(
                       
                       id = "cpa43_1",
                       
                       conditionalPanel(
                         
                         condition = ("input.A43_1"),
                         
                         textOutput("A4text3_1")
                         
                       )
                     )
                   )
                 )
          ), # End help text column
          
          column(2,
                 
                 actionButton(
                   
                   inputId = "clear3_1", 
                   
                   label = "Clear Answer", 
                   
                   style = "
                   color: white; 
                   font-size: 10pt;
                   font-weight: bolder; 
                   background-color: darkgrey; 
                   border: 5px solid black;
                   margin-top: 5px;
                  "
                 )
          )
          
                          ) # End help box
        
                   )
    ),
    
    div(style = "height:15px"),
           
    column(
      
      width = 3, 
      
      offset = 0, 
                  
      shinydashboard::box(
        
        title = "Inputs", 
        
        width = "100%", 
        
        collapsible = F,
        
        status = "success", 
        
        solidHeader = T, 
                          
          column(
            
            width = 12, 
            
            offset = 0,
            
            fluidRow(
              
              div(style = "height:25px"),
              
              column(
                
                width = 12,
                
                offset = 0,
                
                actionButton(
                  
                  inputId = "draw3_1", 
                  
                  label = "New Simulation", 
                  
                  icon("play"), 
                  
                  style = "
                  color: white; 
                  font-weight: bold;
                  background-color: #3c95af; 
                  border: 4px solid black;
                  margin-top: 5px;
                  "
                )
              )
            ),
            
            fluidRow(
              
              div(style = "height:55px"),
              
              column(
                
                width = 12,
                
                uiOutput("confidence3_1")
              )
            
            ),
            
            fluidRow(
              
              div(style = "height:55px"),
              
              column(
                
                width = 12,
                
                uiOutput("smplsize3_1")
              )
              
            ),
            
            fluidRow(
              
              div(style = "height:55px"),
              
              column(
                
                width = 12,
                
                uiOutput("nsamples3_1")
              )
            ),
            
            fluidRow(
              
              div(style = "height:51px")
            )
          )
      )
    ),
           
    column(
      
      width = 9, 
      
      offset = 0,
                  
      shinydashboard::box(
        
        title = "Confidence Intervals", 
        
        width = "100%", 
        
        collapsible = F,
          
        status = "primary", 
        
        solidHeader = T,
                      
        column(
          
          width = 12, 
          
          offset = 0,
                             
          textOutput("miss3_1"),
                             
          plotOutput("plot3_1", height = 500)
        )
      )
    )
  ) # End fluidRow

) # End fluidPage

# ------------------------------------------------------------------------------
# END UI
# ------------------------------------------------------------------------------

