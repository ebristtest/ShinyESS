# ------------------------------------------------------------------------------
# SERVER ch4app5
# ------------------------------------------------------------------------------

# Page title -------------------------------------------------------------------

output$title45 <- renderText({
  
  c("Comparing Two Independent Means from Simple Random Samples")
  
})

# Number of digits to display --------------------------------------------------
output$digits45 <- renderUI({
  
  sliderInput(
    
    inputId = "digits45",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
  
})

# Text data options ------------------------------------------------------------

dataset_choices45 <- eval(parse(file = "datasets/data_list.R"))

# Select text data -------------------------------------------------------------

datasetInput45a <- reactive({
  
  req(input$type45, input$dataset45)
  
  switch(
    
    input$dataset45,
         
    eval(parse(text = input$dataset45))
  )
}) 

# Select user data file --------------------------------------------------------

datasetInput45b <- reactive({
  
  req(input$type45, input$file45)
  
  read.csv(
    
    input$file45$datapath,
           
    header = ifelse(input$header45 == "yes", TRUE, FALSE),
           
    sep = input$sep45
  )
})

data45 <- reactive({
  
  req(datasetInput45a, datasetInput45b)
  
  if(input$type45 == "user_data45") {
    
    datasetInput45b()
  } 
  
  else {
    
    datasetInput45a()
  }
})

# Select the variable of interest  ---------------------------------------------

output$select_dataset45 <- renderUI({
  
  selectInput(
    
    inputId = "dataset45",
              
    label = "Choose a Dataset",
              
    choices = dataset_choices45,
    
    selected = "ShinyESS::data5.1example"
  )
})

# Select .csv ------------------------------------------------------------------

output$select_csv45 <- renderUI({
  
  fileInput(
    
    inputId = "file45", 
    
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

output$select_y1_45a <- renderUI({
  
  selectInput(
    
    inputId = "yvar1_45a",
              
    label = "Choose 1st Variable",
              
    choices = names(data45())
  )
})

# Select 2nd variable from text data -------------------------------------------

output$select_y2_45a <- renderUI({
  
  selectInput(
    
    inputId = "yvar2_45a",
    
    label = "Choose 2nd Variable",
    
    choices = names(data45())
  )
})

# Select 1st variable from user data -------------------------------------------

output$select_y1_45b <- renderUI({
  
  selectInput(
    
    inputId = "yvar1_45b",
              
    label = "Choose 1st Variable",
              
    choices = names(data45())
  )
})

# Select 2nd variable from user data -------------------------------------------

output$select_y2_45b <- renderUI({
  
  selectInput(
    
    inputId = "yvar2_45b",
    
    label = "Choose 2nd Variable",
    
    choices = names(data45())
  )
})


# Input 1st population size text data ------------------------------------------

output$select_N1_45a <- renderUI({
  
  numericInput(
    
    inputId = "popsize1_45a",
               
    label = "1st Population Size",
               
    min = nrow(data45()),
               
    value = (nrow(data45()) * 10)
  )
})

# Input 2nd population size text data ------------------------------------------

output$select_N2_45a <- renderUI({
  
  numericInput(
    
    inputId = "popsize2_45a",
    
    label = "2nd Population Size",
    
    min = nrow(data45()),
    
    value = (nrow(data45()) * 10)
  )
})

# Input 1st population size user data ------------------------------------------

output$select_N1_45b <- renderUI({
  
  numericInput(
    
    inputId = "popsize1_45b",
               
    label = "1st Population Size",
               
    min = nrow(data45()),
               
    value = (nrow(data45()) * 10)
  )
})

# Input 2nd population size user data ------------------------------------------

output$select_N2_45b <- renderUI({
  
  numericInput(
    
    inputId = "popsize2_45b",
    
    label = "2nd Population Size",
    
    min = nrow(data45()),
    
    value = (nrow(data45()) * 10)
  )
})

# Input 1st sample mean --------------------------------------------------------

output$select_mean1_45c <- renderUI({
  
  numericInput(
    
    inputId = "ybar1_45c", 
    
    label = "1st Sample Mean", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input 2nd sample mean --------------------------------------------------------

output$select_mean2_45c <- renderUI({
  
  numericInput(
    
    inputId = "ybar2_45c", 
    
    label = "2nd Sample Mean", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input 1st sample variance ----------------------------------------------------

output$select_var1_45c <- renderUI({
  
  numericInput(
    
    inputId = "variance1_45c", 
    
    label = "1st Sample Variance", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input 2nd sample variance ----------------------------------------------------

output$select_var2_45c <- renderUI({
  
  numericInput(
    
    inputId = "variance2_45c", 
    
    label = "2nd Sample Variance", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input 1st sample size --------------------------------------------------------

output$select_n1_45c <- renderUI({
  
  numericInput(
    
    inputId = "n1_45c", 
    
    label = "1st Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input 2nd sample size --------------------------------------------------------

output$select_n2_45c <- renderUI({
  
  numericInput(
    
    inputId = "n2_45c", 
    
    label = "2nd Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# Input 1st population size ----------------------------------------------------

output$select_N1_45c <- renderUI({
  
  req(input$n1_45c)
  
  numericInput(
    
    inputId = "N1_45c", 
    
    label = "1st Population Size", 
    
    min = input$n1_45c, 
    
    max = Inf, 
    
    value = input$n1_45c * 10
  )
})

# Input 2nd population size ----------------------------------------------------

output$select_N2_45c <- renderUI({
  
  req(input$n2_45c)
  
  numericInput(
    
    inputId = "N2_45c", 
    
    label = "2nd Population Size", 
    
    min = input$n2_45c, 
    
    max = Inf, 
    
    value = input$n2_45c * 10
  )
})

# Multiplier -------------------------------------------------------------------

output$mult45 <- renderUI({
  
  numericInput(
    
    inputId = "mult45",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE -------------------------------------------------------------------------
output$checkrmoe45 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe45",
                
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

output$checkci45 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci45",
                
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

output$data_table45 <- DT::renderDataTable({
  
  req(input$type45)
  
  data <- data45()
  
  if(input$type45 == "user_values45") {
    
    data <- NULL
    
  } else {
    
    req(data45())
    
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

output$output_table45 <- function(){
  
  req(input$digits45, data45(), input$mult45, input$type45)
  
  show_rmoe <- ifelse(input$checkrmoe45 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci45 == 'yes', TRUE, FALSE)
  
  # inputs for text data
  
  if (input$type45 == "text_data45") {
    
    req(
      
      input$yvar1_45a, 
      
      input$popsize1_45a,
      
      input$yvar2_45a, 
      
      input$popsize2_45a
    )
    
    ybar1 <- mean(na.omit(data45()[[input$yvar1_45a]])) 
      
    ybar2 <- mean(na.omit(data45()[[input$yvar2_45a]]))
    
    s1 <- sd(na.omit(data45()[[input$yvar1_45a]]))
    
    s2 <- sd(na.omit(data45()[[input$yvar2_45a]]))
    
    n1 <- length(na.omit(data45()[[input$yvar1_45a]]))
    
    n2 <- length(na.omit(data45()[[input$yvar2_45a]]))
    
    N1 <- input$popsize1_45a
    
    N2 <- input$popsize2_45a
  }
  
  # inputs for user data
  
  else if(input$type45 == "user_data45") {
    
    req(
      
      input$yvar1_45b, 
      
      input$popsize1_45b,
      
      input$yvar2_45b, 
      
      input$popsize2_45b
    )
    
    ybar1 <- mean(na.omit(data45()[[input$yvar1_45b]])) 
    
    ybar2 <- mean(na.omit(data45()[[input$yvar2_45b]]))
    
    s1 <- sd(na.omit(data45()[[input$yvar1_45b]]))
    
    s2 <- sd(na.omit(data45()[[input$yvar2_45b]]))
    
    n1 <- length(na.omit(data45()[[input$yvar1_45b]]))
    
    n2 <- length(na.omit(data45()[[input$yvar2_45b]]))
    
    N1 <- input$popsize1_45b
    
    N2 <- input$popsize2_45b
  }
  
  # inputs for user values
  
  else {
    
    req(
      
      input$ybar1_45c, 
      
      input$variance1_45c, 
      
      input$n1_45c, 
      
      input$N1_45c,
      
      input$ybar2_45c, 
      
      input$variance2_45c, 
      
      input$n2_45c, 
      
      input$N2_45c
    )
    
    ybar1 <- input$ybar1_45c
    
    s1 <- sqrt(input$variance1_45c)
    
    n1 <- input$n1_45c
    
    N1 <- input$N1_45c 
    
    ybar2 <- input$ybar2_45c
    
    s2 <- sqrt(input$variance2_45c)
    
    n2 <- input$n2_45c
    
    N2 <- input$N2_45c 
  }
  
  # Difference estimate
  
  diff <- ybar1 - ybar2
  
  # variance of ybar1
  ybar1_var <- (1 - n1 / N1) * s1^2 / n1
  
  # sd of ybar1
  
  ybar1_sd <- sqrt(ybar1_var)
  
  # variance of ybar2 
  ybar2_var <- (1 - n2 / N2) * s2^2 / n2
  
  # sd of ybar 2
  ybar2_sd <- sqrt(ybar2_var)
  
  # sd of difference
  diff_sd <- sqrt(ybar1_var + ybar2_var)
  
  # margin of error ybar1
  ybar1_moe <- input$mult45 * ybar1_sd
  
  # margin of error ybar2
  ybar2_moe <- input$mult45 * ybar2_sd
  
  # margin of error difference
  diff_moe <- input$mult45 * diff_sd
  
  # lower bound ybar1
  ybar1_ci_lwr <- ybar1 - ybar1_moe
  
  # upper bound ybar1
  ybar1_ci_upr <- ybar1 + ybar1_moe
  
  # lower bound ybar2
  ybar2_ci_lwr <- ybar2 - ybar2_moe
  
  # upper bound ybar2
  ybar2_ci_upr <- ybar2 + ybar2_moe
  
  # lower bound diff
  diff_ci_lwr <- diff - diff_moe
  
  # upper bound diff
  diff_ci_upr <- diff + diff_moe

  # default output table
  out <- tibble::tibble(
    
    Parameter = c(
      
      "Population Mean 1", 
      
      "Population Mean 2",
      
      "Difference in Means"
    ), 
                        
    Estimate = c(ybar1, ybar2, diff), 
                        
    `Std. Error` = c(ybar1_sd, ybar2_sd, diff_sd),
                       
    MoE = c(ybar1_moe, ybar2_moe, diff_moe)
                        
  )
  
  # Add RMoE
  if(show_rmoe) {
    
    ybar1_rmoe <- (ybar1_moe / ybar1) * 100
    
    ybar2_rmoe <- (ybar2_moe / ybar2) * 100
    
    diff_rmoe <- (diff_moe / diff) * 100
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `RMoE (%)` = c(ybar1_rmoe, ybar2_rmoe, diff_rmoe)
    )
  }
    
  # Add interval
  if(show_ci) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `Lower Bound` = c(ybar1_ci_lwr, ybar2_ci_lwr, diff_ci_lwr),
                                 
      `Upper Bound` = c(ybar1_ci_upr, ybar2_ci_upr, diff_ci_upr)
    )
  }
  
  out2 <- out[2:ncol(out)] %>% 
    
    as.data.frame() %>%
    
    round(input$digits45) %>%
    
    format(nsmall = input$digits45, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "250px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app5
# ------------------------------------------------------------------------------

