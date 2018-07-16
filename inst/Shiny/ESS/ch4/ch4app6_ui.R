# ------------------------------------------------------------------------------
# UI ch4app6
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title46")
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
              
              inputId = "type46", 
              
              label = "Data Source",
                         
              choices = 
                
                c(
                
                  "Textbook Data" = "text_data46",
                    
                  "User Data" = "user_data46",
                                     
                  "User Values" = "user_values46"
                ),
                         
              selected = "text_data46",
              
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
              
              condition = "input.type46 == 'text_data46'",
            
              # Input: Text dataset --------------------------------------------
              fluidRow(
                
                column(
                  
                  width = 12, 
                
                  uiOutput("select_dataset46")
                )
                
              ),
              
              fluidRow( 
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 1st Variable of interest(text data) ------------------
                  
                  uiOutput("select_y1_46a"),
                  
                  #Input: 1st category of interest(text data) ------------------
                  
                  uiOutput("select_cat1_46a"),
                  
                  # Input: 1st Population size (text data) ---------------------
                  
                  uiOutput("select_N1_46a")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(text data) ------------------
                  
                  uiOutput("select_y2_46a"),
                  
                  #Input: 2nd category of interest(text data) ------------------
                  
                  uiOutput("select_cat2_46a"),
                  
                  # Input: 2nd Population size (text data) ---------------------
                  
                  uiOutput("select_N2_46a")  
                )
              )
             
            ), # End text data panel 
             
            # Panel for user imported data -------------------------------------                    
            conditionalPanel(
              
              condition = "input.type46 == 'user_data46'",
              
              fluidRow(
                
                column(
                  
                  width = 12, 
                  
                  offset = 0,
                  
                  # Input: .csv file -------------------------------------------
              
                  uiOutput("select_csv46")
                               
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  offset = 0,
                  
                  radioButtons(
                    
                    inputId = "header46", 
                    
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
                    
                    inputId = "sep46", 
                    
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
              
                  uiOutput("select_y1_46b"),
                  
                  #Input: 1st category of interest(user data) ------------------
                  
                  uiOutput("select_cat1_46b"),
              
                  # Input: 1st Population size (user data) ---------------------
                  
                  uiOutput("select_N1_46b")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  #Input: 2nd Variable of interest(user data) ------------------
              
                  uiOutput("select_y2_46b"),
                  
                  #Input: 2nd category of interest(user data) ------------------
                  
                  uiOutput("select_cat2_46b"),
              
                  # Input: 2nd Population size (user data) ---------------------
              
                  uiOutput("select_N2_46b")                         
            
                )
              )
            ), # End user data panel
          
              # Panel for user input values ------------------------------------                    
            
            conditionalPanel(
              
              condition = "input.type46 == 'user_values46'",
              
              fluidRow(
                
                column(
                  
                  width = 6, 
                  
                  offset = 0,
                  
                  # Input: 1st Sample proportion -------------------------------
                  
                  uiOutput("select_prop1_46c"),
                  
                  # Input: 1st Sample size -------------------------------------                 
                  
                  uiOutput("select_n1_46c"),
                  
                  # Input: 1st Population size ---------------------------------                 
                  
                  uiOutput("select_N1_46c")
                ),
                
                column(
                  
                  width = 6,
                  
                  offset = 0,
                  
                  # Input: 2nd Sample proportion -------------------------------                   
                  
                  uiOutput("select_prop2_46c"),
                  
                  # Input: 2nd Sample size -------------------------------------                
                  
                  uiOutput("select_n2_46c"),
                  
                  # Input: 2nd Population size ---------------------------------                 
                  
                  uiOutput("select_N2_46c")
                )
              )
            ), # End user values panel
            
            actionButton(
              
              inputId = "preview_data4_6",
              
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
              
              id = "popup_preview_data4_6", 
              
              title = "Selected Data", 
              
              trigger = "preview_data4_6",
              
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
                        
                        DT::dataTableOutput("data_table46")
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
              
              uiOutput("checkrmoe46"),
              
              uiOutput("checkci46"),
              
              uiOutput("mult46"),
              
              uiOutput("digits46")
            )
              
          ) # End output options box
              
        ) # End second column
            
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
            
            tableOutput('output_table46')
        )
        
      )
      
    )
    
  ) # End body
  
) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app6 
# ------------------------------------------------------------------------------

