# ------------------------------------------------------------------------------
# UI ch4app5
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title45")
  ),
  
  fluidRow(
    
    div(style = "height:5px"),
    
    column(
      
      width = 6, 
      
      offset = 0,
      
      fluidRow(
        
        column(
          
          width = 7, 
          
          offset = 0,
          
          shinydashboard::box(
            
            title = "Inputs", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "success", 
            
            solidHeader = T,
            
            column(
              
              width = 12,
              
              offset = 0, 
            
            radioButtons(
              
              inputId = "type45", 
              
              label = "Data Source",
                         
              choices = 
                
                c(
                
                  "Textbook Data" = "text_data45",
                    
                  "User Data" = "user_data45",
                                     
                  "User Values" = "user_values45"
                ),
                         
              selected = "text_data45",
              
              inline = T
            ),
          
            # ------------------------------------------------------------------
            # Three conditional panels for three different input types:
            # (1) Data from the textbook
            # (2) Data from a user selected .csv file
            # (3) Sample statistics entered by the user 
            # ------------------------------------------------------------------
        
            # Panel for text data ----------------------------------------------
            
            conditionalPanel(
              
              condition = "input.type45 == 'text_data45'",
            
              # Input: Text dataset --------------------------------------------
              fluidRow(
                
                column(
                  
                  width = 12, 
                
                  uiOutput("select_dataset45")
                )
                
              ),
              
              fluidRow( 
                
                column(
                  
                  width = 12,
                  
                  offset = 0,
                  
                  #Input: 1st Variable of interest(text data) ------------------
                  
                  uiOutput("select_y1_45a")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 12,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(text data) ------------------
                  
                  uiOutput("select_y2_45a")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 1st Population size (text data) ---------------------
                  
                  uiOutput("select_N1_45a")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 2nd Population size (text data) ---------------------
                  
                  uiOutput("select_N2_45a")  
                )
              )
             
            ), # End text data panel 
             
            # Panel for user imported data -------------------------------------                    
            conditionalPanel(
              
              condition = "input.type45 == 'user_data45'",
              
              fluidRow(
                
                column(
                  
                  width = 12, 
                  
                  offset = 0,
                  
                  # Input: .csv file -------------------------------------------
              
                  uiOutput("select_csv45")
                               
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  offset = 0,
                  
                  radioButtons(
                    
                    inputId = "header45", 
                    
                    label = "Header", 
                    
                    choices = c(
                      
                      Yes = "yes",
                      
                      No = "no"
                    ),
                    
                    selected = "yes",
                    
                    inline = T
                  )
                ),
                
                column(
                  
                  width = 8,
                  
                  offset = 0,
                  
                  # Input: Select separator ------------------------------------
                  
                  radioButtons(
                    
                    inputId = "sep45", 
                    
                    label = "Separator", 
                    
                    choices = c(
                      
                      Comma = ",", 
                        
                      Semicolon = ";",
                        
                      Tab = "\t"
                    ),
                    
                    selected = ",",
                    
                    inline = T
                  )
                )
              ),
              
              fluidRow( 
                
                column(
                  
                  width = 12,
                  
                  offset = 0,
                  
                  #Input: 1st Variable of interest(text data) ------------------
                  
                  uiOutput("select_y1_45b")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 12,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(text data) ------------------
                  
                  uiOutput("select_y2_45b")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 1st Population size (text data) ---------------------
                  
                  uiOutput("select_N1_45b")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 2nd Population size (text data) ---------------------
                  
                  uiOutput("select_N2_45b")  
                )
              )
            ), # End user data panel
          
              # Panel for user input values ------------------------------------                    
            
            conditionalPanel(
              
              condition = "input.type45 == 'user_values45'",
              
              fluidRow(
                
                column(
                  
                  width = 6, 
                  
                  offset = 0,
                  
                  # Input: 1st Sample mean -------------------------------------
                  
                  uiOutput("select_mean1_45c"),
                  
                  # Input: 1st Sample variance ---------------------------------              
                  
                  uiOutput("select_var1_45c"),
                  
                  # Input: 1st Sample size -------------------------------------                 
                  
                  uiOutput("select_n1_45c"),
                  
                  # Input: 1st Population size ---------------------------------                 
                  
                  uiOutput("select_N1_45c")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 2nd Sample mean -------------------------------------                   
                  
                  uiOutput("select_mean2_45c"),
                  
                  # Input: 2nd Sample variance ---------------------------------                 
                  
                  uiOutput("select_var2_45c"),
                  
                  # Input: 2nd Sample size -------------------------------------                
                  
                  uiOutput("select_n2_45c"),
                  
                  # Input: 2nd Population size ---------------------------------                 
                  
                  uiOutput("select_N2_45c")
                )
              )
            ), # End user values panel
            
            actionButton(
              
              inputId = "preview_data4_5",
              
              label = "Preview Data",
              
              width = "150px",
              
              style = "
              
              color: black; 
              font-weight: bold; 
              font-size: 11pt;
              background-color: #f4f4f4; 
              border: 3px solid black;
              margin-top: 15px;
              border-radius: 10px;
              "
            ),
            
            bsModal(
              
              id = "popup_preview_data4_5", 
              
              title = "Selected Data", 
              
              trigger = "preview_data4_5",
              
              size = "large",
              
              column(
                
                width = 12, 
                
                offset = 0,
                
                shinydashboard::box(
                  
                  title = NULL, 
                  
                  width = "100%", 
                  
                  status = "warning", 
                  
                  solidHeader = F, 
                  
                  collapsible = F,
                  
                  div(style = 'overflow-x: scroll',
                      
                      column(
                        
                        width = 12,
                        
                        DT::dataTableOutput("data_table45")
                      )
                  )
                  
                ) # End data preview box
                
              ) # End left column
              
            ) # Modal
            
          )) # End input box and column
          
        ), # End first column
        
        column(
          
          width = 5, 
          
          offset = 0,
          
          shinydashboard::box(
            
            title = "Output Options", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "warning", 
            
            solidHeader = T,
            
            column(
              
              width = 12,
              
              offset = 0,
              
              uiOutput("checkrmoe45"),
              
              uiOutput("checkci45"),
              
              uiOutput("mult45"),
              
              uiOutput("digits45")
            )
              
          ) # End output options box
              
        ) # End second column
            
      )
      
    ), # End left column
    
    column(
      
      width = 6, 
      
      offset = 0,
      
      shinydashboard::box(
        
        title = "Output", 
        
        width = "100%", 
        
        status = "primary", 
        
        solidHeader = T, 
        
        collapsible = T,
        
        div(style = 'overflow-x: scroll', 
            
            tableOutput('output_table45')
        )
        
      )  # End output box   
      
    ) # End left column
    
  ) # End body
  
) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app5 
# ------------------------------------------------------------------------------


