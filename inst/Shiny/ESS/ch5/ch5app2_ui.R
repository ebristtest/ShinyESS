# --------------------------------------------------------------------------------------------------
# UI ch5app2
# --------------------------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title52")
  ),
  
  fluidRow(
    
    div(style = "height:5px"),
    
    column(
      
      width = 6, 
      
      offset = 0,
      
      fluidRow(
        
        column(
          
          width = 12, 
          
          offset = 0,
          
          shinydashboard::box(
            
            title = "Inputs", 
            
            width = "100%", 
            
            collapsible = T,
              
            status = "success", 
            
            solidHeader = T, 
              
              fluidRow(
                
                column(
                  
                  width = 6, 
                  
                  # Input: Number of strata --------------------------------------------------------                
                  
                  uiOutput("select_num_strat_52")
                ),
                
                column(
                  
                  width = 5,
                  
                  offset = 1,
                  
                  uiOutput("var_or_sd_52")
                )
                
              ),
              
              fluidRow(
                
                column(
                  
                  width = 12,
                  
                  # Stratum 1 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample mean stratum 1 -----------------------------------------------
                      
                      uiOutput("select_ybar1_52")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_52 == 'var52'",
                        
                        # Input: Sample variance stratum 1 -----------------------------------------
                        
                        uiOutput("select_var1_52")
                      ),
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_52 == 'sd52'",
                        
                        # Input: Sample sd stratum 1 -----------------------------------------------
                        
                        uiOutput("select_sd1_52")
                      )
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample size stratum 1 -----------------------------------------------
                      
                      uiOutput("select_n1_52")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Population size stratum 1 -------------------------------------------
                      
                      uiOutput("select_N1_52")
                    )
                  ),
                  
                  # Stratum 2 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample mean stratum 2 -----------------------------------------------
                      
                      uiOutput("select_ybar2_52")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_52 == 'var52'",
                        
                        # Input: Sample variance stratum 2 -----------------------------------------
                        
                        uiOutput("select_var2_52")
                      ),
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_52 == 'sd52'",
                        
                        # Input: Sample sd stratum 2 -----------------------------------------------
                        
                        uiOutput("select_sd2_52")
                      )
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample size stratum 2 -----------------------------------------------
                      
                      uiOutput("select_n2_52")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Population size stratum 2 -------------------------------------------
                      
                      uiOutput("select_N2_52")
                    )
                  ),
                  
                  # Stratum 3 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_52 >= 3",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 3 ---------------------------------------------
                        
                        uiOutput("select_ybar3_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'var52'",
                          
                          # Input: Sample variance stratum 3 ---------------------------------------
                          
                          uiOutput("select_var3_52")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'sd52'",
                          
                          # Input: Sample sd stratum 3 ---------------------------------------------
                          
                          uiOutput("select_sd3_52")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 3 ---------------------------------------------
                        
                        uiOutput("select_n3_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 3 -----------------------------------------
                        
                        uiOutput("select_N3_52")
                      )
                    )
                  ),
                  
                  # Stratum 4 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_52 >= 4",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 4 ---------------------------------------------
                        
                        uiOutput("select_ybar4_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'var52'",
                          
                          # Input: Sample variance stratum 4 ---------------------------------------
                          
                          uiOutput("select_var4_52")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'sd52'",
                          
                          # Input: Sample sd stratum 4 ---------------------------------------------
                          
                          uiOutput("select_sd4_52")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 4 ---------------------------------------------
                        
                        uiOutput("select_n4_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 4 -----------------------------------------
                        
                        uiOutput("select_N4_52")
                      )
                    )
                  ),
                  
                  # Stratum 5 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_52 >= 5",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 5 ---------------------------------------------
                        
                        uiOutput("select_ybar5_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'var52'",
                          
                          # Input: Sample variance stratum 5 ---------------------------------------
                          
                          uiOutput("select_var5_52")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'sd52'",
                          
                          # Input: Sample sd stratum 5 ---------------------------------------------
                          
                          uiOutput("select_sd5_52")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 5 ---------------------------------------------
                        
                        uiOutput("select_n5_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 5 -----------------------------------------
                        
                        uiOutput("select_N5_52")
                      )
                    )
                  ),
                  
                  # Stratum 6 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_52 >= 6",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 6 ---------------------------------------------
                        
                        uiOutput("select_ybar6_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'var52'",
                          
                          # Input: Sample variance stratum 6 ---------------------------------------
                          
                          uiOutput("select_var6_52")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_52 == 'sd52'",
                          
                          # Input: Sample sd stratum 6 ---------------------------------------------
                          
                          uiOutput("select_sd6_52")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 6 ---------------------------------------------
                        
                        uiOutput("select_n6_52")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 6 -----------------------------------------
                        
                        uiOutput("select_N6_52")
                      )
                    )
                  )
                )
            )
            
          ) # End input box
          
        ) # End first column
            
      )
      
    ), # End input column
    
    column(
      
      width = 6,
      
      fluidRow(
        
        column(
          
          width = 12, 
          
          offset = 0,
          
          shinydashboard::box(
            
            title = "Output Options", 
            
            width = "100%", 
            
            collapsible = T,
            
            status = "warning", 
            
            solidHeader = T,
            
            fluidRow(
              
              column(
                
                width = 12,
                
                
                div(style = "height:5px"),
                
                column(
                  
                  width = 10,
                  
                  fluidRow(
                    
                    uiOutput("mult52")
                  ),
                  
                  fluidRow(
                    
                    uiOutput("digits52")
                  )
                ),
                
                column(1)
              )
            )
            
          ) # End output options box
          
        ) # End column
        
      ),
      
      fluidRow(
        
        column(
          
          width = 12, 
          
          offset = 0,
               
          shinydashboard::box(
            
            title = "Output", 
            
            width = "100%", 
            
            status = "primary", 
              
            solidHeader = T, 
            
            collapsible = T,
                     
            div(style = 'overflow-x: scroll', 
                       
                tableOutput('output_table52')
            )
              
          )  # End output box       
               
        ) # End column
        
      )
      
    ) # End right column
    
  ) # End page fluidRow
  
) # End of fluidPage 

# --------------------------------------------------------------------------------------------------
# END UI ch5app2
# --------------------------------------------------------------------------------------------------

