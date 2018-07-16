# ------------------------------------------------------------------------------
# SERVER ch4app4
# ------------------------------------------------------------------------------

# Page title -------------------------------------------------------------------

output$title44 <- renderText({
  
  c("Sample Size Required to Estimate a Population Proportion Using a Simple",
    "Random Sample Design")
})

# Input proportion -------------------------------------------------------------

output$select_prop44 <- renderUI({
  
  numericInput(
    
    inputId = "prop44", 
    
    label = "Sample Proportion", 
    
    min = 0, 
    
    max = 1,
    
    value = NULL
  )
})

# Input population size --------------------------------------------------------

output$select_N44 <- renderUI({
  
  numericInput(
    
    inputId = "N44", 
    
    label = "Population Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input Bound (proportion) -----------------------------------------------------

output$select_Bprop44 <- renderUI({
  
  numericInput(
    
    inputId = "Bprop44", 
    
    label = "Desired Bound for Estimating the Population Proportion", 
               
    min = 0, 
    
    max = 1, 
    
    value = NULL
  )
})

# Input Bound (total) ----------------------------------------------------------

output$select_Btotal44 <- renderUI({
  
  numericInput(
    
    inputId = "Btotal44", 
    
    label = "Desired Bound for Estimating the Population Total", 
               
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input multiplier -------------------------------------------------------------

output$mult44 <- renderUI({
  
  numericInput(
    
    inputId = "mult44",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# Adjust Bound Propotion -------------------------------------------------------

output$adjust_Bprop44 <- renderUI({
  
  min_value <- (input$Bprop44 * 0.1) %>%
    signif(digits = 2)
  
  max_value <- (input$Bprop44 * 5) %>%
    signif(digits = 2)
  
  step_value <- ((input$Bprop44 * 5 - input$Bprop44 * .1) / 100) %>%
    signif(digits = 1)
  
  sliderInput(
    
    inputId = "Bprop44adj",
              
    label = "Adjust Bound (Proportion)",
              
    value = input$Bprop44, 
              
    min = min_value,
              
    max = max_value, 
              
    step = step_value,
              
    ticks = F,
              
    sep = ""
  )
})

# Adjust Bound Total -----------------------------------------------------------

output$adjust_Btotal44 <- renderUI({
  
  min_value <- (input$Btotal44 * 0.1) %>%
    signif(digits = 2)
  
  max_value <- (input$Btotal44 * 5) %>%
    signif(digits = 2)
  
  step_value <- ((input$Btotal44 * 5 - input$Btotal44 * .1) / 100) %>%
    signif(digits = 1)
  
  sliderInput(
    
    inputId = "Btotal44adj",
              
    label = "Adjust Bound (Total)",
              
    value = input$Btotal44, 
              
    min = min_value,
              
    max = max_value, 
              
    step = step_value,
              
    ticks = F,
              
    sep = ""
  )
})

# Output table -----------------------------------------------------------------

output$output_table44 <- function(){
  
  req(input$prop44, input$N44, input$mult44)
  
  s <- sqrt(input$prop44 * (1 - input$prop44))

  N <- input$N44
  
  Bprop <- input$Bprop44adj
  
  Btotal <- input$Btotal44adj
  
  mult <- input$mult44
  
  digits <- input$digits44
  
  n_prop <- (mult^2 * N * s^2) / ((N - 1) * Bprop^2 + mult^2 * s^2)
  
  n_total <- (mult^2 * N^3 * s^2) / ((N - 1) * Btotal^2 + mult^2 * s^2 * N^2)
  
  # Round sample sizes up to nearest integer 
  
  n_prop <- n_prop %>% 
      
    ceiling %>% 
      
    format(scientific = F, big.mark = ",")
      
   n_total <- n_total %>% 
      
    ceiling %>% 
      
    format(nsmall = 0, scientific = F, big.mark = ",")
  
  # Output table for both prop and total
  
  
  if(!is.null(Bprop) && !is.null(Btotal)) {
    
    req(input$Bprop44adj, input$Btotal44adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = 
        c(
          "Population Proportion", 
          "Population Total"
        ), 
                          
      `Sample Size Needed` = c(n_prop, n_total), 
                          
      `Desired Bound` = c(Bprop, Btotal)
    )
    
  
  } 
  
  # Output table for prop only
  
  else if(!is.null(Bprop)) {
    
    req(input$Bprop44adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = "Population Proportion", 
                          
      `Sample Size Needed` = n_prop, 
                          
      `Desired Bound` = Bprop
    )
  
  } 
  
  # Output table for total only
  
  else {

    req(input$Btotal44adj)
    
    out <- tibble::tibble(
      
      `Parameter to be Estimated` = "Population Total", 
                          
      `Sample Size Needed` = n_total, 
                          
      `Desired Bound` = Btotal
    )
    
  }
  
  # Format table as HTML Kable
  
  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app4
# ------------------------------------------------------------------------------

