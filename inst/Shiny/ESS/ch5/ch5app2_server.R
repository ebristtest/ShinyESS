
# --------------------------------------------------------------------------------------------------
# SERVER ch5app2
# --------------------------------------------------------------------------------------------------

# Page title ---------------------------------------------------------------------------------------

output$title52 <- renderText({
  
  c("Sample Size Required to Estimate a Population Mean or Total Using a Stratified Random", 
    "Sample Design")
  
})

output$select_num_strat_52 <- renderUI({
  
  sliderInput(
    
    inputId = "num_strat_52",
    
    label = "Number of Strata",
    
    min = 2,
    
    max = 6,
    
    value = 2,
    
    ticks = F
  )
})

output$var_or_sd_52 <- renderUI({
  
  radioButtons(
    
    inputId = "var_or_sd_52",
    
    label = "Variance or Standard Deviation",
    
    choices = c(
      
      "Variance" = 'var52',
      
      "Standard Deviation" = 'sd52'
    ),
    
    selected = "sd52",
    
    inline = T
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 1
# --------------------------------------------------------------------------------------------------

# Input sample mean 1 ------------------------------------------------------------------------------

output$select_ybar1_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar1_52", 
    
    label = "Sample Mean 1", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 1 --------------------------------------------------------------------------

output$select_var1_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance1_52", 
    
    label = "Sample Variance 1", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 1 --------------------------------------------------------------------------------

output$select_sd1_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd1_52", 
    
    label = "Sample SD 1", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 1 ------------------------------------------------------------------------------

output$select_n1_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n1_52", 
    
    label = "Sample Size 1", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 1 --------------------------------------------------------------------------

output$select_N1_52 <- renderUI({

  req(input$n1_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N1_52",
    
    label = "Population Size 1",
    
    min = input$n1_52 + 1,
    
    max = Inf,
    
    value = input$n1_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 2
# --------------------------------------------------------------------------------------------------

# Input sample mean 2 ------------------------------------------------------------------------------

output$select_ybar2_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar2_52", 
    
    label = "Sample Mean 2", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 2 --------------------------------------------------------------------------

output$select_var2_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance2_52", 
    
    label = "Sample Variance 2", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 2 --------------------------------------------------------------------------------

output$select_sd2_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd2_52", 
    
    label = "Sample SD 2", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 2 ------------------------------------------------------------------------------

output$select_n2_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n2_52", 
    
    label = "Sample Size 2", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 2 --------------------------------------------------------------------------

output$select_N2_52 <- renderUI({
  
  req(input$n2_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N2_52",
    
    label = "Population Size 2",
    
    min = input$n2_52 + 1,
    
    max = Inf,
    
    value = input$n2_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 3
# --------------------------------------------------------------------------------------------------

# Input sample mean 3 ------------------------------------------------------------------------------

output$select_ybar3_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar3_52", 
    
    label = "Sample Mean 3", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 3 --------------------------------------------------------------------------

output$select_var3_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance3_52", 
    
    label = "Sample Variance 3", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 3 --------------------------------------------------------------------------------

output$select_sd3_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd3_52", 
    
    label = "Sample SD 3", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 3 ------------------------------------------------------------------------------

output$select_n3_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n3_52", 
    
    label = "Sample Size 3", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 3 --------------------------------------------------------------------------

output$select_N3_52 <- renderUI({
  
  req(input$n3_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N3_52",
    
    label = "Population Size 3",
    
    min = input$n3_52 + 1,
    
    max = Inf,
    
    value = input$n3_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 4
# --------------------------------------------------------------------------------------------------

# Input sample mean 4 ------------------------------------------------------------------------------

output$select_ybar4_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar4_52", 
    
    label = "Sample Mean 4", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 4 --------------------------------------------------------------------------

output$select_var4_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance4_52", 
    
    label = "Sample Variance 4", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 4 --------------------------------------------------------------------------------

output$select_sd4_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd4_52", 
    
    label = "Sample SD 4", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 4 ------------------------------------------------------------------------------

output$select_n4_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n4_52", 
    
    label = "Sample Size 4", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 4 --------------------------------------------------------------------------

output$select_N4_52 <- renderUI({
  
  req(input$n4_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N4_52",
    
    label = "Population Size 4",
    
    min = input$n4_52 + 1,
    
    max = Inf,
    
    value = input$n4_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 5
# --------------------------------------------------------------------------------------------------

# Input sample mean 5 ------------------------------------------------------------------------------

output$select_ybar5_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar5_52", 
    
    label = "Sample Mean 5", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 5 --------------------------------------------------------------------------

output$select_var5_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance5_52", 
    
    label = "Sample Variance 5", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 5 --------------------------------------------------------------------------------

output$select_sd5_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd5_52", 
    
    label = "Sample SD 5", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 5 ------------------------------------------------------------------------------

output$select_n5_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n5_52", 
    
    label = "Sample Size 5", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 5 --------------------------------------------------------------------------

output$select_N5_52 <- renderUI({
  
  req(input$n5_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N5_52",
    
    label = "Population Size 5",
    
    min = input$n5_52 + 1,
    
    max = Inf,
    
    value = input$n5_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# Stratum 6
# --------------------------------------------------------------------------------------------------

# Input sample mean 6 ------------------------------------------------------------------------------

output$select_ybar6_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "ybar6_52", 
    
    label = "Sample Mean 6", 
    
    min = -Inf, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample variance 6 --------------------------------------------------------------------------

output$select_var6_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "variance6_52", 
    
    label = "Sample Variance 6", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample sd 6 --------------------------------------------------------------------------------

output$select_sd6_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "sd6_52", 
    
    label = "Sample SD 6", 
    
    min = 0, 
    
    max = Inf, 
    
    value = 1
  )
})

# Input sample size 6 ------------------------------------------------------------------------------

output$select_n6_52 <- renderUI({
  
  req(input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "n6_52", 
    
    label = "Sample Size 6", 
    
    min = 2, 
    
    max = Inf, 
    
    value = 2
  )
})

# input population size 6 --------------------------------------------------------------------------

output$select_N6_52 <- renderUI({
  
  req(input$n6_52, input$num_strat_52, input$var_or_sd_52)
  
  numericInput(
    
    inputId = "N6_52",
    
    label = "Population Size 6", 
    
    min = input$n6_52 + 1,
    
    max = Inf,
    
    value = input$n6_52 + 1
  )
})

# --------------------------------------------------------------------------------------------------
# End SERVER ch5app1 uservals
# --------------------------------------------------------------------------------------------------


# Number of digits to display ----------------------------------------------------------------------
output$digits52 <- renderUI({
  
  sliderInput(
    
    inputId = "digits52",
              
    label = "Number of Decimals",
              
    value = 2, 
    
    min = 0, 
    
    max = 10,
              
    ticks = F, 
    
    sep = ""
  )
})

# Switch between text and user data ----------------------------------------------------------------

data52 <- reactive({
  
  req(datasetInput52a, datasetInput52b)
  
  if(input$type52 == "user_data52") {
    
    datasetInput52b()
  } 
  
  else {
    
    datasetInput52a()
  }
})

# Multiplier ---------------------------------------------------------------------------------------

output$mult52 <- renderUI({
  
  numericInput(
    
    inputId = "mult52",
               
    label = "Interval Multiplier",
               
    value = 2, 
    
    min = 0, 
    
    max = Inf
  )
})

# RMoE ---------------------------------------------------------------------------------------------

output$checkrmoe52 <- renderUI({
  
  radioButtons(
    
    inputId = "checkrmoe52",
    
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

output$checkci52 <- renderUI({
  
  radioButtons(
    
    inputId = "checkci52",
    
    label = "Interval",
    
    choices = c(
      
      "Yes" = "yes",
      
      "No" = "no"
    ),
    
    selected = "yes",
    
    inline = T
  )
})


output$output_type52 <- renderUI({
  
  radioButtons(
    
    inputId = "output_type52",
    
    label = "Parameter Estimates",
    
    choices = c(
      
      "Population Mean and Total" = "p_mt52",
      
      "Individual Stratum Means" = "s_m52",
      
      "Individual Stratum Totals" = "s_t52",
      
      "Sample Summary" = "ss52"
    ),
    
    selected = "p_mt52"
  )
})

# Preview data -------------------------------------------------------------------------------------

output$data_table52 <- DT::renderDataTable({
  
  req(data52())
  
  DT::datatable(
    
    data52(),
    
    options = list(lengthMenu = c(5, 30, 50), pageLength = 5),
    
    rownames = F, 
    
    style = 'bootstrap') %>% 
    
    DT::formatStyle(
      
      columns = 1:ncol(data52()), 
      
      fontSize = '12pt'
    )
})

# --------------------------------------------------------------------------------------------------

# Output table -------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------

output$output_table52 <- function(){
  
  req(input$digits52, input$mult52, input$type52)
  
  show_rmoe <- ifelse(input$checkrmoe52 == 'yes', TRUE, FALSE)
  
  show_ci <- ifelse(input$checkci52 == 'yes', TRUE, FALSE)
  
  # inputs from text data --------------------------------------------------------------------------
  
  if (input$type52 == "text_data52") {
    
    req(data52(), input$strat52a, input$yvar52a, input$num_strata_a52)
    
    data_out <- data52()
    
    if(input$strat52a == "Column Headers" | input$yvar52a == "Row Values") {
      
      data_out <- data_out %>% 
        
        tidyr::gather(key = "g.5_1", value = "y.5_1", na.rm = T)
    }
    
    else{
      
      data_out$y.5_1 <- data52()[[input$yvar52a]]
      
      data_out$g.5_1 <- data52()[[input$strat52a]]
    
    }
    
    data_out <- tidyr::drop_na(data_out)
    
    group_info <- data_out %>% 
      
      group_by(g.5_1) %>%
      
      summarize(
        
        group_mean = mean(y.5_1),
        
        group_sd = sd(y.5_1), 
        
        group_size = n()
      ) 
    
    k <- input$num_strata_a52
    
    req(levels_a52())
    
    if(k != length(levels_a52())) {
      
      stop(paste("Incorrect number of stratum sizes.", "The stratum Id  < ",
                 input$strat52a, " >  has", length(levels_a52()), 
                 "unique stratum, and", k, "stratum sizes",
                 "are given."))
    }
    
    group_pop_vec <- numeric()
    
    if(k >= 1) {
      
      req(input$size1_52a)
      
      group_pop_vec[1] <- input$size1_52a
    }
    
    if(k >= 2) {
      
      req(input$size2_52a)
      
      group_pop_vec[2] <- input$size2_52a
    }
    
    if(k >= 3) {
      
      req(input$size3_52a)
      
      group_pop_vec[3] <- input$size3_52a
    }
    
    if(k >= 4) {
      
      req(input$size4_52a)
      
      group_pop_vec[4] <- input$size4_52a
    }
    
    if(k >= 5) {
      
      req(input$size5_52a)
      
      group_pop_vec[5] <- input$size5_52a
    }
    
    if(k >= 6) {
      
      req(input$size6_52a)
      
      group_pop_vec[6] <- input$size6_52a
    }
    
    if(k >= 7) {
      
      req(input$size7_52a)
      
      group_pop_vec[7] <- input$size7_52a
    }
    
    if(k >= 8) {
      
      req(input$size8_52a)
      
      group_pop_vec[8] <- input$size8_52a
    }
    
    if(k >= 9) {
      
      req(input$size9_52a)
      
      group_pop_vec[9] <- input$size9_52a
    }
    
    group_labels <- group_info$g.5_1
    
    group_pop <- data.frame(N.5_1 = group_pop_vec, g.5_1 = levels_a52())
    
    group_info <- merge(group_info, group_pop, by = "g.5_1")
    
    group_mean <- group_info$group_mean
    
    group_sd <- group_info$group_sd
    
    group_size <- group_info$group_size
    
    group_pop <- group_info$N.5_1
    
    pop_all <- sum(group_pop)
    
  }
  
  # inputs for user data ---------------------------------------------------------------------------
  
  else if(input$type52 == "user_data52") {
    
    req(data52(), input$strat52b, input$yvar52b, input$num_strata_b52)
    
    data_out <- data52()
    
    if(input$strat52b == "Column Headers" | input$yvar52b == "Row Values") {
      
      data_out <- data_out %>% 
        
        tidyr::gather(key = "g.5_1", value = "y.5_1", na.rm = T)
    }
    
    else{
      
      data_out$y.5_1 <- data52()[[input$yvar52b]]
      
      data_out$g.5_1 <- data52()[[input$strat52b]]
    }
    
    group_info <- data_out %>% 
      
      group_by(g.5_1) %>%
      
      summarize(
        
        group_mean = mean(y.5_1),
        
        group_sd = sd(y.5_1), 
        
        group_size = n()
      ) 
    
    k <- input$num_strata_b52
    
    req(levels_b52())
    
    if(k != length(levels_b52())) {
      
      stop(paste("Incorrect number of stratum sizes.", "The stratum Id  < ",
                 input$strat52b, " >  has", length(levels_b52()), 
                 "unique stratum, and", k, "stratum sizes",
                 "are given."))
    }
    
    group_pop_vec <- numeric()
    
    if(k >= 1) {
      
      req(input$size1_52b)
      
      group_pop_vec[1] <- input$size1_52b
    }
    
    if(k >= 2) {
      
      req(input$size2_52b)
      
      group_pop_vec[2] <- input$size2_52b
    }
    
    if(k >= 3) {
      
      req(input$size3_52b)
      
      group_pop_vec[3] <- input$size3_52b
    }
    
    if(k >= 4) {
      
      req(input$size4_52b)
      
      group_pop_vec[4] <- input$size4_52b
    }
    
    if(k >= 5) {
      
      req(input$size5_52b)
      
      group_pop_vec[5] <- input$size5_52b
    }
    
    if(k >= 6) {
      
      req(input$size6_52b)
      
      group_pop_vec[6] <- input$size6_52b
    }
    
    if(k >= 7) {
      
      req(input$size7_52b)
      
      group_pop_vec[7] <- input$size7_52b
    }
    
    if(k >= 8) {
      
      req(input$size8_52b)
      
      group_pop_vec[8] <- input$size8_52b
    }
    
    if(k >= 9) {
      
      req(input$size9_52b)
      
      group_pop_vec[9] <- input$size9_52b
    }
    
    group_pop <- data.frame(N.5_1 = group_pop_vec, g.5_1 = levels_b52())
    
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
    
    req(input$var_or_sd_52)
    
    k <- input$num_strat_52
    
    if(k >= 1) {
      
      req(
        
        input$ybar1_52,
        input$n1_52,
        input$N1_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd1_52)
      } else {
        
        req(input$variance1_52)
      }
    }
    
    if(k >= 2) {
      
      req(
        
        input$ybar2_52,
        input$n2_52,
        input$N2_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd2_52)
      } else {
        
        req(input$variance2_52)
      }
    }
    
    if(k >= 3) {
      
      req(
        
        input$ybar3_52,
        input$n3_52,
        input$N3_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd3_52)
      } else {
        
        req(input$variance3_52)
      }
    }
    
    if(k >= 4) {
      
      req(
        
        input$ybar4_52,
        input$n4_52,
        input$N4_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd4_52)
      } else {
        
        req(input$variance4_52)
      }
    }
    
    if(k >= 5) {
      
      req(
        
        input$ybar5_52,
        input$n5_52,
        input$N5_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd5_52)
      } else {
        
        req(input$variance5_52)
      }
    }
    
    if(k >= 6) {
      
      req(
        
        input$ybar6_52,
        input$n6_52,
        input$N6_52
      )
      
      if(input$var_or_sd_52 == "sd52") {
        
        req(input$sd6_52)
      } else {
        
        req(input$variance6_52)
      }
    }
    
    group_mean <- c(
      
      input$ybar1_52, input$ybar2_52, input$ybar3_52, 
      
      input$ybar4_52, input$ybar5_52, input$ybar6_52
      
    )
    
    if(input$var_or_sd_52 == "sd52") {
    
      group_sd <- c(
      
        input$sd1_52, input$sd2_52, input$sd3_52, 
      
        input$sd4_52, input$sd5_52, input$sd6_52
      
      )
    } else{
      
      group_sd <- sqrt(c(
      
        input$variance1_52, input$variance2_52, input$variance3_52, 
      
        input$variance4_52, input$variance5_52, input$variance6_52
      
      ))
    }
    
    group_size <- c(
      
      input$n1_52, input$n2_52, input$n3_52, 
      
      input$n4_52, input$n5_52, input$n6_52
      
    )
    
    group_pop <- c(
      
      input$N1_52, input$N2_52, input$N3_52, 
      
      input$N4_52, input$N5_52, input$N6_52
      
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
  
  group_moe <- input$mult52 * group_se
  
  
  # Group CI
  
  ci_lwr_group_mean <- group_mean - group_moe
  
  ci_upr_group_mean <- group_mean + group_moe
  
  # Group total
  
  group_total <- group_pop * group_mean
  
  # Group total se
  
  group_total_se <- sqrt(group_pop^2 * fpc * group_sd^2 / group_size)
  
  # Group total moe
  
  group_total_moe <- input$mult52 * group_total_se
  
  # Group total CI
  
  ci_lwr_group_total <- group_total - group_total_moe
  
  ci_upr_group_total <- group_total + group_total_moe
  
  # Estimated mean
  ybar <- (1 / pop_all) * sum(group_pop * group_mean)
  
  # Standard error
  ybar_se <- sqrt((1 / (pop_all^2)) * sum((group_pop^2) * (group_se^2)))
  
  # margin of error population
  moe_mean <- input$mult52 * ybar_se
  
  # lower bound population
  ci_lwr_mean <- ybar - moe_mean
  
  # upper bound population
  ci_upr_mean <- ybar + moe_mean
  
  # estimated total population
  total <- pop_all * ybar
  
  # standard error of total population
  sd_total <- sqrt(pop_all^2 * ybar_se^2)
  
  # margin of error of total population
  moe_total <- input$mult52 * sd_total
  
  # lower bound total population
  ci_lwr_total <- total - moe_total
  
  # upper bound total population
  ci_upr_total <- total + moe_total

  # default output table
  req(input$output_type52)
  
  if(input$output_type52 == "p_mt52"){
    
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
    
    round(input$digits52) %>%
    
    format(nsmall = input$digits52, scientific = F, big.mark = ",")
  
  out <- dplyr::bind_cols(out[1], out2)
  
  out %>%
    
    knitr::kable("html", align = "l", caption = "Population Mean and Total Estimates") %>%
    
    kableExtra::kable_styling(font_size = 15, full_width = F) %>%
    
    kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type52 == "s_m52") {
    
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
      
      round(input$digits52) %>%
      
      format(nsmall = input$digits52, scientific = F, big.mark = ",")
    
    out <- dplyr::bind_cols(out[1], out2)
    
    out %>%
      
      knitr::kable("html", align = "l", caption = "Population Mean for each Stratum") %>%
      
      kableExtra::kable_styling(font_size = 15, full_width = F) %>%
      
      kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type52 == "s_t52") {
    
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
      
      round(input$digits52) %>%
      
      format(nsmall = input$digits52, scientific = F, big.mark = ",")
    
    out <- dplyr::bind_cols(out[1], out2)
    
    out %>%
      
      knitr::kable("html", align = "l", caption = "Population Total for each Stratum") %>%
      
      kableExtra::kable_styling(font_size = 15, full_width = F) %>%
      
      kableExtra::column_spec(1, width = "200px", bold = T)
  } 
  
  else if(input$output_type52 == "ss52") {
    
    out <- tibble::tibble(
      
      `Stratum Id` = group_labels,
      
      `Sample Mean` = group_mean,
      
      `Sample SD` = group_sd,
      
      `Stratum Size` = group_pop,
      
      `Sample Size` = group_size
    )
    
    out2 <- out[2:ncol(out)] %>% 
      
      as.data.frame() %>%
      
      round(input$digits52) %>%
      
      format(nsmall = input$digits52, scientific = F, big.mark = ",")
    
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

