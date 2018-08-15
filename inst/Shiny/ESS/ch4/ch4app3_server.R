# ------------------------------------------------------------------------------
# SERVER ch4app3
# ------------------------------------------------------------------------------

# Page Title -------------------------------------------------------------------

output$title43 <- renderText({
  
  c("Estimation of a Population Proportion Using a Simple Random Sample Design")
})

# Text data options ------------------------------------------------------------

dataset_choices43 <- eval(parse(file = "datasets/data_list.R"))

# Text data options ------------------------------------------------------------

datasetInput43a <- reactive({
  
  req(input$type43, input$dataset43)
  
  switch(
    
    input$dataset43,
    
    eval(parse(text = input$dataset43))
  )
}) 

# Input file -------------------------------------------------------------------

datasetInput43b <- reactive({
  
  req(input$type43, input$file43)
  
  read.csv(input$file43$datapath,
           
  header = ifelse(input$header43 == "yes", TRUE, FALSE),
    
  sep = input$sep43)
})

# Switch data ------------------------------------------------------------------

data43 <- reactive({
  
  req(datasetInput43a, datasetInput43b)
  
  if(input$type43 == "user_data43") {
    
    datasetInput43b()
  }
  
  else {
    
    datasetInput43a()
  }
})

# Select the variable of interest  ---------------------------------------------

output$select_dataset43 <- renderUI({
  
  selectInput(
    
    inputId = "dataset43",
    
    label = "Choose a Dataset",
    
    choices = dataset_choices43,
    
    selected = "ShinyESS::data5.1example"
  )
})

# Select .csv file -------------------------------------------------------------

output$select_csv43 <- renderUI({
  
  fileInput(
    
    inputId = "file43", 
    
    label = "Choose a .CSV File",
           
    multiple = TRUE,
    
    accept = c(
      
      "text/csv", 
      
      "text/comma-separated-values,text/plain",
               
      ".csv"
    )
  )
})

# Select text variable ---------------------------------------------------------

output$select_y43a <- renderUI({
  
  req(data43())
  
  selectInput(
    
    inputId = "yvar43a",
              
    label = "Choose a Variable",
              
    choices = names(data43())
  )
})

# Select user data variable ----------------------------------------------------

output$select_y43b <- renderUI({
  
  req(data43())
  
  selectInput(
    
    inputId = "yvar43b",
              
    label = "Choose a Variable",
              
    choices = names(data43())
  )
})

# Input select category (user data) --------------------------------------------

output$select_cat43a <- renderUI({
  
  req(input$yvar43a, data43())
  
  selectInput(
    
    inputId = "cat43a",
    
    label = "Choose a Category",
              
    choices = data43()[[input$yvar43a]] %>% as.factor() %>% levels()
  )
})

# Input select category (user data) --------------------------------------------

output$select_cat43b <- renderUI({
  
  req(input$yvar43b, data43())
  
  selectInput(
    
    inputId = "cat43b",
              
    label = "Choose a Category",
              
    choices = data43()[[input$yvar43b]] %>% as.factor() %>% levels()
  )
})

# Input population total (text data) -------------------------------------------

output$select_N43a <- renderUI({
  
  req(data43())
  
  numericInput(
    
    inputId = "popsize43a",
               
    label = "Population Size",
               
    min = nrow(data43()),
    
    max = Inf,
               
    value = (nrow(data43()) * 10)
  )
})

# Input population total (user data) -------------------------------------------

output$select_N43b <- renderUI({
  
  req(data43())
  
  numericInput(
    
    inputId = "popsize43b",
               
    label = "Population Size",
               
    min = nrow(data43()),
           
    max = Inf,
    
    value = (nrow(data43()) * 10)
  )
})

# Input proportion -------------------------------------------------------------

output$select_prop43c <- renderUI({
  
  numericInput(
    
    inputId = "prop43c", 
    
    label = "Sample Proportion", 
    
    min = 0, 
    
    max = 1, 
    
    value = 1
  )
})

# Input sample size ------------------------------------------------------------

output$select_n43c <- renderUI({
  
  numericInput(
    
    inputId = "n43c", 
    
    label = "Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input population size --------------------------------------------------------

output$select_N43c <- renderUI({
  
  req(input$n43c)
  
  numericInput(
    
    inputId = "N43c", 
    
    label = "Population Size", 
    
    min = input$n43c, 
    
    max = Inf, 
    
    value = input$n41c * 10
  )
})

# Multiplier -------------------------------------------------------------------

output$mult43 <- renderUI({
  
  numericInput(
    
    inputId = "mult43",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# Confidence Level -------------------------------------------------------------

output$conf43 <- renderUI({
  
  sliderInput(
    
    inputId = "conf43",

    label = "Confidence Level",
               
    value = 95, 
    
    min = 50, 
    
    max = 99, 
    
    ticks = F,
    
    post = "%"
  )
})

# Method -----------------------------------------------------------------------
output$method43 <- renderUI({
  
  radioButtons(
    
    inputId = "method43", 
    
    label = "Interval Method",
               
    choices = c(
        
      "Standard Asymptotic" = "stand43",
      
      "Agresti-Coull" = "ac43"
    ),
               
    selected = "stand43"
  )
})

# RMoE -------------------------------------------------------------------------
output$checkrmoe43 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe43",
    
    label = "RMoE",
    
    choices = c(
      
      Yes = "yes",
      
      No = "no"
    ),
    
    selected = "no",
    
    inline = T
  )
})

# Interval ---------------------------------------------------------------------

output$checkci43 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci43",
    
    label = "Interval",
    
    choices = c(
      
      Yes = "yes",
      
      No = "no"
    ),
    
    selected = "yes",
    
    inline = T
  )
})

# Number of digits to display --------------------------------------------------

output$digits43 <- renderUI({
  
  sliderInput(
    
    inputId = "digits43",
              
    label = "Number of Decimals",
            
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F
  )
})

# Preview data -----------------------------------------------------------------

output$data_table43 <- DT::renderDataTable({
  
  req(input$type43)
  
  data <- data43()
  
  if(input$type43 == "user_values43") {
    
    data <- NULL
    
  } else {
    
    req(data43())
    
    DT::datatable(
      
      data, 
      
      rownames = F, 
      
      style = 'bootstrap',
      
      options = list(
        
        columnDefs = list(
          
          list(
            
            className = 'dt-right', targets = "_all"
          )
        )
      )
    ) %>% 
      
      DT::formatStyle(
        
        columns = 1:ncol(data), 
        
        fontSize = '12pt'
      )
  }
})

# Output Table -----------------------------------------------------------------

output$output_table43 <- function() {
  
  req(input$digits43, data43(), input$type43, input$method43)
  
  show_rmoe <- ifelse(input$checkrmoe43 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci43 == 'yes', TRUE, FALSE)
  
  # Inputs from text data
  
  if (input$type43 == "text_data43") {
    
    req(input$cat43a, input$yvar43a, input$popsize43a)
    
    p_hat <- mean(na.omit(data43()[[input$yvar43a]] == input$cat43a))
    
    n <- length(na.omit(data43()[[input$yvar43a]]))
    
    N <- input$popsize43a
  }
  
  # Inputs from user data
  
  else if(input$type43 == "user_data43") {
    
    req(input$cat43b, input$yvar43b, input$popsize43b)
    
    p_hat <- mean(na.omit(data43()[[input$yvar43b]] == input$cat43b))
    
    n <- length(na.omit(data43()[[input$yvar43b]]))
    
    N <- input$popsize43b
  }
  
  # Inputs from user values
  
  else {
    
    req(input$prop43c, input$n43c, input$N43c)
    
    p_hat <- input$prop43c
    
    n <- input$n43c
    
    N <- input$N43c 
  }
  
  # C.I. for A-C 
  
  if(input$method43 == "ac43") {
    
    req(input$conf43)
    
    # alpha level
    alpha <- (0.5 - input$conf43 / 200)
    
    # critical z
    z <- qnorm(1 - alpha)
    
    # z-squared
    z2 <- z * z
    
    # Adjust number of "events"
    x_adj <- p_hat * n + 0.5 * z2
    
    # Adjust number of observations
    n_adj <- n + z2
    
    # A-C proportion
    p_hat_adj <- x_adj / n_adj
    
    # A-C standard deviation
    sd_prop <- sqrt((1 - n / N) * (p_hat_adj * (1 - p_hat_adj)) / (n_adj))
    
    # A-C margin of error
    moe_prop <- z * sd_prop
    
    # A-C C.I. bounds proportion
    ci_lwr_prop <- max(p_hat_adj - moe_prop, 0)
    
    ci_upr_prop <- min(p_hat_adj + moe_prop, 1)
    
    # A-C C.I. bounds total
    ci_lwr_total <- ci_lwr_prop * N
    
    ci_upr_total <- ci_upr_prop * N
  }
  
  # C.I. Standard Method
  
  if(input$method43 == "stand43") {
    
    req(input$mult43)
    
    # Standard deviation
    sd_prop <- sqrt((1 - n / N) * (p_hat * (1 - p_hat)) / (n - 1))
    
    # Margin of error
    moe_prop <- input$mult43 * sd_prop
    
    # C.I. bounds proportion
    ci_lwr_prop <- max(p_hat - moe_prop, 0)
    
    ci_upr_prop <- min(p_hat + moe_prop, 1)
    
    # C.I. bounds total
    ci_lwr_total <- ci_lwr_prop * N
    
    ci_upr_total <- ci_upr_prop * N
  }
  
  # estimated population total
  total <- p_hat * N
  
  # standard deviation of population total
  sd_total <- sqrt(N^2 * (1 - n / N) * (p_hat * (1 - p_hat)) / (n - 1))
  
  # margin of error of population total
  moe_total <- (ci_upr_total - ci_lwr_total) / 2
 
  # default output table 
  out <- tibble::tibble(
    
    `Parameter` = c("Population Proportion", "Population Total"), 
                        
    `Estimate` = c(p_hat, total), 
                        
    `Std. Error` = c(sd_prop, sd_total),
                        
    `MoE` = c(moe_prop, moe_total)
  )
  
  # Add RMoE if Selected
  
  if(show_rmoe) {
    
    rmoe_p_hat <- (moe_prop / p_hat) * 100
    
    rmoe_total <- (moe_total / total) * 100
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `RMoE (%)` = c(rmoe_p_hat, rmoe_total)
    )
  }
  
  # Add Confidence Intervals if Selected
    
  if(show_ci) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `Lower Bound` = c(ci_lwr_prop, ci_lwr_total),
                                 
      `Upper Bound` = c(ci_upr_prop, ci_upr_total)
    )
  }
  
  # Format Numeric Values
  
  out2 <- 
    
    out[2:ncol(out)] %>% 
      
    as.data.frame() %>% 
    
    round(input$digits43) %>% 
    
    format(nsmall = input$digits43, scientific = F, big.mark = ",")
  
  # Merge Formatted Values With Parameter Names
  
  out <- dplyr::bind_cols(out[1], out2)
  
  # Format Output as HTML Kable
  
  out %>%
  
  knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app3
# ------------------------------------------------------------------------------
