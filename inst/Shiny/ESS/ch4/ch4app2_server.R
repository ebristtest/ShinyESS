# --------------------------------------------------------------------------------------------------
# SERVER ch4app2
# --------------------------------------------------------------------------------------------------

# Page title ---------------------------------------------------------------------------------------

output$title42 <- renderText({
  
  c("Sample Size Required to Estimate a Population Mean or Total Using a",
    "Simple Random Sample Design")
})

output$var_or_sd42 <- renderUI({
  
  radioButtons(
    
    inputId = "var_or_sd42",
    
    label = "Variance or Standard Deviation",
    
    choices = c(
      
      "Variance" = "type_var42",
      
      "Standard Deviation" = "type_sd42"
    ),
    
    selected = "type_var42",
    
    inline = T
  )
})

# Input sample variance ----------------------------------------------------------------------------

output$select_var42 <- renderUI({
  
  req(input$var_or_sd42)
  
  numericInput(
    
    inputId = "var42", 
    
    label = "Sample Variance", 
    
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input sample sd ----------------------------------------------------------------------------------

output$select_sd42 <- renderUI({
  
  req(input$var_or_sd42)
  
  numericInput(
    
    inputId = "sd42", 
    
    label = "Sample Standard Deviation", 
    
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input population size ----------------------------------------------------------------------------

output$select_N42 <- renderUI({
  
  numericInput(
    
    inputId = "N42", 
    
    label = "Population Size", 
    
    min = 2,  
    
    max = Inf,  
    
    value = NULL
  )
})

# Input mean bound ---------------------------------------------------------------------------------

output$select_Bmean42 <- renderUI({
  
  numericInput(
    
    inputId = "Bmean42", 
    
    label = "Desired Bound for Estimating the Population Mean", 
               
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input total bound --------------------------------------------------------------------------------

output$select_Btotal42 <- renderUI({
  
  numericInput(
    
    inputId = "Btotal42", 
    
    label = "Desired Bound for Estimating the Population Total", 
               
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input multiplier ---------------------------------------------------------------------------------

output$mult42 <- renderUI({
  
  numericInput(
    
    inputId = "mult42",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# Adjust mean bound --------------------------------------------------------------------------------

output$adjust_BMean42 <- renderUI({
  
  min_value <- (input$Bmean42 * 0.1) %>%
    signif(digits = 2)
  
  max_value <- (input$Bmean42 * 5) %>%
    signif(digits = 2)
  
  step_value <- ((input$Bmean42 * 5 - input$Bmean42 * .1) / 100) %>%
    signif(digits = 1)
  
  sliderInput(
    
    inputId = "BMean42adj",
              
    label = "Adjust Bound (Mean)",
              
    value = input$Bmean42, 
              
    min = min_value,
              
    max = max_value, 
              
    step = step_value,
              
    ticks = F,
    
    sep = ""
  )
})

# Adjust total bound -------------------------------------------------------------------------------

output$adjust_BTotal42 <- renderUI({
  
  min_value <- (input$Btotal42 * 0.1) %>%
    signif(digits = 2)
  
  max_value <- (input$Btotal42 * 5) %>%
    signif(digits = 2)
  
  step_value <- ((input$Btotal42 * 5 - input$Btotal42 * .1) / 100) %>%
    signif(digits = 1)
  
  sliderInput(
    
    inputId = "BTotal42adj",
              
    label = "Adjust Bound (Total)",
              
    value = input$Btotal42, 
              
    min = min_value,
              
    max = max_value, 
              
    step = step_value,
              
    ticks = F,
    
    sep = ""
  )
})

# Output table -------------------------------------------------------------------------------------

output$output_table42 <- function(){
  
  req(input$N42, input$mult42, input$var_or_sd42)
  
  if(input$var_or_sd42 == "type_var42") {
  
    req(input$var42)
    
    # standard deviation
  
    s <- sqrt(input$var42)
  }
  
  if(input$var_or_sd42 == "type_sd42") {
    
    req(input$sd42)
    
    # standard deviation
    
    s <- input$sd42
  }
  
  # Population size
  
  N <- input$N42
  
  # Bound for mean
  
  Bmean <- input$BMean42adj
  
  # Bound for total
  
  Btotal <- input$BTotal42adj
  
  # Multiplier
  
  mult <- input$mult42
  
  # Sample size required (mean)
  
  n_mean <- 
    
    ceiling(
      
      (mult^2 * N * s^2) / ((N - 1) * Bmean^2 + mult^2 * s^2)
    )
  
  # Sample size required (total)
  
  n_total <- 
    
    ceiling(
    
      (mult^2 * N^3 * s^2) / ((N - 1) * Btotal^2 + mult^2 * s^2 * N^2)
    )
  
  # Output table (Mean and Total) ------------------------------------------------------------------
  
  if(!is.null(Bmean) && !is.null(Btotal)) {
    
    req(input$BMean42adj, input$BTotal42adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = c("Population Mean", "Population Total"), 
                          
      `Sample Size Needed` = c(n_mean, n_total), 
                          
      `Desired Bound` = c(Bmean, Btotal)
    )
  
  } 
  
  # Output table (Mean) ----------------------------------------------------------------------------
  
  else if(!is.null(Bmean)) {
    
    req(input$BMean42adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = "Population Mean", 
                          
      `Sample Size Needed` = n_mean, 
                          
      `Desired Bound` = Bmean
    )
  
  } 
  
  # Output table (Total) ---------------------------------------------------------------------------
  
  else {
  
    req(input$BTotal42adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = "Population Total", 
                          
      `Sample Size Needed` = n_total, 
                          
      `Desired Bound` = Btotal
    )
    
  } 

  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# --------------------------------------------------------------------------------------------------
# END SERVER chp4app2
# --------------------------------------------------------------------------------------------------

