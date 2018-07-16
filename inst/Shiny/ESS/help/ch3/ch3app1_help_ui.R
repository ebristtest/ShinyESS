# ------------------------------------------------------------------------------
# UI ch3app1 
# ------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    textOutput("ch3app1_help_title"),
    
    paste("This app demonstrates the behaviour of confidence intervals.",
          "Move the confidence level and sample size sliders and observe",
          "how the confidence intervals change."
      
    )
  )
 
) # End fluidPage

# ------------------------------------------------------------------------------
# END UI
# ------------------------------------------------------------------------------

