# ------------------------------------------------------------------------------
# UI ch4app3
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    # Page title ---------------------------------------------------------------
    
    uiOutput("title43")),
  
  fluidRow(
    
    div(style = "height:5px"),
    
    column(
      
      width = 5, 
      
      offset = 0,
      
      fluidRow(
        
        column(
          
          width = 7, 
          
          offset = 0,
          
          # Input box ----------------------------------------------------------
          
          shinydashboard::box(
            
            title = "Inputs", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "success", 
            
            solidHeader = T, 
            
            # Select input type ------------------------------------------------
            
            radioButtons(
              
              inputId = "type43", 
              
              label = "Data Source",
                         
              choices = c(
                
                "Text Data" = "text_data43",
                                     
                "User Data" = "user_data43",
                                     
                "User Values" = "user_values43"
              ),
                         
              selected = "text_data43",
              
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
              
              condition = "input.type43 == 'text_data43'",
            
              # Input: Text dataset --------------------------------------------
              
              uiOutput("select_dataset43"),
            
              # Input: Variable of interest (text data) ------------------------
              
              uiOutput("select_y43a"),
              
              # Input: Category of interest (text data) ------------------------
              
              uiOutput("select_cat43a"),
                               
              # Input: Population size (text data) -----------------------------
              
              uiOutput("select_N43a")
             
            ), # End text data panel 
             
            # Panel for user imported data -------------------------------------                   
            
            conditionalPanel(
               
              condition = "input.type43 == 'user_data43'",
              
              # Input: .csv file -----------------------------------------------
              
              uiOutput("select_csv43"),
                               
              # Input: Checkbox if file has header -----------------------------
              
              radioButtons(
                
                inputId = "header43", 
                
                label = "Header", 
                
                choices = c(
                  
                  Yes = "yes",
                  
                  No = "no"
                ),
                
                selected = "yes",
                
                inline = T
              ),
                               
              # Input: Select separator ----------------------------------------
              
              radioButtons(
                
                inputId = "sep43", 
                           
                label = "Separator", 
                           
                choices = c(
                  
                  Comma = ",", 
                           
                  Semicolon = ";",
                           
                  Tab = "\t"
                ),
                           
                selected = ",",
                
                inline = T
              ),
                               
              # Input: The variable of interest (user data) --------------------
              
              uiOutput("select_y43b"),
              
              # Input: Category of interest (user data) ------------------------
              
              uiOutput("select_cat43b"),
                               
              # Input: The population size (user data) -------------------------
              
              uiOutput("select_N43b")                           
            
            ), # End user data panel
          
              # Panel for user input values ------------------------------------                   
            
            conditionalPanel(
              
              condition = "input.type43 == 'user_values43'",
              
              # Input: Sample proportion ---------------------------------------                  
              
              uiOutput("select_prop43c"),
            
              # Input: Sample size ---------------------------------------------                  
              
              uiOutput("select_n43c"),
            
              # Input: Population size -----------------------------------------                 
              
              uiOutput("select_N43c")
             
            ),
            
            actionButton(
              
              inputId = "preview_data4_3",
              
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
              
              id = "popup_preview_data4_3", 
              
              title = "Selected Data", 
              
              trigger = "preview_data4_3",
              
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
                        
                        DT::dataTableOutput("data_table43")
                      )
                  )
                  
                ) # End data preview box
                
              ) # End left column
              
            ) # Modal
            
          ) # End input box
          
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
            
            # Option for RMoE --------------------------------------------------
            
            uiOutput("checkrmoe43"),
            
            # Option for interval ----------------------------------------------
            
            uiOutput("checkci43"),
            
            conditionalPanel(
              
              condition = "input.checkci43",
              
              # Option for interval method -------------------------------------
              
              uiOutput("method43"),
              
              conditionalPanel(
                
                condition = "input.method43 == 'stand43'",
                
                # Set multiplier for standard C.I. -----------------------------
                
                uiOutput("mult43")
              ),
              
              conditionalPanel(
                
                condition = "input.method43 == 'ac43'",
                
                # Set confidence level for A-C C.I. ----------------------------
                
                uiOutput("conf43")
              )
              
            ),
            
            # Set the number of digits displayed -------------------------------
            
            uiOutput("digits43")
              
          ) # End output options box
              
        ) # End second column
            
      )
      
    ), # End left column
    
    column(
      
      width = 7, 
      
      offset = 0,
      
      shinydashboard::box(
        
        title = "Output", 
        
        width = "100%", 
        
        status = "primary", 
        
        solidHeader = T, 
        
        collapsible = T,
        
        div(
          
          style = 'overflow-x: scroll', 
            
          # Output results   
            
          tableOutput('output_table43')
        )
        
      )  # End output box      
      
    ) # End left column
    
  ) # End body
  
) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app3
# ------------------------------------------------------------------------------