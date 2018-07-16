# ------------------------------------------------------------------------------
# SERVER ch4app1
# ------------------------------------------------------------------------------

# Page title -------------------------------------------------------------------

output$title41 <- renderText({
  
  c("Estimation of a Population Mean or Total Using a Simple Random", 
    "Sample Design")
  
})

# Number of digits to display --------------------------------------------------
output$digits41 <- renderUI({
  
  sliderInput(
    
    inputId = "digits41",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
})

# Text data options ------------------------------------------------------------

dataset_choices41 <- eval(parse(file = "datasets/data_list.R"))

# Select text data -------------------------------------------------------------

datasetInput41a <- reactive({
  
  req(input$type41, input$dataset41)
  
  switch(
    
    input$dataset41,
         
    eval(parse(text = input$dataset41))
  )
}) 

# Select user data file --------------------------------------------------------

datasetInput41b <- reactive({
  
  req(input$type41, input$file41)
  
  read.csv(
    
    input$file41$datapath,
           
    header = ifelse(input$header41 == "yes", TRUE, FALSE),
           
    sep = input$sep41
  )
})

data41 <- reactive({
  
  req(datasetInput41a, datasetInput41b)
  
  if(input$type41 == "user_data41") {
    
    datasetInput41b()
  } 
  
  else {
    
    datasetInput41a()
  }
})

# Select the variable of interest  ---------------------------------------------

output$select_dataset41 <- renderUI({
  
  selectInput(
    
    inputId = "dataset41",
              
    label = "Choose a Dataset",
              
    choices = dataset_choices41,
    
    selected = "SurveySampling::data5.1example"
  )
})

# Select .csv ------------------------------------------------------------------

output$select_csv41 <- renderUI({
  
  fileInput(
    
    inputId = "file41", 
    
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

# Select variable from text data -----------------------------------------------

output$select_y41a <- renderUI({
  
  selectInput(
    
    inputId = "yvar41a",
              
    label = "Choose a Variable",
              
    choices = names(data41())
  )
})

# Select variable from user data -----------------------------------------------

output$select_y41b <- renderUI({
  
  selectInput(
    
    inputId = "yvar41b",
              
    label = "Choose a Variable",
              
    choices = names(data41())
  )
})



# Input population size text data ----------------------------------------------

output$select_N41a <- renderUI({
  
  numericInput(
    
    inputId = "popsize41a",
               
    label = "Population Size",
               
    min = nrow(data41()),
               
    value = NULL
  )
})

# Input population size user data ----------------------------------------------

output$select_N41b <- renderUI({
  
  numericInput(
    
    inputId = "popsize41b",
               
    label = "Population Size",
               
    min = nrow(data41()),
               
    value = NULL
  )
})

# Input sample mean ------------------------------------------------------------

output$select_mean41c <- renderUI({
  
  numericInput(
    
    inputId = "ybar41c", 
    
    label = "Sample Mean", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input sample variance --------------------------------------------------------

output$select_var41c <- renderUI({
  
  numericInput(
    
    inputId = "variance41c", 
    
    label = "Sample Variance", 
    
    min = 0, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input sample size ------------------------------------------------------------

output$select_n41c <- renderUI({
  
  numericInput(
    
    inputId = "n41c", 
    
    label = "Sample Size", 
    
    min = 2, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Input population size --------------------------------------------------------

output$select_N41c <- renderUI({
  
  numericInput(
    
    inputId = "N41c", 
    
    label = "Population Size", 
    
    min = input$n41c, 
    
    max = Inf, 
    
    value = NULL
  )
})

# Multiplier -------------------------------------------------------------------

output$mult41 <- renderUI({
  
  numericInput(
    
    inputId = "mult41",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE -------------------------------------------------------------------------
output$checkrmoe41 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe41",
    
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

output$checkci41 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci41",
    
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

output$data_table41 <- DT::renderDataTable({
  
  req(input$type41)
  
  data <- data41()
  
  if(input$type41 == "user_values41") {
    
    data <- NULL
    
  } else {
    
    req(data41())
    
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

output$output_table41 <- function(){
   
  req(input$digits41, data41(), input$mult41, input$type41)
  
  show_rmoe <- ifelse(input$checkrmoe41 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci41 == 'yes', TRUE, FALSE)
  
  # inputs for text data
  
  if (input$type41 == "text_data41") {
    
    req(input$yvar41a, input$popsize41a)
    
    mu_hat <- mean(na.omit(data41()[[input$yvar41a]]))
    
    s <- sd(na.omit(data41()[[input$yvar41a]]))
    
    n <- length(na.omit(data41()[[input$yvar41a]]))
    
    N <- input$popsize41a
  }
    
  # inputs for user data
  
  else if(input$type41 == "user_data41") {
    
    req(input$yvar41b, input$popsize41b)
    
    mu_hat <- mean(na.omit(data41()[[input$yvar41b]]))
    
    s <- sd(na.omit(data41()[[input$yvar41b]]))
    
    n <- length(na.omit(data41()[[input$yvar41b]]))
    
    N <- input$popsize41b
  }
  
  # inputs for user values
  
  else {
    
    req(input$ybar41c, input$variance41c, input$n41c, input$N41c)
    
    mu_hat <- input$ybar41c
    
    s <- sqrt(input$variance41c)
    
    n <- input$n41c
    
    N <- input$N41c 
  }
  
  # standard error
  sd_mean <- sqrt((1 - n / N) * s^2 / n)
  
  # margin of error
  moe_mean <- input$mult41 * sd_mean
  
  # lower bound
  ci_lwr_mean <- mu_hat - moe_mean
  
  # upper bound
  ci_upr_mean <- mu_hat + moe_mean
  
  # estimated total
  total <- mu_hat * N
  
  # standard error of total
  sd_total <- sqrt(N^2 * (1 - n / N) * s^2 / n)
  
  # margin of error of total
  moe_total <- input$mult41 * sd_total
  
  # lower bound total
  ci_lwr_total <- total - moe_total
  
  # upper bound total
  ci_upr_total <- total + moe_total

  # default output table
  out <- tibble::tibble(
    
    Parameter = c("Population Mean", "Population Total"), 
                        
    Estimate = c(mu_hat, total), 
                        
    `Std. Error` = c(sd_mean, sd_total),
                       
    MoE = c(moe_mean, moe_total)
                        
  )
  
  # Add RMoE
  if(show_rmoe) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `RMoE (%)` = c((moe_mean / mu_hat) * 100, (moe_total / total) * 100))
  }
    
  # Add interval
  if(show_ci) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `Lower Bound` = c(ci_lwr_mean, ci_lwr_total),
                                 
      `Upper Bound` = c(ci_upr_mean, ci_upr_total)
    )
  }
  
  out2 <- out[2:ncol(out)] %>% 
    
    as.data.frame() %>%
    
    round(input$digits41) %>%
    
    format(nsmall = input$digits41, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "200px", bold = T)
}

# ------------------------------------------------------------------------------
# END SERVER ch4app1
# ------------------------------------------------------------------------------

