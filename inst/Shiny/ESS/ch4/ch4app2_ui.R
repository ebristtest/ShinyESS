# ------------------------------------------------------------------------------
# UI ch4app2
# -------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title42")),
  
  fluidRow(
    
    div(style = "height:5px"),
           
    column(
      
      width = 3, 
      
      offset = 0,
                           
      shinydashboard::box(
        
        title = "Inputs", 
        
        width = "100%", 
        
        collapsible = T,
          
        status = "success", 
        
        solidHeader = T, 
        
        # Variance or sd -------------------------------------------------------
        uiOutput("var_or_sd42"),
        
        conditionalPanel(
          
          condition = "input.var_or_sd42 == 'type_var42'",
          
          # Input: Sample variance ---------------------------------------------
          
          uiOutput("select_var42")
        ),      
        
        conditionalPanel(
          
          condition = "input.var_or_sd42 == 'type_sd42'",
          
          # Input: Sample standard deviation -----------------------------------
          
          uiOutput("select_sd42")
        ), 
                               
        # Input: Population size -----------------------------------------------                    
                                 
        uiOutput("select_N42"),
            
        # Input: Desired Bound Mean --------------------------------------------
            
        uiOutput("select_Bmean42"),                     
            
        # Input: Desired Bound Total -------------------------------------------
            
        uiOutput("select_Btotal42")
                               
      ) # End input box
                           
    ), # End first column
                    
    column(
      
      width = 3, 
      
      offset = 0,
                           
      shinydashboard::box(
        
        title = "Output Options", 
        
        width = "100%", 
        
        collapsible = T,
          
        status = "warning", 
        
        solidHeader = T,
          
        conditionalPanel(
            
          condition = "input.Bmean42 > 0",                     
          
          uiOutput("adjust_BMean42")
        ),
          
        conditionalPanel(
            
          condition = "input.Btotal42 > 0",                     
            
          uiOutput("adjust_BTotal42")
        ),
                               
        uiOutput("mult42")
                               
      ) # End output options box
                           
    ), # End second column
                    
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
                                   
          tableOutput('output_table42')
        )
                               
      ) # End output box       
                           
    ) # End column
                    
  ) # End row

) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app2 
# ------------------------------------------------------------------------------


