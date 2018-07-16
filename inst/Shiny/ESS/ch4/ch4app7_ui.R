# ------------------------------------------------------------------------------
# UI ch4app7
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title47")
  ),
  
  fluidRow(
    
    div(style = "height:5px"),
    
    column(
      
      width = 6, 
      
      offset = 0,
      
      fluidRow(
        
        column(
          
          width = 8, 
          
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
              
              inputId = "type47", 
              
              label = "Data Source",
                         
              choices = 
                
                c(
                
                  "Textbook Data" = "text_data47",
                    
                  "User Data" = "user_data47",
                                     
                  "User Values" = "user_values47"
                ),
                         
              selected = "text_data47",
              
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
              
              condition = "input.type47 == 'text_data47'",
            
              # Input: Text dataset --------------------------------------------
              fluidRow(
                
                column(
                  
                  width = 12, 
                
                  uiOutput("select_dataset47")
                )
                
              ),
              
              fluidRow( 
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 1st Variable of interest(text data) ------------------
                  
                  uiOutput("select_y1_47a"),
                  
                  #Input: 1st category of interest(text data) ------------------
                  
                  uiOutput("select_cat1_47a")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(text data) ------------------
                  
                  uiOutput("select_y2_47a"),
                  
                  #Input: 2nd category of interest(text data) ------------------
                  
                  uiOutput("select_cat2_47a")
                )
              ),
            
              fluidRow(
                
                column(
                  
                  width = 12,
                  
                  # Input: Population size (text data) -------------------------
                  
                  uiOutput("select_N_47a")
                )
              
              )
             
            ), # End text data panel 
             
            # Panel for user imported data -------------------------------------                    
            conditionalPanel(
              
              condition = "input.type47 == 'user_data47'",
              
              fluidRow(
                
                column(
                  
                  width = 12, 
                  
                  offset = 0,
                  
                  # Input: .csv file -------------------------------------------
              
                  uiOutput("select_csv47")
                               
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  offset = 0,
                  
                  radioButtons(
                    
                    inputId = "header47", 
                    
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
                    
                    inputId = "sep47", 
                    
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
                  
                  width = 6,
                  
                  offset = 0,
                
                  #Input: 1st Variable of interest(user data) ------------------
              
                  uiOutput("select_y1_47b"),
                  
                  #Input: 1st category of interest(user data) ------------------
                  
                  uiOutput("select_cat1_47b")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(user data) ------------------
              
                  uiOutput("select_y2_47b"),
                  
                  #Input: 2nd category of interest(user data) ------------------
                  
                  uiOutput("select_cat2_47b")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 12,
                  
                  # Input: 1st Population size (user data) ---------------------
                  
                  uiOutput("select_N_47b")
                )
              )
            ), # End user data panel
          
              # Panel for user input values ------------------------------------                    
            
            conditionalPanel(
              
              condition = "input.type47 == 'user_values47'",
              
              fluidRow(
                
                column(
                  
                  width = 6, 
                  
                  offset = 0,
                  
                  # Input: 1st Sample proportion -------------------------------
                  
                  uiOutput("select_prop1_47c"),
                  
                  # Input: Sample size -----------------------------------------                 
                  
                  uiOutput("select_n_47c")
                  
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 2nd Sample proportion -------------------------------                   
                  
                  uiOutput("select_prop2_47c"),
                  
                  # Input: Population size -------------------------------------                 
                  
                  uiOutput("select_N_47c")
                )
              )
            ), # End user values panel
            
            actionButton(
              
              inputId = "preview_data4_7",
              
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
              
              id = "popup_preview_data4_7", 
              
              title = "Selected Data", 
              
              trigger = "preview_data4_7",
              
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
                        
                        DT::dataTableOutput("data_table47")
                      )
                  )
                  
                ) # End data preview box
                
              ) # End left column
              
            )
          )) # End input box and column
          
        ), # End first column
        
        column(
          
          width = 4, 
          
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
              
              uiOutput("checkrmoe47"),
              
              uiOutput("checkci47"),
              
              uiOutput("mult47"),
              
              uiOutput("digits47")
            )
              
          ) # End output options box
              
        ) 
            
      )
      
    ),         
      
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
            
            tableOutput('output_table47')
        )
        
      )  # End output box    
      
    ) # End bottom row
    
  )
  
) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app7
# ------------------------------------------------------------------------------

