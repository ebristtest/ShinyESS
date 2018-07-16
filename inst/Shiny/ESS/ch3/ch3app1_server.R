# ------------------------------------------------------------------------------
# SERVER ch3app1
# ------------------------------------------------------------------------------

# Demo title -------------------------------------------------------------------

output$title3_1 <- renderText({
  
  "Confidence Interval Demo"
})

output$pop_info3_1 <- renderUI({
  
  actionButton(
    
    inputId = "pop_info_text3_1",
    
    label = "Background",
    
    width = "200px"
  )
  
})

output$background3_1 <- renderText({
  
  c(
    "The population is normally distributed with a mean of 50",
    "(shown by the horizontal, blue line) and a standard deviation of 5."
  )
})

# Confidence level slider ------------------------------------------------------

output$confidence3_1 <- renderUI({
  
  sliderInput(
    
    inputId = "confidence3_1", 
    
    label = "Confidence Level (%)", 
    
    value = 90, 
              
    min = 50, 
    
    max = 99, 
    
    step = 1, 
    
    ticks = F, 
    
    post = "%"
  )
})

# Sample size slider -----------------------------------------------------------

output$smplsize3_1 <- renderUI({
  
  sliderInput(
    
    inputId = "smplsize3_1", 
    
    label = "Sample Size", 
    
    value = 30, 
              
    min = 2, 
    
    max = 100, 
    
    step = 1, 
    
    ticks = F
  )
})

# Number of samples slider -----------------------------------------------------

output$nsamples3_1 <- renderUI({
  
  sliderInput(
    
    inputId = "nsamples3_1", 
    
    label = "Number of Samples", 
    
    value = 30, 
              
    min = 1, 
    
    max = 100, 
    
    step = 1, 
    
    ticks = F
  )
})

# Population parameters --------------------------------------------------------

norm_mean <- 50

norm_sd <- 5
  
# A confidence interval function for random samples  ---------------------------

sample <- function(n, p = 95, pop_mean = 50, pop_sd = 5) {
  
  # n random draws from the selected normal distribution
  
  samp <- rnorm(n, norm_mean, norm_sd)
  
  # Sample mean
  
  samp_mean <- mean(samp)
  
  # Sample standard deviation
  
  samp_sd <- sd(samp)
  
  # Standard error
  
  se <- samp_sd / sqrt(n)
  
  # Critical z
  
  z <- - qnorm((0.5 - p/200))
  
  # Confidence intervals
  
  ci <- 
    
    data.frame(
      
      # Lower bound
      
      lower = samp_mean - z * se,
      
      # Upper bound
                  
      upper = samp_mean + z * se,
      
      # Mean
      
      mean = samp_mean
    )
  
  # Return the ci data.frame
  
  ci
}

# Draw button creates new samples and confidence intervals ---------------------

sample_ci <- reactive({
  
  input$draw3_1
  
  req(input$nsamples3_1, input$smplsize3_1, input$confidence3_1)
  
  mutate(
    
    plyr::rdply(
      
      input$nsamples3_1, 
                     
      sample(input$smplsize3_1, input$confidence3_1)
    ),
         
    n = seq_len(input$nsamples3_1),
         
    `Excludes Mean` = ((50 < lower) | (50 > upper))
  )
})
  
# Plot of the intervals --------------------------------------------------------

output$plot3_1 <- renderPlot({
  
  mean <- mean(sample_ci()$`Excludes Mean`)
  
  ifelse(
    
    mean == 0, 
    
    col <- c("black"),
    
    ifelse(
      
      mean == 1, 
        
      col <- c("red"), 
      
      col <- c("black", "red")
    )
  )
  
  # ggplot of confidence intervals
  
  print(
    
    ggplot(
      
      data = sample_ci(), 
      
      mapping = aes(
        
        x = n, 
         
        ymin = lower, 
                            
        ymax = upper,
                            
        colour = `Excludes Mean`
      )
    ) +
    
    geom_hline(
      
      yintercept = 50, 
      
      color = "blue", 
      
      size = 1
    ) +
    
    geom_linerange(
      
      size = 1
    ) +
    
    geom_point(
      
      aes(
        
        x = n, 
        
        y = mean, 
        
        color = `Excludes Mean`
      ), 
               
      shape = 15, 
      
      size = 5
    ) +
    
    labs(
      
      y = "", 
      
      x = "Samples"
    ) + 
    
    scale_colour_manual(
      
      values = col
    ) +
      
    scale_y_continuous(
      
      limits = 
        
        c(
        
          ifelse(
          
            45 < min(sample_ci()$lower), 
          
            45, 
          
            min(sample_ci()$lower)
          ), 
        
          ifelse(
          
            55 > max(sample_ci()$upper), 
          
            55, 
          
            max(sample_ci()$upper)
          )
        )
    ) +
      
    theme_bw() +
      
    theme(
      
      axis.text.y   = element_text(size=14),
      
      axis.text.x   = element_text(size=14),
      
      axis.title.y  = element_text(size=14),
      
      axis.title.x  = element_text(size=14),
      
      axis.line = element_line(colour = "black"),
      
      plot.background = element_rect(fill = "white", color = "white"),
      
      panel.background = element_rect(fill = "white"),
      
      panel.grid.major = element_blank(), 
      
      panel.grid.minor = element_blank(),
      
      panel.border = element_rect(colour = "black", fill=NA, size=5),
      
      legend.position="none"
    )
  )
    
})
  
# Number of C.I.'s that missed the population mean -----------------------------
output$miss3_1 <- renderText({

  c(
    input$nsamples3_1 - sum(sample_ci()$`Excludes Mean`), 
    " of the", input$nsamples3_1, 
    " confidence intervals include the true mean",
    " (", round((1 - mean(sample_ci()$`Excludes Mean`)) * 100, 2), "% )"
  )
})
  
# Question section -------------------------------------------------------------

output$Q3_1 <- renderText({

  "Questions:"
})
  
# Question 1 -------------------------------------------------------------------

output$Q13_1 <- renderText({

  "Why is a 90% confidence interval called that?"
})

# Question 2 -------------------------------------------------------------------  

output$Q23_1 <- renderText({
    
  "What is the effect of changing the sample size?"
})
  
# Question 3 -------------------------------------------------------------------
  
output$Q33_1 <- renderText({
    
  "What is the effect of changing the confidence level?"
})

# Question 4 -------------------------------------------------------------------
  
output$Q43_1 <- renderText({
    
  "What can you do to make a smaller interval?"
})
  
# Hint 1 -----------------------------------------------------------------------
output$H1text3_1 <- renderText({
    
  paste(
    "Select 90% confidence, sample size = 30, and number of samples = 20.",
    "Click on the New Simulation button 10 times;",
    "each time count how many of the confidence intervals",
    "FAIL to include the true population mean of 50. These are marked red.",
    "When you are done, you will have",
    "generated 200 90% confidence intervals. What percentage of them missed",
    "50? What percentage included 50?",
    "Your answer won't be exact, but if you repeat it a few times or ",
    "(if you are in a group, all doing it,",
    "compare notes), I think you'll be able to deduce why a 90% interval is",
    "called that. Write that deduction",
    "in your own words, THEN click on the answer button."
  )
})
  
# Answer 1 ---------------------------------------------------------------------
  
output$A1text3_1 <- renderText({
    
  paste(
    "Given a choice of confidence level CL% (e.g. 90% or 95% or...),",
    "a CL% confidence interval procedure ought to contain the parameter",
    "being estimated CL% of the time.",
    "The interval from any one data set either does or does not (and, in real",
    "life, we usually will never know), but",
    "it is this 'long run' property that gives us confidence (a feeling,",
    " after all) in the intervals we create. ",
    "Critical to this being true is that we have chosen the",
    "appropriate statistical tool and have used it in a valid way",
    "(but learning about such is not",
    "part of this lesson on the ideas of confidence intervals)."
  )
})
  
# Hint 2 -----------------------------------------------------------------------
  
output$H2text3_1 <- renderText({
    
  paste(
    "Move the sample size slider around to various positions.",
    "Do you notice a pattern between the size of the sample and",
    "the width of the confidence interval? Commit your answer to paper,",
    "then click on the answer button."
  )
})
  
# Answer 2 ---------------------------------------------------------------------
  
output$A2text3_1 <- renderText({
    
  paste(
    "As sample size increases, so does precision of the estimate (intuitively",
    "reasonable, I suppose). This leads to a smaller margin of error",
    "(i.e. a narrower interval).")
})
  
# Hint 3 -----------------------------------------------------------------------
  
output$H3text3_1 <- renderText({
    
  paste(
    "Move the confidence level slider around to various positions.",
    "Do you notice a pattern between the confidence level and the",
    "width of the interval? Commit your answer to paper,",
    "then click on the answer button."
  )
})
  
# Answer 3 ---------------------------------------------------------------------
  
output$A3text3_1 <- renderText({
    
  paste(
    "If you wish to be more sure that the interval from a given",
    "dataset contains the population",
    "value being estimated (more sure means choosing a higher",
    "confidence level), you need to make a wider interval."
  )
})
  
# Hint 4 -----------------------------------------------------------------------
  
output$H4text3_1 <- renderText({
    
  paste("Questions 3 and 4 (and their answers) provide the clues.")
})
  
# Answer 4 ---------------------------------------------------------------------
  
output$A4text3_1 <- renderText({
    
  paste(
    "Either get more data (the price is obvious) or select a lower confidence",
    "level (the price is being less sure that the interval contains",
    "the population value being estimated."
  )
})
  
# Hide/Show Hints and Answers --------------------------------------------------
  
observeEvent(input$H13_1, {
    
  shinyjs::show("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$A13_1, {
  
  shinyjs::show("cpa13_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$H23_1, {
    
  shinyjs::show("cph23_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$A23_1, {
    
  shinyjs::show("cpa23_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$H33_1, {
    
  shinyjs::show("cph33_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$A33_1, {
  
  shinyjs::show("cpa33_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$H43_1, {
  
  shinyjs::show("cph43_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
    
  shinyjs::hide("cpa43_1")
})
  
observeEvent(input$A43_1, {
    
  shinyjs::show("cpa43_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
})
  
observeEvent(input$clear3_1, {
    
  shinyjs::hide("cpa43_1")
    
  shinyjs::hide("cph13_1")
    
  shinyjs::hide("cph23_1")
    
  shinyjs::hide("cph33_1")
    
  shinyjs::hide("cph43_1")
    
  shinyjs::hide("cpa13_1")
    
  shinyjs::hide("cpa23_1")
    
  shinyjs::hide("cpa33_1")
})
  
# ------------------------------------------------------------------------------
# END SERVER ch3app1
# ------------------------------------------------------------------------------


