# ------------------------------------------------------------------------------
# UI ch3app1 
# ------------------------------------------------------------------------------

fluidPage(
  
  includeCSS("www/help/ch3/ch3app1_help.css"),
  includeCSS("www/help/ch3/ch3app2_help.css"),
  includeCSS("www/help/ch4/ch4app1_help.css"),
  
  navbarPage(
    
    title = "Help Menu",
    
    navbarMenu(
      
      title = "Chapter 3",
      
      tabPanel(
        
        title = "Confidence Interval Demo",
        
        eval(parse(file = "help/ch3/ch3app1_help_ui.R"))
        
      ),
      
      tabPanel(
        
        title = "Distribution of the Means Demo",
        
        eval(parse(file = "help/ch3/ch3app2_help_ui.R"))
        
      )
    ),
    
    navbarMenu(
      
      title = "Chapter 4",
      
      tabPanel(
        
        title = "Estimation of a Population Mean or Total",
        
        eval(parse(file = "help/ch4/ch4app1_help_ui.R"))
      
      ),
      
      tabPanel(
        
        title =  "Sample Size Selection for a Population Mean or Total"
        
        
        
      ),
      
      tabPanel(
        
        title =  "Estimation of a Population Proportion"
        
        
        
      ),
      
      tabPanel(
        
        title =  "Sample Size Selection for a Population Proportion"
        
        
        
      ),
      
      tabPanel(
        
        title =  "Estimation of a Difference in Independent Means"
        
        
        
      ),
      
      tabPanel(
        
        title =  "Estimation of a Difference in Independent Proportions"
        
        
        
      ),
      
      tabPanel(
        
        title =  "Estimation of a Difference in Dependent Proportions"
        
        
        
      )
    ),
    
    navbarMenu(
      
      title = "Chapter 5",
      
      tabPanel(
        
        title =  "Estimation of a Population Mean or Total"
        
        
        
      )
    )
  )
 
) # End fluidPage

# ------------------------------------------------------------------------------
# END UI
# ------------------------------------------------------------------------------

