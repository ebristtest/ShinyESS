# ------------------------------------------------------------------------------
# SERVER ch4app7
# ------------------------------------------------------------------------------

# Page title -------------------------------------------------------------------

output$title47 <- renderText({
  
  c("Comparing Two Dependent Proportions from Simple Random Samples")
  
})

# Number of digits to display --------------------------------------------------
output$digits47 <- renderUI({
  
  sliderInput(
    
    inputId = "digits47",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
})

# Text data options ------------------------------------------------------------

dataset_choices47 <- eval(parse(file = "datasets/data_list.R"))

# Select text data -------------------------------------------------------------

datasetInput47a <- reactive({
  
  req(input$type47, input$dataset47)
  
  switch(
    
    input$dataset47,
    
    eval(parse(text = input$dataset47))
  )
}) 

# Select user data file --------------------------------------------------------

datasetInput47b <- reactive({
  
  req(input$type47, input$file47)
  
  read.csv(
    
    input$file47$datapath,
           
    header = ifelse(input$header47 == "yes", TRUE, FALSE),
           
    sep = input$sep47
  )
})

data47 <- reactive({
  
  req(datasetInput47a, datasetInput47b)
  
  if(input$type47 == "user_data47") {
    
    datasetInput47b()
  } 
  
  else {
    
    datasetInput47a()
  }
})

# Select the variable of interest  ---------------------------------------------

output$select_dataset47 <- renderUI({
  
  selectInput(
    
    inputId = "dataset47",
              
    label = "Choose a Dataset",
              
    choices = dataset_choices47,
    
    selected = "ShinyESS::data5.1example"
  )
})

# Select .csv ------------------------------------------------------------------

output$select_csv47 <- renderUI({
  
  fileInput(
    
    inputId = "file47", 
    
    label = "Choose CSV File",
            
    multiple = TRUE,
            
    accept = 
      c(
        "text/csv", 
                       
        "text/comma-separated-values,text/plain",
                       
        ".csv"
      )
  )
})

# Select 1st variable from text data -------------------------------------------

output$select_y1_47a <- renderUI({
  
  req(data47())
  
  selectInput(
    
    inputId = "yvar1_47a",
              
    label = "Choose 1st Variable",
              
    choices = names(data47())
  )
})

# Select 1st category from text data -------------------------------------------

output$select_cat1_47a <- renderUI({
  
  req(data47(), input$yvar1_47a)
  
  selectInput(
    
    inputId = "cat1_47a",
    
    label = "Choose the Category of Interest",
    
    choices = data47()[[input$yvar1_47a]] %>% as.factor() %>% levels()
  )
})

# Select 2nd variable from text data -------------------------------------------

output$select_y2_47a <- renderUI({
  
  req(data47())
  
  selectInput(
    
    inputId = "yvar2_47a",
    
    label = "Choose 2nd Variable",
    
    choices = names(data47())
  )
})

# Select 2nd category from text data -------------------------------------------

output$select_cat2_47a <- renderUI({
  
  req(data47(), input$yvar2_47a)
  
  selectInput(
    
    inputId = "cat2_47a",
    
    label = "Choose the Category of Interest",
    
    choices = data47()[[input$yvar2_47a]] %>% as.factor() %>% levels()
  )
})

# Select 1st variable from user data -------------------------------------------

output$select_y1_47b <- renderUI({
  
  req(data47())
  
  selectInput(
    
    inputId = "yvar1_47b",
              
    label = "Choose 1st Variable",
              
    choices = names(data47())
  )
})

# Select 1st category from user data -------------------------------------------

output$select_cat1_47b <- renderUI({
  
  req(data47(), input$yvar1_47b)
  
  selectInput(
    
    inputId = "cat1_47b",
    
    label = "Choose the Category of Interest",
    
    choices = data47()[[input$yvar1_47b]] %>% as.factor() %>% levels()
  )
})

# Select 2nd variable from user data -------------------------------------------

output$select_y2_47b <- renderUI({
  
  req(data47())
  
  selectInput(
    
    inputId = "yvar2_47b",
    
    label = "Choose 2nd Variable",
    
    choices = names(data47())
  )
})

# Select 2nd category from user data -------------------------------------------

output$select_cat2_47b <- renderUI({
  
  req(data47(), input$yvar2_47b)
  
  selectInput(
    
    inputId = "cat2_47b",
    
    label = "Choose the Category of Interest",
    
    choices = data47()[[input$yvar2_47b]] %>% as.factor() %>% levels()
  )
})

# Input population size text data ----------------------------------------------

output$select_N_47a <- renderUI({
  
  req(data47())
  
  numericInput(
    
    inputId = "popsize_47a",
               
    label = "Population Size",
               
    min = nrow(data47()),
               
    value = (nrow(data47()) * 10)
  )
})

# Input population size user data ----------------------------------------------

output$select_N_47b <- renderUI({
  
  req(data47())
  
  numericInput(
    
    inputId = "popsize_47b",
               
    label = "Population Size",
               
    min = nrow(data47()),
               
    value = (nrow(data47()) * 10)
  )
})

# Input 1st sample proportion --------------------------------------------------

output$select_prop1_47c <- renderUI({
  
  numericInput(
    
    inputId = "prop1_47c", 
    
    label = "1st Sample Proportion", 
    
    min = 0, 
    
    max = 1, 
    
    value = 0.5
  )
})

# Input 2nd sample proportion --------------------------------------------------

output$select_prop2_47c <- renderUI({
  
  numericInput(
    
    inputId = "prop2_47c", 
    
    label = "2nd Sample Proportion", 
    
    min = 0, 
    
    max = 1, 
    
    value = 0.5
  )
})

# Input sample size ------------------------------------------------------------

output$select_n_47c <- renderUI({
  
  numericInput(
    
    inputId = "n_47c", 
    
    label = "Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input population size --------------------------------------------------------

output$select_N_47c <- renderUI({
  
  req(input$n_47c)
  
  numericInput(
    
    inputId = "N_47c", 
    
    label = "Population Size", 
    
    min = input$n_47c, 
    
    max = Inf, 
    
    value = input$n_47c * 10
  )
})

# Multiplier -------------------------------------------------------------------

output$mult47 <- renderUI({
  
  numericInput(
    
    inputId = "mult47",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE -------------------------------------------------------------------------
output$checkrmoe47 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe47",
                
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

output$checkci47 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci47",
                
    label = "Interval",
                
    choices = c(
      
      Yes = "yes",
      
      No = "no"
    ),
    
    selected = "yes",
    
    inline = T
  )
})

# Preview data -------------------------------------------------------------

output$data_table47 <- DT::renderDataTable({
  
  req(input$type47)
  
  data <- data47()
  
  if(input$type47 == "user_values47") {
    
    data <- NULL
    
  } else {
    
    req(data47())
    
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

# Output table -----------------------------------------------------------------

output$output_table47 <- function(){
  
  req(input$digits47, data47(), input$mult47, input$type47)
  
  show_rmoe <- ifelse(input$checkrmoe47 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci47 == 'yes', TRUE, FALSE)
  
  # inputs for text data
  
  if (input$type47 == "text_data47") {
    
    req(
      
      input$yvar1_47a, 
      
      input$cat1_47a,
      
      input$popsize_47a,
      
      input$yvar2_47a, 
      
      input$cat2_47a
    )
    
    p1 <- mean(na.omit(data47()[[input$yvar1_47a]] == input$cat1_47a)) 
    
    p2 <- mean(na.omit(data47()[[input$yvar2_47a]] == input$cat2_47a)) 
    
    n <- length(na.omit(data47()[[input$yvar1_47a]]))
    
    N <- input$popsize_47a
  }
  
  # inputs for user data
  
  else if(input$type47 == "user_data47") {
    
    req(
      
      input$yvar1_47b, 
      
      input$cat1_47b,
      
      input$popsize_47b,
      
      input$yvar2_47b, 
      
      input$cat2_47b
    )
    
    p1 <- mean(na.omit(data47()[[input$yvar1_47b]] == input$cat1_47b)) 
    
    p2 <- mean(na.omit(data47()[[input$yvar2_47b]] == input$cat2_47b))
    
    n <- length(na.omit(data47()[[input$yvar1_47b]]))
    
    N <- input$popsize_47b
  }
  
  # inputs for user values
  
  else {
    
    req(
      
      input$prop1_47c,
      
      input$N_47c,
      
      input$prop2_47c, 
      
      input$n_47c
    )
    
    p1 <- input$prop1_47c
    
    p2 <- input$prop2_47c
    
    n <- input$n_47c
    
    N <- input$N_47c
  }
  
  # Difference estimate
  
  diff <- p1 - p2
  
  # variance of p1
  p1_var <- (1 - n / N) * (p1 * (1 - p1)) / n
  
  # sd of p1
  
  p1_sd <- sqrt(p1_var)
  
  # variance of p2 
  p2_var <- (1 - n / N) * (p2 * (1 - p2)) / n
  
  # sd of p2
  p2_sd <- sqrt(p2_var)
  
  # cov of p1 and p2
  cov <- 2 * (1 - n / N) * p1 * p2 / n
  
  # sd of difference
  diff_sd <- sqrt(p1_var + p2_var + cov)
  
  # margin of error p1
  p1_moe <- input$mult47 * p1_sd
  
  # margin of error p2
  p2_moe <- input$mult47 * p2_sd
  
  # margin of error difference
  diff_moe <- input$mult47 * diff_sd
  
  # lower bound p1
  p1_ci_lwr <- p1 - p1_moe
  
  # upper bound p1
  p1_ci_upr <- p1 + p1_moe
  
  # lower bound p2
  p2_ci_lwr <- p2 - p2_moe
  
  # upper bound p2
  p2_ci_upr <- p2 + p2_moe
  
  # lower bound diff
  diff_ci_lwr <- diff - diff_moe
  
  # upper bound diff
  diff_ci_upr <- diff + diff_moe

  # default output table
  out <- tibble::tibble(
    
    Parameter = c(
      
      "Population Proportion 1", 
      
      "Population Proportion 2",
      
      "Difference in Proportions"
    ), 
                        
    Estimate = c(p1, p2, diff), 
                        
    `Std. Error` = c(p1_sd, p2_sd, diff_sd),
                       
    MoE = c(p1_moe, p2_moe, diff_moe)
                        
  )
  
  # Add RMoE
  if(show_rmoe) {
    
    p1_rmoe <- (p1_moe / p1) * 100
    
    p2_rmoe <- (p2_moe / p2) * 100
    
    diff_rmoe <- (diff_moe / diff) * 100
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `RMoE (%)` = c(p1_rmoe, p2_rmoe, diff_rmoe)
    )
  }
    
  # Add interval
  if(show_ci) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `Lower Bound` = c(p1_ci_lwr, p2_ci_lwr, diff_ci_lwr),
                                 
      `Upper Bound` = c(p1_ci_upr, p2_ci_upr, diff_ci_upr)
    )
  }
  
  out2 <- out[2:ncol(out)] %>% 
    
    as.data.frame() %>%
    
    round(input$digits47) %>%
    
    format(nsmall = input$digits47, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app7
# ------------------------------------------------------------------------------

