# ------------------------------------------------------------------------------
# SERVER ch3app2
# ------------------------------------------------------------------------------

output$skew32 <- renderUI({
  
  sliderInput(
    
    inputId = "skew32", 
    
    label = "Population Skew", 
              
    min = 0, 
    
    max = 100, 
    
    value = 50, 
    
    step = 1, 
    
    ticks = F
  )
})

output$size32 <- renderUI({
  
  sliderInput(
    
    inputId = "size32", 
    
    label = "Sample Size", 
              
    min = 1, 
    
    max = 200, 
    
    value = 30, 
    
    step = 1, 
    
    ticks = F
  )
})

output$simsize32 <- renderUI({
  
  sliderInput(
    
    inputId = "simsize32", 
    
    label = "Simulation Size",
              
    min = 1000, 
    
    max = 100000, 
    
    value = 25000, 
    
    step = 1000, 
    
    ticks = F
  )
})


reactive_var32 <- reactive({
  
  input$draw32
})

reactive_run_sim32 <- reactive({
  
  input$run_sim32
})

output$population32 <- renderPlot({
  
  req(input$skew32)
  
  skew32 <- input$skew32
  
  skew32 <- (100 - skew32 * 0.9) / 20
  
  x32 <- seq(0, 10, by = 1)

  y32 <- round(dpois(x32, skew32) * 1000, 0)
  
  x_plot <- c(rep(x32, y32), 0:10)
  
  data <- data.frame(x_plot)
  
  ggplot(data, aes(x_plot)) +
    
    geom_bar(color = "black", size = 1, fill = "#dca909", width = 0.4) +
    
    theme_bw() +
    
    labs(x = "", y = "") +
    
    scale_x_discrete(limits = c(0:10))
  
})

output$samp32 <- renderPlot({
  
  req(input$skew32, input$size32)
  
  reactive_var32()
  
  skew32 <- input$skew32
  
  skew32 <- (100 - skew32 * 0.9) / 20
  
  samp_size32 <- input$size32
  
  x32 <- seq(0, 10, by = 1)
  
  y32 <- round(dpois(x32, skew32) * 1000, 0)
  
  x_pop32 <- c(rep(x32, y32), 0:10)
  
  samp <- c(base::sample(x_pop32, samp_size32, replace = TRUE))
  
  data <- data.frame(x32 = factor(samp))

  ggplot(data, aes(x32)) +
    
    geom_bar(color = "black", size = 1, fill = "#2eb469", width = 0.4) +
    
    theme_bw() +
    
    labs(x = "", y = "") +
    
    scale_x_discrete(limits = c(0:10))
})

output$sim32 <- renderPlot({
  
  req(input$skew32, input$size32)
  
  reactive_run_sim32()
  
  skew32 <- input$skew32
  
  skew32 <- (100 - skew32 * 0.9) / 20
  
  samp_size32 <- input$size32
  
  x32 <- seq(0, 10, by = 1)
  
  y32 <- round(dpois(x32, skew32) * 1000, 0)
  
  x_pop32 <- c(rep(x32, y32), 0:10)
  
  simsize <- input$simsize32
  
  means <- numeric(simsize)
  
  for(i in 1:simsize){
    
    means[i] <- mean(c(base::sample(x_pop32, samp_size32, replace = TRUE)))
  }
  
  data <- data.frame(x32 = means)
  
  mean_all <- mean(means)
  
  sd_all <- sd(means)
  
  lwr_limit <- mean_all - 4 * sd_all
  
  
  upr_limit <- mean_all + 4 * sd_all
  
  ggplot(data, aes(x32)) +
    
    geom_density(color = "#009933", fill = "#8b4a8b", alpha = 0.8) +
    
    theme_bw() +   
    
    labs(x = "", y = "") +
    
    stat_function(
      
      fun = function(x, mean, sd) {
        
        dnorm(x = x, mean = mean, sd = sd)
      },
      
      args = c(mean = mean_all, sd = sd_all), 
      
      color = "black", size = 2
    ) +
    
    scale_x_continuous(limits = c(lwr_limit, upr_limit))
  })

  output$title32 <- renderText({
    
    c("Distribution of the Means Demo")
  })
  
  output$text_pop32 <- renderText({
    
    req(input$skew32)
    
    skew32 <- input$skew32
    
    skew32 <- (100 - skew32 * 0.9) / 20
    
    c("The selected population distribution is Poisson(", skew32, ")",
      "with a truncated support of [0, 10]")
  })
  
  output$text_samp32 <- renderText({
    
    req(input$size32)
    
    c("A histogram of a single random sample of size" , input$size32, ".")
  })
  
  output$text_sim32 <- renderText({
    
    req(input$size32)
    
    c("A set of", input$simsize32, "random samples of size ", input$size32, 
      "were taken from the population.", "The smoothed density of the",
       input$size32, "sample means is shown in purple.",
      "A normal distribution is shown by the black curve.")
  })

# ------------------------------------------------------------------------------
# END SERVER ch3app2
# ------------------------------------------------------------------------------
  