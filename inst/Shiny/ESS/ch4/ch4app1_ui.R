# ------------------------------------------------------------------------------
# UI ch4app1
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title41")
  ),
  
  fluidRow(
    
    div(style = "height:5px"),
    
    column(
      
      width = 5, 
      
      offset = 0,
      
      fluidRow(
        
        column(
          
          width = 7, 
          
          offset = 0,
          
          shinydashboard::box(
            
            title = "Inputs", 
            
            width = "100%", 
            
            collapsible = F,
              
            status = "success", 
            
            solidHeader = T, 
            
            radioButtons(
              
              inputId = "type41", 
              
              label = "Data Source",
                         
              choices = 
                
                c(
                
                  "Text Data" = "text_data41",
                    
                  "User Data" = "user_data41",
                                     
                  "User Values" = "user_values41"
                ),
                         
              selected = "text_data41",
              
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
              
              condition = "input.type41 == 'text_data41'",
            
              # Input: Text dataset --------------------------------------------
              
              uiOutput("select_dataset41"),
            
              #Input: Variable of interest(text data) --------------------------
              
              uiOutput("select_y41a"),
                               
              # Input: Population size (text data) -----------------------------
              
              uiOutput("select_N41a")
             
            ), # End text data panel 
             
            # Panel for user imported data -------------------------------------                    
            conditionalPanel(
               
              condition = "input.type41 == 'user_data41'",
              
              # Input: .csv file -----------------------------------------------
              
              uiOutput("select_csv41"),
                               
              # Input: Checkbox if file has header -----------------------------
              
              radioButtons(
                
                inputId = "header41", 
                
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
                
                inputId = "sep41", 
                           
                label = "Separator", 
                           
                choices = 
                  c(
                    Comma = ",", 
                           
                    Semicolon = ";",
                           
                    Tab = "\t"),
                           
                selected = ",",
                
                inline = T
              ),
                               
              # Input: The variable of interest (user data) --------------------
              
              uiOutput("select_y41b"),
                               
              # Input: The population size (user data) -------------------------
              
              uiOutput("select_N41b")                           
            
            ), # End user data panel
          
              # Panel for user input values ------------------------------------                    
            
            conditionalPanel(
              
              condition = "input.type41 == 'user_values41'",
              
              # Input: Sample mean ---------------------------------------------                   
              
              uiOutput("select_mean41c"),
              
              # Input: Sample variance -----------------------------------------                 
              
              uiOutput("select_var41c"),
            
              # Input: Sample size ---------------------------------------------                   
              
              uiOutput("select_n41c"),
            
              # Input: Population size -----------------------------------------                   
              
              uiOutput("select_N41c")
             
            ),
            
            actionButton(
              
              inputId = "preview_data4_1",
              
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
              
              id = "popup_preview_data4_1", 
              
              title = "Selected Data", 
              
              trigger = "preview_data4_1",
              
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
                        
                        DT::dataTableOutput("data_table41")
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
            
            collapsible = F,
              
            status = "warning", 
            
            solidHeader = T,
            
            uiOutput("checkrmoe41"),
            
            uiOutput("checkci41"),
            
            uiOutput("mult41"),
            
            uiOutput("digits41")
              
          ) # End output options box
              
        ) # End second column  
      )
    ),
               
        column(
          
          width = 7, 
          
          offset = 0,
               
          shinydashboard::box(
            
            title = "Output", 
            
            width = "100%", 
            
            status = "primary", 
              
            solidHeader = T, 
            
            collapsible = F,
                     
            div(style = 'overflow-x: scroll', 
                       
                tableOutput('output_table41')
            )
          )
              
    )  # End output box       
               
    # End column
    
  ) # End body
  
) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app1 
# ------------------------------------------------------------------------------

