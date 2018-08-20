
# --------------------------------------------------------------------------------------------------
# SERVER ch5app1
# --------------------------------------------------------------------------------------------------

# Page title ---------------------------------------------------------------------------------------

output$title51 <- renderText({
  
  c("Estimation of a Population Mean or Total Using a Stratified Random", 
    "Sample Design")
  
})

# --------------------------------------------------------------------------------------------------
# SERVER ch5app1 text data
# --------------------------------------------------------------------------------------------------

# Text data options --------------------------------------------------------------------------------

dataset_choices <- eval(parse(file = "datasets/data_list.R"))

# Select text data ---------------------------------------------------------------------------------

datasetInput51a <- reactive({
  
  req(input$type51, input$dataset51)
  
  switch(
    
    input$dataset51,
    
    eval(parse(text = input$dataset51))
  )
}) 

# Select the dataset of interest  ------------------------------------------------------------------

output$select_dataset51 <- renderUI({
  
  selectInput(
    
    inputId = "dataset51",
    
    label = "Choose a Dataset",
    
    choices = dataset_choices,
    
    selected = "ShinyESS::data5.1example"
  )
})

output$num_strata_a51 <- renderUI({
  
  req(levels_a51()) 
  
  numericInput(
    
    inputId = "num_strata_a51",
    
    label = "Number of Strata",
    
    min = length(levels_a51()),
    
    max = length(levels_a51()),
    
    value = length(levels_a51())
  )
})

# Strata names -------------------------------------------------------------------------------------

levels_a51 <- reactive({
  
  req(data51(), input$strat51a)
  
  if(input$strat51a == "Column Headers") {
    
    names(data51())
  }
  
  else{
    
    data51()[[input$strat51a]] %>% as.factor() %>% levels()
  }
})

# Select variable from text data -------------------------------------------------------------------

output$select_y51a <- renderUI({
  
  req(input$strat51a, data51())
  
  if(input$strat51a == "Column Headers") {
    
    y_opts <- "Row Values" 
  
  } else{
    
    y_opts <- c(names(data51())[names(data51()) != input$strat51a])
  }
  
  selectInput(
    
    inputId = "yvar51a",
    
    label = "Measured Variable",
    
    choices = c(y_opts)
  )
})

# Input stratum id from text data ------------------------------------------------------------------

output$select_strat51a <- renderUI({
  
  req(data51())
  
  selectInput(
    
    inputId = "strat51a",
    
    label = "Stratum Ids",
    
    choices = c("Column Headers", names(data51()))
  )
})

# Input stratum sizes text data --------------------------------------------------------------------

# Stratum 1

output$select_size1_51a <- renderUI({
  
  numericInput(
    
    inputId = "size1_51a",
    
    label = paste("Size of Stratum", levels_a51()[1]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 2

output$select_size2_51a <- renderUI({
  
  numericInput(
    
    inputId = "size2_51a",
    
    label = paste("Size of Stratum", levels_a51()[2]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 3

output$select_size3_51a <- renderUI({
  
  numericInput(
    
    inputId = "size3_51a",
    
    label = paste("Size of Stratum", levels_a51()[3]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 4

output$select_size4_51a <- renderUI({
  
  numericInput(
    
    inputId = "size4_51a",
    
    label = paste("Size of Stratum", levels_a51()[4]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 5

output$select_size5_51a <- renderUI({
  
  numericInput(
    
    inputId = "size5_51a",
    
    label = paste("Size of Stratum", levels_a51()[5]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 6

output$select_size6_51a <- renderUI({
  
  numericInput(
    
    inputId = "size6_51a",
    
    label = paste("Size of Stratum", levels_a51()[6]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 7

output$select_size7_51a <- renderUI({
  
  numericInput(
    
    inputId = "size7_51a",
    
    label = paste("Size of Stratum", levels_a51()[7]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 8

output$select_size8_51a <- renderUI({
  
  numericInput(
    
    inputId = "size8_51a",
    
    label = paste("Size of Stratum", levels_a51()[8]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 9

output$select_size9_51a <- renderUI({
  
  numericInput(
    
    inputId = "size9_51a",
    
    label = paste("Size of Stratum", levels_a51()[9]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# --------------------------------------------------------------------------------------------------
# END SERVER ch5app1 text data
# --------------------------------------------------------------------------------------------------



# --------------------------------------------------------------------------------------------------
# SERVER ch5app1 user data
# --------------------------------------------------------------------------------------------------

# Select user data file ----------------------------------------------------------------------------

datasetInput51b <- reactive({
  
  req(input$type51, input$file51)
  
  read.csv(
    
    input$file51$datapath,
    
    header = ifelse(input$header51 == "yes", TRUE, FALSE),
    
    sep = input$sep51
  )
})

# Select .csv --------------------------------------------------------------------------------------

output$select_csv51 <- renderUI({
  
  fileInput(
    
    inputId = "file51", 
    
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

output$num_strata_b51 <- renderUI({
  
  req(levels_b51())  
  
  numericInput(
    
    inputId = "num_strata_b51",
    
    label = "Number of Strata",
    
    min = length(levels_b51()),
    
    max = length(levels_b51()),
    
    value = length(levels_b51())
  )
})

# Strata names -------------------------------------------------------------------------------------

levels_b51 <- reactive({
  
  req(data51(), input$strat51b)
  
  if(input$strat51b == "Column Headers") {
    
    names(data51())
  }
  
  else{
    
    data51()[[input$strat51b]] %>% as.factor() %>% levels()
  }
})

# Select variable from text data -------------------------------------------------------------------

output$select_y51b <- renderUI({
  
  req(input$strat51b, data51())
  
  if(input$strat51b == "Column Headers") {
    
    y_opts <- "Row Values" 
    
  } else{
    
    y_opts <- c(names(data51())[names(data51()) != input$strat51b])
  }
  
  selectInput(
    
    inputId = "yvar51b",
    
    label = "Measured Variable",
    
    choices = c(y_opts)
  )
})

# Input stratum id from text data ------------------------------------------------------------------

output$select_strat51b <- renderUI({
  
  req(data51())
  
  selectInput(
    
    inputId = "strat51b",
    
    label = "Stratum Ids",
    
    choices = c("Column Headers", names(data51()))
  )
})

# Input stratum sizes text data --------------------------------------------------------------------

# Stratum 1

output$select_size1_51b <- renderUI({
  
  numericInput(
    
    inputId = "size1_51b",
    
    label = paste("Size of Stratum", levels_b51()[1]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 2

output$select_size2_51b <- renderUI({
  
  numericInput(
    
    inputId = "size2_51b",
    
    label = paste("Size of Stratum", levels_b51()[2]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 3

output$select_size3_51b <- renderUI({
  
  numericInput(
    
    inputId = "size3_51b",
    
    label = paste("Size of Stratum", levels_b51()[3]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 4

output$select_size4_51b <- renderUI({
  
  numericInput(
    
    inputId = "size4_51b",
    
    label = paste("Size of Stratum", levels_b51()[4]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 5

output$select_size5_51b <- renderUI({
  
  numericInput(
    
    inputId = "size5_51b",
    
    label = paste("Size of Stratum", levels_b51()[5]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 6

output$select_size6_51b <- renderUI({
  
  numericInput(
    
    inputId = "size6_51b",
    
    label = paste("Size of Stratum", levels_b51()[6]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 7

output$select_size7_51b <- renderUI({
  
  numericInput(
    
    inputId = "size7_51b",
    
    label = paste("Size of Stratum", levels_b51()[7]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 8

output$select_size8_51b <- renderUI({
  
  numericInput(
    
    inputId = "size8_51b",
    
    label = paste("Size of Stratum", levels_b51()[8]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
})

# Stratum 9

output$select_size9_51b <- renderUI({ 
  
  numericInput( 
    
    inputId = "size9_51b",
    
    label = paste("Size of Stratum", levels_a51()[9]),
    
    min = 3,
    
    max = Inf,
    
    value = NULL
  )
}) 

# --------------------------------------------------------------------------------------------------
# END SERVER ch5app1 user data
# --------------------------------------------------------------------------------------------------




# --------------------------------------------------------------------------------------------------
# SERVER ch5app1 uservals
# --------------------------------------------------------------------------------------------------

output$select_num_strat_51c <- renderUI({
  
  sliderInput(
    
    inputId = "num_strat_51c",
    
    label = "Number of Strata",
    
    min = 2,
    
    max = 6,
    
    value = 2,
    
    ticks = F
  )
})

output$var_or_sd_51c <- renderUI({
  
  radioButtons(
    
    inputId = "var_or_sd_51c",
    
    label = "Variance or Standard Deviation",
    
    choices = c(
      
      "Variance" = 'var51',
      
      "Standard Deviation" = 'sd51'
    ),
    
    selected = "sd51",
    
    inline = T
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 1
# --------------------------------------------------------------------------------------------------

# Input sample mean 1 ------------------------------------------------------------------------------

output$select_ybar1_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar1_51c", 
    
    label = "Sample Mean 1", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 1 --------------------------------------------------------------------------

output$select_var1_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance1_51c", 
    
    label = "Sample Variance 1", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 1 --------------------------------------------------------------------------------

output$select_sd1_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd1_51c", 
    
    label = "Sample SD 1", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 1 ------------------------------------------------------------------------------

output$select_n1_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n1_51c", 
    
    label = "Sample Size 1", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 1 --------------------------------------------------------------------------

output$select_N1_51c <- renderUI({

  req(input$n1_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N1_51c",
    
    label = "Population Size 1",
    
    min = input$n1_51c + 1,
    
    max = Inf,
    
    value = input$n1_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 2
# --------------------------------------------------------------------------------------------------

# Input sample mean 2 ------------------------------------------------------------------------------

output$select_ybar2_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar2_51c", 
    
    label = "Sample Mean 2", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 2 --------------------------------------------------------------------------

output$select_var2_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance2_51c", 
    
    label = "Sample Variance 2", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 2 --------------------------------------------------------------------------------

output$select_sd2_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd2_51c", 
    
    label = "Sample SD 2", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 2 ------------------------------------------------------------------------------

output$select_n2_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n2_51c", 
    
    label = "Sample Size 2", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 2 --------------------------------------------------------------------------

output$select_N2_51c <- renderUI({
  
  req(input$n2_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N2_51c",
    
    label = "Population Size 2",
    
    min = input$n2_51c + 1,
    
    max = Inf,
    
    value = input$n2_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 3
# --------------------------------------------------------------------------------------------------

# Input sample mean 3 ------------------------------------------------------------------------------

output$select_ybar3_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar3_51c", 
    
    label = "Sample Mean 3", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 3 --------------------------------------------------------------------------

output$select_var3_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance3_51c", 
    
    label = "Sample Variance 3", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 3 --------------------------------------------------------------------------------

output$select_sd3_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd3_51c", 
    
    label = "Sample SD 3", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 3 ------------------------------------------------------------------------------

output$select_n3_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n3_51c", 
    
    label = "Sample Size 3", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 3 --------------------------------------------------------------------------

output$select_N3_51c <- renderUI({
  
  req(input$n3_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N3_51c",
    
    label = "Population Size 3",
    
    min = input$n3_51c + 1,
    
    max = Inf,
    
    value = input$n3_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 4
# --------------------------------------------------------------------------------------------------

# Input sample mean 4 ------------------------------------------------------------------------------

output$select_ybar4_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar4_51c", 
    
    label = "Sample Mean 4", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 4 --------------------------------------------------------------------------

output$select_var4_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance4_51c", 
    
    label = "Sample Variance 4", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 4 --------------------------------------------------------------------------------

output$select_sd4_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd4_51c", 
    
    label = "Sample SD 4", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 4 ------------------------------------------------------------------------------

output$select_n4_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n4_51c", 
    
    label = "Sample Size 4", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 4 --------------------------------------------------------------------------

output$select_N4_51c <- renderUI({
  
  req(input$n4_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N4_51c",
    
    label = "Population Size 4",
    
    min = input$n4_51c + 1,
    
    max = Inf,
    
    value = input$n4_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 5
# --------------------------------------------------------------------------------------------------

# Input sample mean 5 ------------------------------------------------------------------------------

output$select_ybar5_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar5_51c", 
    
    label = "Sample Mean 5", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 5 --------------------------------------------------------------------------

output$select_var5_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance5_51c", 
    
    label = "Sample Variance 5", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 5 --------------------------------------------------------------------------------

output$select_sd5_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd5_51c", 
    
    label = "Sample SD 5", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 5 ------------------------------------------------------------------------------

output$select_n5_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n5_51c", 
    
    label = "Sample Size 5", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 5 --------------------------------------------------------------------------

output$select_N5_51c <- renderUI({
  
  req(input$n5_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N5_51c",
    
    label = "Population Size 5",
    
    min = input$n5_51c + 1,
    
    max = Inf,
    
    value = input$n5_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 6
# --------------------------------------------------------------------------------------------------

# Input sample mean 6 ------------------------------------------------------------------------------

output$select_ybar6_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "ybar6_51c", 
    
    label = "Sample Mean 6", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 6 --------------------------------------------------------------------------

output$select_var6_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "variance6_51c", 
    
    label = "Sample Variance 6", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 6 --------------------------------------------------------------------------------

output$select_sd6_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "sd6_51c", 
    
    label = "Sample SD 6", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 6 ------------------------------------------------------------------------------

output$select_n6_51c <- renderUI({
  
  req(input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "n6_51c", 
    
    label = "Sample Size 6", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 6 --------------------------------------------------------------------------

output$select_N6_51c <- renderUI({
  
  req(input$n6_51c, input$num_strat_51c, input$var_or_sd_51c)
  
  numericInput(
    
    inputId = "N6_51c",
    
    label = "Population Size 6", 
    
    min = input$n6_51c + 1,
    
    max = Inf,
    
    value = input$n6_51c + 1
  )
})

# --------------------------------------------------------------------------------------------------
# End SERVER ch5app1 uservals
# --------------------------------------------------------------------------------------------------


# Number of digits to display ----------------------------------------------------------------------
output$digits51 <- renderUI({
  
  sliderInput(
    
    inputId = "digits51",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
})

# Switch between text and user data ----------------------------------------------------------------

data51 <- reactive({
  
  req(datasetInput51a, datasetInput51b)
  
  if(input$type51 == "user_data51") {
    
    datasetInput51b()
  } 
  
  else {
    
    datasetInput51a()
  }
})

# Multiplier ---------------------------------------------------------------------------------------

output$mult51 <- renderUI({
  
  numericInput(
    
    inputId = "mult51",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE ---------------------------------------------------------------------------------------------

output$checkrmoe51 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe51",
    
    label = "RMoE",
    
    choices = c(
      
      "Yes" = "yes",
      
      "No" = "no"
    ),
    
    selected = "no",
    
    inline = T
  )
})

# Interval -----------------------------------------------------------------------------------------

output$checkci51 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci51",
    
    label = "Interval",
    
    choices = c(
      
      "Yes" = "yes",
      
      "No" = "no"
    ),
    
    selected = "yes",
    
    inline = T
  )
})


output$output_type51 <- renderUI({
  
  radioButtons(
    
    inputId = "output_type51",
    
    label = "Parameter Estimates",
    
    choices = c(
      
      "Population Mean and Total" = "p_mt51",
      
      "Individual Stratum Means" = "s_m51",
      
      "Individual Stratum Totals" = "s_t51",
      
      "Sample Summary" = "ss51"
    ),
    
    selected = "p_mt51"
  )
})

# Preview data -------------------------------------------------------------------------------------

output$data_table51 <- DT::renderDataTable({
  
  req(data51())
  
  DT::datatable(
    
    data51(),
    
    options = list(lengthMenu = c(5, 30, 50), pageLength = 5),
    
    rownames = F, 
    
    style = 'bootstrap') %>% 
    
    DT::formatStyle(
      
      columns = 1:ncol(data51()), 
      
      fontSize = '12pt'
    )
})

# --------------------------------------------------------------------------------------------------

# Output table -------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------

output$output_table51 <- function(){
  
  req(input$digits51, input$mult51, input$type51)
  
  show_rmoe <- ifelse(input$checkrmoe51 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci51 == 'yes', TRUE, FALSE)
  
  # inputs from text data --------------------------------------------------------------------------
  
  if (input$type51 == "text_data51") {
    
    req(data51(), input$strat51a, input$yvar51a, input$num_strata_a51)
    
    data_out <- data51()
    
    if(input$strat51a == "Column Headers" | input$yvar51a == "Row Values") {
      
      data_out <- data_out %>% 
        
        tidyr::gather(key = "g.5_1", value = "y.5_1", na.rm = T)
    }
    
    else{
      
      data_out$y.5_1 <- data51()[[input$yvar51a]]
      
      data_out$g.5_1 <- data51()[[input$strat51a]]
    
    }
    
    data_out <- tidyr::drop_na(data_out)
    
    group_info <- data_out %>% 
      
      group_by(g.5_1) %>%
      
      summarize(
        
        group_mean = mean(y.5_1),
        
        group_sd = sd(y.5_1), 
        
        group_size = n()
      ) 
    
    k <- input$num_strata_a51
    
    req(levels_a51())
    
    if(k != length(levels_a51())) {
      
      stop(paste("Incorrect number of stratum sizes.", "The stratum Id  < ",
                 input$strat51a, " >  has", length(levels_a51()), 
                 "unique stratum, and", k, "stratum sizes",
                 "are given."))
    }
    
    group_pop_vec <- numeric()
    
    if(k >= 1) {
      
      req(input$size1_51a)
      
      group_pop_vec[1] <- input$size1_51a
    }
    
    if(k >= 2) {
      
      req(input$size2_51a)
      
      group_pop_vec[2] <- input$size2_51a
    }
    
    if(k >= 3) {
      
      req(input$size3_51a)
      
      group_pop_vec[3] <- input$size3_51a
    }
    
    if(k >= 4) {
      
      req(input$size4_51a)
      
      group_pop_vec[4] <- input$size4_51a
    }
    
    if(k >= 5) {
      
      req(input$size5_51a)
      
      group_pop_vec[5] <- input$size5_51a
    }
    
    if(k >= 6) {
      
      req(input$size6_51a)
      
      group_pop_vec[6] <- input$size6_51a
    }
    
    if(k >= 7) {
      
      req(input$size7_51a)
      
      group_pop_vec[7] <- input$size7_51a
    }
    
    if(k >= 8) {
      
      req(input$size8_51a)
      
      group_pop_vec[8] <- input$size8_51a
    }
    
    if(k >= 9) {
      
      req(input$size9_51a)
      
      group_pop_vec[9] <- input$size9_51a
    }
    
    group_labels <- group_info$g.5_1
    
    group_pop <- data.frame(N.5_1 = group_pop_vec, g.5_1 = levels_a51())
    
    group_info <- merge(group_info, group_pop, by = "g.5_1")
    
    group_mean <- group_info$group_mean
    
    group_sd <- group_info$group_sd
    
    group_size <- group_info$group_size
    
    group_pop <- group_info$N.5_1
    
    pop_all <- sum(group_pop)
    
  }
  
  # inputs for user data ---------------------------------------------------------------------------
  
  else if(input$type51 == "user_data51") {
    
    req(data51(), input$strat51b, input$yvar51b, input$num_strata_b51)
    
    data_out <- data51()
    
    if(input$strat51b == "Column Headers" | input$yvar51b == "Row Values") {
      
      data_out <- data_out %>% 
        
        tidyr::gather(key = "g.5_1", value = "y.5_1", na.rm = T)
    }
    
    else{
      
      data_out$y.5_1 <- data51()[[input$yvar51b]]
      
      data_out$g.5_1 <- data51()[[input$strat51b]]
    }
    
    group_info <- data_out %>% 
      
      group_by(g.5_1) %>%
      
      summarize(
        
        group_mean = mean(y.5_1),
        
        group_sd = sd(y.5_1), 
        
        group_size = n()
      ) 
    
    k <- input$num_strata_b51
    
    req(levels_b51())
    
    if(k != length(levels_b51())) {
      
      stop(paste("Incorrect number of stratum sizes.", "The stratum Id  < ",
                 input$strat51b, " >  has", length(levels_b51()), 
                 "unique stratum, and", k, "stratum sizes",
                 "are given."))
    }
    
    group_pop_vec <- numeric()
    
    if(k >= 1) {
      
      req(input$size1_51b)
      
      group_pop_vec[1] <- input$size1_51b
    }
    
    if(k >= 2) {
      
      req(input$size2_51b)
      
      group_pop_vec[2] <- input$size2_51b
    }
    
    if(k >= 3) {
      
      req(input$size3_51b)
      
      group_pop_vec[3] <- input$size3_51b
    }
    
    if(k >= 4) {
      
      req(input$size4_51b)
      
      group_pop_vec[4] <- input$size4_51b
    }
    
    if(k >= 5) {
      
      req(input$size5_51b)
      
      group_pop_vec[5] <- input$size5_51b
    }
    
    if(k >= 6) {
      
      req(input$size6_51b)
      
      group_pop_vec[6] <- input$size6_51b
    }
    
    if(k >= 7) {
      
      req(input$size7_51b)
      
      group_pop_vec[7] <- input$size7_51b
    }
    
    if(k >= 8) {
      
      req(input$size8_51b)
      
      group_pop_vec[8] <- input$size8_51b
    }
    
    if(k >= 9) {
      
      req(input$size9_51b)
      
      group_pop_vec[9] <- input$size9_51b
    }
    
    group_pop <- data.frame(N.5_1 = group_pop_vec, g.5_1 = levels_b51())
    
    group_info <- merge(group_info, group_pop, by = "g.5_1")
    
    group_labels <- group_info$g.5_1
    
    group_mean <- group_info$group_mean
    
    group_sd <- group_info$group_sd
    
    group_size <- group_info$group_size
    
    group_pop <- group_info$N.5_1
    
    pop_all <- sum(group_pop)
  }

  # inputs for user values -------------------------------------------------------------------------
  
  else {
    
    req(input$var_or_sd_51c)
    
    k <- input$num_strat_51c
    
    if(k >= 1) {
      
      req(
        
        input$ybar1_51c,
        input$n1_51c,
        input$N1_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd1_51c)
      } else {
        
        req(input$variance1_51c)
      }
    }
    
    if(k >= 2) {
      
      req(
        
        input$ybar2_51c,
        input$n2_51c,
        input$N2_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd2_51c)
      } else {
        
        req(input$variance2_51c)
      }
    }
    
    if(k >= 3) {
      
      req(
        
        input$ybar3_51c,
        input$n3_51c,
        input$N3_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd3_51c)
      } else {
        
        req(input$variance3_51c)
      }
    }
    
    if(k >= 4) {
      
      req(
        
        input$ybar4_51c,
        input$n4_51c,
        input$N4_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd4_51c)
      } else {
        
        req(input$variance4_51c)
      }
    }
    
    if(k >= 5) {
      
      req(
        
        input$ybar5_51c,
        input$n5_51c,
        input$N5_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd5_51c)
      } else {
        
        req(input$variance5_51c)
      }
    }
    
    if(k >= 6) {
      
      req(
        
        input$ybar6_51c,
        input$n6_51c,
        input$N6_51c
      )
      
      if(input$var_or_sd_51c == "sd51") {
        
        req(input$sd6_51c)
      } else {
        
        req(input$variance6_51c)
      }
    }
    
    group_mean <- c(
      
      input$ybar1_51c, input$ybar2_51c, input$ybar3_51c, 
      
      input$ybar4_51c, input$ybar5_51c, input$ybar6_51c
      
    )
    
    if(input$var_or_sd_51c == "sd51") {
    
      group_sd <- c(
      
        input$sd1_51c, input$sd2_51c, input$sd3_51c, 
      
        input$sd4_51c, input$sd5_51c, input$sd6_51c
      
      )
    } else{
      
      group_sd <- sqrt(c(
      
        input$variance1_51c, input$variance2_51c, input$variance3_51c, 
      
        input$variance4_51c, input$variance5_51c, input$variance6_51c
      
      ))
    }
    
    group_size <- c(
      
      input$n1_51c, input$n2_51c, input$n3_51c, 
      
      input$n4_51c, input$n5_51c, input$n6_51c
      
    )
    
    group_pop <- c(
      
      input$N1_51c, input$N2_51c, input$N3_51c, 
      
      input$N4_51c, input$N5_51c, input$N6_51c
      
    )
    
    group_labels <- c(
      
      "Stratum 1", "Stratum 2", "Stratum 3", "Stratum 4",
      
      "Stratum 5", "Stratum 6", "Stratum 7", "Stratum 8", "Stratum 9"
    )
    
    group_labels <- group_labels[1:k]
    
    group_mean <- group_mean[1:k]

    group_sd <- group_sd[1:k]
    
    group_size <- group_size[1:k]
    
    group_pop <- group_pop[1:k]
    
    pop_all <- sum(group_pop)
    
  }
  
  if(sum(group_size > group_pop)) {
    
    stop(paste("Each stratum size must be larger than the sample size."))
  }
  
  if(min(group_size) <= 1) {
    
    stop(paste("Each stratum needs to have more than one observation!"))
  }

  
  # FPC
  fpc <- (1 - (group_size / group_pop))
  
  # Group se
  group_se <- sqrt(fpc * group_sd^2 / group_size)
  
  # Group moe
  
  group_moe <- input$mult51 * group_se
  
  
  # Group CI
  
  ci_lwr_group_mean <- group_mean - group_moe
  
  ci_upr_group_mean <- group_mean + group_moe
  
  # Group total
  
  group_total <- group_pop * group_mean
  
  # Group total se
  
  group_total_se <- sqrt(group_pop^2 * fpc * group_sd^2 / group_size)
  
  # Group total moe
  
  group_total_moe <- input$mult51 * group_total_se
  
  # Group total CI
  
  ci_lwr_group_total <- group_total - group_total_moe
  
  ci_upr_group_total <- group_total + group_total_moe
  
  # Estimated mean
  ybar <- (1 / pop_all) * sum(group_pop * group_mean)
  
  # Standard error
  ybar_se <- sqrt((1 / (pop_all^2)) * sum((group_pop^2) * (group_se^2)))
  
  # margin of error population
  moe_mean <- input$mult51 * ybar_se
  
  # lower bound population
  ci_lwr_mean <- ybar - moe_mean
  
  # upper bound population
  ci_upr_mean <- ybar + moe_mean
  
  # estimated total population
  total <- pop_all * ybar
  
  # standard error of total population
  sd_total <- sqrt(pop_all^2 * ybar_se^2)
  
  # margin of error of total population
  moe_total <- input$mult51 * sd_total
  
  # lower bound total population
  ci_lwr_total <- total - moe_total
  
  # upper bound total population
  ci_upr_total <- total + moe_total

  # default output table
  req(input$output_type51)
  
  if(input$output_type51 == "p_mt51"){
    
  out <- tibble::tibble(
    
    Parameter = c("Population Mean", "Population Total"), 
                        
    Estimate = c(ybar, total), 
                        
    `Std. Error` = c(ybar_se, sd_total),
                       
    MoE = c(moe_mean, moe_total)
                        
  )
  
  # Add RMoE
  if(show_rmoe) {
    
    out <- dplyr::bind_cols(
      
      out, 
      
      `RMoE (%)` = c((moe_mean / ybar) * 100, (moe_total / total) * 100))
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
    
    round(input$digits51) %>%
    
    format(nsmall = input$digits51, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l", caption = "Population Mean and Total Estimates") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type51 == "s_m51") {
    
    out <- tibble::tibble(
      
      `Stratum Id` = group_labels,
      
      `Estimate` = group_mean,
      
      `Std. Error` = group_se,
      
      `MoE` = group_moe
    )
      
    # Add RMoE
    if(show_rmoe) {
      
      out <- dplyr::bind_cols(
        
        out, 
        
        `RMoE (%)` = c((group_moe / group_mean) * 100)
      )
    }
    
    # Add interval
    if(show_ci) {
      
      out <- dplyr::bind_cols(
        
        out, 
        
        `Lower Bound` = c(ci_lwr_group_mean),
        
        `Upper Bound` = c(ci_upr_group_mean)
      )
    }
    
    out2 <- out[2:ncol(out)] %>% 
      
      as.data.frame() %>%
      
      round(input$digits51) %>%
      
      format(nsmall = input$digits51, scientific = F, big.mark = ",")
    
    out <- dplyr::bind_cols(out[1], out2)
    
    out %>%
      
      knitr::kable("html", align = "l", caption = "Population Mean for each Stratum") %>%
      
      kableExtra::kable_styling(font_size = 15, full_width = F) %>%
      
      kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type51 == "s_t51") {
    
    out <- tibble::tibble(
      
      `Stratum Id` = group_labels,
      
      `Estimate` = group_total,
      
      `Std. Error` = group_total_se,
      
      `MoE` = group_total_moe
    )
    
    # Add RMoE
    if(show_rmoe) {
      
      out <- dplyr::bind_cols(
        
        out, 
        
        `RMoE (%)` = c((group_total_moe / group_total) * 100)
      )
    }
    
    # Add interval
    if(show_ci) {
      
      out <- dplyr::bind_cols(
        
        out, 
        
        `Lower Bound` = c(ci_lwr_group_total),
        
        `Upper Bound` = c(ci_upr_group_total)
      )
    }
    
    out2 <- out[2:ncol(out)] %>% 
      
      as.data.frame() %>%
      
      round(input$digits51) %>%
      
      format(nsmall = input$digits51, scientific = F, big.mark = ",")
    
    out <- dplyr::bind_cols(out[1], out2)
    
    out %>%
      
      knitr::kable("html", align = "l", caption = "Population Total for each Stratum") %>%
      
      kableExtra::kable_styling(font_size = 15, full_width = F) %>%
      
      kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type51 == "ss51") {
    
    out <- tibble::tibble(
      
      `Stratum Id` = group_labels,
      
      `Sample Mean` = group_mean,
      
      `Sample SD` = group_sd,
      
      `Stratum Size` = group_pop,
      
      `Sample Size` = group_size
    )
    
    out2 <- out[2:ncol(out)] %>% 
      
      as.data.frame() %>%
      
      round(input$digits51) %>%
      
      format(nsmall = input$digits51, scientific = F, big.mark = ",")
    
    out <- dplyr::bind_cols(out[1], out2)
    
    out %>%
      
      knitr::kable("html", align = "l", caption = "Sample Summary for each Stratum") %>%
      
      kableExtra::kable_styling(font_size = 15, full_width = F) %>%
      
      kableExtra::column_spec(1, width = "200px", bold = T)
   
  }
}

# --------------------------------------------------------------------------------------------------
# END SERVER ch5app1
# --------------------------------------------------------------------------------------------------

