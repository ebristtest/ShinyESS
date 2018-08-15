# --------------------------------------------------------------------------------------------------
# SERVER primary 
# --------------------------------------------------------------------------------------------------

shinyServer(function(input, output, session) {
  
  # Render title -----------------------------------------------------------------------------------
  
  output$welcome <- renderText({
    
    HTML(paste("Welcome to the Survey Sampling Shiny App"))
  })
  
  # Call to secondary servers ----------------------------------------------------------------------
  
  # Chapter 3
  
  eval(parse(file = "ch3/ch3app1_server.R"))
  
  eval(parse(file = "ch3/ch3app2_server.R"))
  
  # Chapter 4
  
  eval(parse(file = "ch4/ch4app1_server.R"))
  
  eval(parse(file = "ch4/ch4app2_server.R"))
  
  eval(parse(file = "ch4/ch4app3_server.R"))
  
  eval(parse(file = "ch4/ch4app4_server.R"))
  
  eval(parse(file = "ch4/ch4app5_server.R"))
  
  eval(parse(file = "ch4/ch4app6_server.R"))
  
  eval(parse(file = "ch4/ch4app7_server.R"))
  
  # Chapter 5
  
  eval(parse(file = "ch5/ch5app1_server.R"))
  
  # Chapter 6
  
  # Chapter 7
  
  # Chapter 8
  
  eval(parse(file = "ch8/ch8app1_server.R"))
  
  eval(parse(file = "ch8/ch8app3_server.R"))
  
  # Help
  
  eval(parse(file = "help/help_server.R"))
  
  # Kill app on close ------------------------------------------------------------------------------
  
  session$onSessionEnded(stopApp)  

})
# --------------------------------------------------------------------------------------------------
# END SERVER primary
# --------------------------------------------------------------------------------------------------

