# ------------------------------------------------------------------------------
# SERVER ch4app6
# ------------------------------------------------------------------------------

# Page title -------------------------------------------------------------------

output$title46 <- renderText({
  
  c("Comparing Two Independent Proportions from Simple Random Samples")
  
})

# Number of digits to display --------------------------------------------------
output$digits46 <- renderUI({
  
  sliderInput(
    
    inputId = "digits46",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
})

# Text data options ------------------------------------------------------------

dataset_choices46 <- eval(parse(file = "datasets/data_list.R"))

# Select text data -------------------------------------------------------------

datasetInput46a <- reactive({
  
  req(input$type46, input$dataset46)
  
  switch(
    
    input$dataset46,
         
    eval(parse(text = input$dataset46))
  )
}) 

# Select user data file --------------------------------------------------------

datasetInput46b <- reactive({
  
  req(input$type46, input$file46)
  
  read.csv(
    
    input$file46$datapath,
           
    header = ifelse(input$header46 == "yes", TRUE, FALSE),
           
    sep = input$sep46
  )
})

data46 <- reactive({
  
  req(datasetInput46a, datasetInput46b)
  
  if(input$type46 == "user_data46") {
    
    datasetInput46b()
  } 
  
  else {
    
    datasetInput46a()
  }
})

# Select the variable of interest  ---------------------------------------------

output$select_dataset46 <- renderUI({
  
  selectInput(
    
    inputId = "dataset46",
              
    label = h5("Choose a Dataset"),
              
    choices = dataset_choices46,
    
    selected = "SurveySampling::data5.1example"
  )
})

# Select .csv ------------------------------------------------------------------

output$select_csv46 <- renderUI({
  
  fileInput(
    
    inputId = "file46", 
    
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

output$select_y1_46a <- renderUI({
  
  req(data46())
  
  selectInput(
    
    inputId = "yvar1_46a",
              
    label = "Choose 1st Variable",
              
    choices = names(data46())
  )
})

# Select 1st category from text data -------------------------------------------

output$select_cat1_46a <- renderUI({
  
  req(data46(), input$yvar1_46a)
  
  selectInput(
    
    inputId = "cat1_46a",
    
    label = "Choose the Category of Interest",
    
    choices = data46()[[input$yvar1_46a]] %>% 
      as.character() %>% 
      as.factor() %>% 
      levels()
  )
})

# Select 2nd variable from text data -------------------------------------------

output$select_y2_46a <- renderUI({
  
  req(data46())
  
  selectInput(
    
    inputId = "yvar2_46a",
    
    label = "Choose 2nd Variable",
    
    choices = names(data46())
  )
})

# Select 2nd category from text data -------------------------------------------

output$select_cat2_46a <- renderUI({
  
  req(data46(), input$yvar2_46a)
  
  selectInput(
    
    inputId = "cat2_46a",
    
    label = "Choose the Category of Interest",
    
    choices = data46()[[input$yvar2_46a]] %>% 
      as.character() %>%
      as.factor() %>% 
      levels()
  )
})

# Select 1st variable from user data -------------------------------------------

output$select_y1_46b <- renderUI({
  
  req(data46())
  
  selectInput(
    
    inputId = "yvar1_46b",
              
    label = "Choose 1st Variable",
              
    choices = names(data46())
  )
})

# Select 1st category from user data -------------------------------------------

output$select_cat1_46b <- renderUI({
  
  req(data46(), input$yvar1_46b)
  
  selectInput(
    
    inputId = "cat1_46b",
    
    label = "Choose the Category of Interest",
    
    choices = data46()[[input$yvar1_46b]] %>% 
      as.character() %>%
      as.factor() %>% 
      levels()
  )
})

# Select 2nd variable from user data -------------------------------------------

output$select_y2_46b <- renderUI({
  
  req(data46())
  
  selectInput(
    
    inputId = "yvar2_46b",
    
    label = "Choose 2nd Variable",
    
    choices = names(data46())
  )
})

# Select 2nd category from user data -------------------------------------------

output$select_cat2_46b <- renderUI({
  
  req(data46(), input$yvar2_46b)
  
  selectInput(
    
    inputId = "cat2_46b",
    
    label = "Choose the Category of Interest",
    
    choices = data46()[[input$yvar2_46b]] %>% 
      as.character() %>%
      as.factor() %>% 
      levels()
  )
})

# Input 1st population size text data ------------------------------------------

output$select_N1_46a <- renderUI({
  
  req(data46())
  
  numericInput(
    
    inputId = "popsize1_46a",
               
    label = "1st Population Size",
               
    min = nrow(data46()),
               
    value = (nrow(data46()) * 10)
  )
})

# Input 2nd population size text data ------------------------------------------

output$select_N2_46a <- renderUI({
  
  req(data46())
  
  numericInput(
    
    inputId = "popsize2_46a",
    
    label = "2nd Population Size",
    
    min = nrow(data46()),
    
    value = (nrow(data46()) * 10)
  )
})

# Input 1st population size user data ------------------------------------------

output$select_N1_46b <- renderUI({
  
  req(data46())
  
  numericInput(
    
    inputId = "popsize1_46b",
               
    label = "1st Population Size",
               
    min = nrow(data46()),
               
    value = (nrow(data46()) * 10)
  )
})

# Input 2nd population size user data ------------------------------------------

output$select_N2_46b <- renderUI({
  
  req(data46())
  
  numericInput(
    
    inputId = "popsize2_46b",
    
    label = "2nd Population Size",
    
    min = nrow(data46()),
    
    value = (nrow(data46()) * 10)
  )
})

# Input 1st sample proportion --------------------------------------------------

output$select_prop1_46c <- renderUI({
  
  numericInput(
    
    inputId = "prop1_46c", 
    
    label = "1st Sample Proportion", 
    
    min = 0, 
    
    max = 1, 
    
    value = 0.5
  )
})

# Input 2nd sample proportion --------------------------------------------------

output$select_prop2_46c <- renderUI({
  
  numericInput(
    
    inputId = "prop2_46c", 
    
    label = "2nd Sample Proportion", 
    
    min = 0, 
    
    max = 1, 
    
    value = 0.5
  )
})

# Input 1st sample size --------------------------------------------------------

output$select_n1_46c <- renderUI({
  
  numericInput(
    
    inputId = "n1_46c", 
    
    label = "1st Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input 2nd sample size --------------------------------------------------------

output$select_n2_46c <- renderUI({
  
  numericInput(
    
    inputId = "n2_46c", 
    
    label = "2nd Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input 1st population size ----------------------------------------------------

output$select_N1_46c <- renderUI({
  
  req(input$n1_46c)
  
  numericInput(
    
    inputId = "N1_46c", 
    
    label = "1st Population Size", 
    
    min = input$n1_46c, 
    
    max = Inf, 
    
    value = input$n1_46c * 10
  )
})

# Input 2nd population size ----------------------------------------------------

output$select_N2_46c <- renderUI({
  
  req(input$n2_46c)
  
  numericInput(
    
    inputId = "N2_46c", 
    
    label = "2nd Population Size", 
    
    min = input$n2_46c, 
    
    max = Inf, 
    
    value = input$n2_46c * 10
  )
})

# Multiplier -------------------------------------------------------------------

output$mult46 <- renderUI({
  
  numericInput(
    
    inputId = "mult46",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE -------------------------------------------------------------------------
output$checkrmoe46 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe46",
                
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

output$checkci46 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci46",
                
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

output$data_table46 <- DT::renderDataTable({
  
  req(input$type46)
  
  data <- data46()
  
  if(input$type46 == "user_values46") {
    
    data <- NULL
    
  } else {
    
    req(data46())
    
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

output$output_table46 <- function(){
  
  req(input$digits46, data46(), input$mult46, input$type46)
  
  show_rmoe <- ifelse(input$checkrmoe46 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci46 == 'yes', TRUE, FALSE)
  
  # inputs for text data
  
  if (input$type46 == "text_data46") {
    
    req(
      
      input$yvar1_46a, 
      
      input$cat1_46a,
      
      input$popsize1_46a,
      
      input$yvar2_46a, 
      
      input$cat2_46a,
      
      input$popsize2_46a
    )
    
    p1 <- mean(na.omit(data46()[[input$yvar1_46a]] == input$cat1_46a)) 
    
    p2 <- mean(na.omit(data46()[[input$yvar2_46a]] == input$cat2_46a)) 
    
    n1 <- length(na.omit(data46()[[input$yvar1_46a]]))
    
    n2 <- length(na.omit(data46()[[input$yvar2_46a]]))
    
    N1 <- input$popsize1_46a
    
    N2 <- input$popsize2_46a
  }
  
  # inputs for user data
  
  else if(input$type46 == "user_data46") {
    
    req(
      
      input$yvar1_46b, 
      
      input$cat1_46b,
      
      input$popsize1_46b,
      
      input$yvar2_46b, 
      
      input$cat2_46b,
      
      input$popsize2_46b
    )
    
    p1 <- mean(na.omit(data46()[[input$yvar1_46b]] == input$cat1_46b)) 
    
    p2 <- mean(na.omit(data46()[[input$yvar2_46b]] == input$cat2_46b)) 
    
    n1 <- length(na.omit(data46()[[input$yvar1_46b]]))
    
    n2 <- length(na.omit(data46()[[input$yvar2_46b]]))
    
    N1 <- input$popsize1_46b
    
    N2 <- input$popsize2_46b
  }
  
  # inputs for user values
  
  else {
    
    req(
      
      input$prop1_46c, 
      
      input$n1_46c, 
      
      input$N1_46c,
      
      input$prop2_46c, 
      
      input$n2_46c, 
      
      input$N2_46c
    )
    
    p1 <- input$prop1_46c
    
    n1 <- input$n1_46c
    
    N1 <- input$N1_46c 
    
    p2 <- input$prop2_46c
    
    n2 <- input$n2_46c
    
    N2 <- input$N2_46c
  }
  
  # Difference estimate
  
  diff <- p1 - p2
  
  # variance of p1
  p1_var <- (1 - n1 / N1) * (p1 * (1 - p1)) / n1
  
  # sd of p1
  
  p1_sd <- sqrt(p1_var)
  
  # variance of p2 
  p2_var <- (1 - n2 / N2) * (p2 * (1 - p2)) / n2
  
  # sd of p2
  p2_sd <- sqrt(p2_var)
  
  # sd of difference
  diff_sd <- sqrt(p1_var + p2_var)
  
  # margin of error p1
  p1_moe <- input$mult46 * p1_sd
  
  # margin of error p2
  p2_moe <- input$mult46 * p2_sd
  
  # margin of error difference
  diff_moe <- input$mult46 * diff_sd
  
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
    
    round(input$digits46) %>%
    
    format(nsmall = input$digits46, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app6
# ------------------------------------------------------------------------------

