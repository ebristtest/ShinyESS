# ------------------------------------------------------------------------------
# UI ch4app2
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title44")),
  
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
              
        # Input: Sample proportion ---------------------------------------------                 
                                 
        uiOutput("select_prop44"),
                               
        # Input: Population size -----------------------------------------------                   
                                 
        uiOutput("select_N44"),
            
        # Input: Desired Bound Proportion --------------------------------------
            
        uiOutput("select_Bprop44"),                     
            
        # Input: Desired Bound Total -------------------------------------------
            
        uiOutput("select_Btotal44")
                               
      ) # End input box
                           
    ), # End first column
                    
    column(3, offset = 0,
                           
      shinydashboard::box(
        
        title = "Output Options", 
        
        width = "100%", 
        
        collapsible = T,
          
        status = "warning", 
        
        solidHeader = T,
          
          conditionalPanel(
            
            condition = "input.Bprop44 > 0",                     
          
            uiOutput("adjust_Bprop44")
          ),
          
          conditionalPanel(
            
            condition = "input.Btotal44 > 0",                     
            
            uiOutput("adjust_Btotal44")
          ),
          
          uiOutput("mult44"),
          
          uiOutput("digits44")
          
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
                                   
              tableOutput('output_table44')
          )
                               
      ) # End output box       
                           
    ) # End column
                    
  ) # End row

) # End of fluidPage 

# ------------------------------------------------------------------------------
# END UI ch4app4
# ------------------------------------------------------------------------------
