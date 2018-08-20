# --------------------------------------------------------------------------------------------------
# UI ch5app1
# --------------------------------------------------------------------------------------------------

fluidPage(
  
  fluidRow(
    
    div(style = "height:5px"), 
    
    uiOutput("title51")
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
            
            radioButtons(
              
              inputId = "type51", 
              
              label = "Data Source",
                         
              choices = 
                
                c(
                
                  "Textbook Data" = "text_data51",
                    
                  "User Data" = "user_data51",
                                     
                  "User Values" = "user_values51"
                ),
                         
              selected = "text_data51",
              
              inline = T
            ),
            
            conditionalPanel(
              
              condition = "input.type51 == 'text_data51'",
            
              fluidRow(
                
                column(
                  
                  width = 6,
                  
                  # Input: Text dataset ------------------------------------------------------------
                  
                  uiOutput("select_dataset51")
                ),
                
                column(
                  
                  width = 6,
                  
                  #Input: Stratum Id (text data) ---------------------------------------------------
                  
                  uiOutput("select_strat51a")
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 6,
                  
                  #Input: Variable of interest (text data) -----------------------------------------
                  
                  uiOutput("select_y51a")
                ),
                
                column(
                  
                  width = 6,
                  
                  uiOutput("num_strata_a51")
                )
              ),
              
              # Rows for strata sizes --------------------------------------------------------------
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  uiOutput("select_size1_51a")
                ),
                
                column(
                  
                  width = 4,
                  
                  uiOutput("select_size2_51a")
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 3",
                    
                    uiOutput("select_size3_51a")
                  )
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 4",
                    
                    uiOutput("select_size4_51a")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 5",
                    
                    uiOutput("select_size5_51a")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 6",
                    
                    uiOutput("select_size6_51a")
                  )
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 7",
                    
                    uiOutput("select_size7_51a")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 8",
                    
                    uiOutput("select_size8_51a")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_a51 >= 9",
                    
                    uiOutput("select_size9_51a")
                  )
                )
              )
            ),    

            conditionalPanel(
              
              condition = "input.type51 == 'user_data51'",
              
              fluidRow(
                
                column(
                  
                  width = 5,
                  
                  # Input: select file -------------------------------------------------------------
                  
                  uiOutput("select_csv51")
                ),
                
                column(
                  
                  width = 2,
                  
                  # Input: Checkbox if file has header ---------------------------------------------
                  
                  radioButtons(
                    
                    inputId = "header51", 
                    
                    label = "Header", 
                    
                    choices = c(
                      
                      Yes = "yes",
                      
                      No = "no"
                    ),
                    
                    selected = "yes",
                    
                    inline = T
                  )
                ),
                
                column(
                  
                  width = 5,
                  
                  # Input: Select separator --------------------------------------------------------
                  
                  radioButtons(
                    
                    inputId = "sep51", 
                    
                    label = "Separator", 
                    
                    choices = 
                      c(
                        Comma = ",", 
                        
                        Semicolon = ";",
                        
                        Tab = "\t"),
                    
                    selected = ",",
                    
                    inline = T
                  )
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  #Input: Stratum Id (user data) ---------------------------------------------------
                  
                  uiOutput("select_strat51b")
                ),
                
                column(
                  
                  width = 4,
                  
                  #Input: Variable of interest (user data) -----------------------------------------
                  
                  uiOutput("select_y51b")
                ),
                
                column(
                  
                  width = 4,
                  
                  #Input: Number of Strata ---------------------------------------------------------

                  uiOutput("num_strata_b51")
                )
              ),
              
              # Rows for strata sizes --------------------------------------------------------------
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  uiOutput("select_size1_51b")
                ),
                
                column(
                  
                  width = 4,
                  
                  uiOutput("select_size2_51b")
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 3",
                    
                    uiOutput("select_size3_51b")
                  )
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 4",
                    
                    uiOutput("select_size4_51b")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 5",
                    
                    uiOutput("select_size5_51b")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 6",
                    
                    uiOutput("select_size6_51b")
                  )
                )
              ),
              
              fluidRow(
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 7",
                    
                    uiOutput("select_size7_51b")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 8",
                    
                    uiOutput("select_size8_51b")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  conditionalPanel(
                    
                    condition = "input.num_strata_b51 >= 9",
                    
                    uiOutput("select_size9_51b")
                  )
                )
              )
            ),
            
            conditionalPanel(
              
              condition = "input.type51 == 'user_values51'",
              
              fluidRow(
                
                column(
                  
                  width = 6, 
                  
                  # Input: Number of strata --------------------------------------------------------                
                  
                  uiOutput("select_num_strat_51c")
                ),
                
                column(
                  
                  width = 5,
                  
                  offset = 1,
                  
                  uiOutput("var_or_sd_51c")
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
                      
                      uiOutput("select_ybar1_51c")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_51c == 'var51'",
                        
                        # Input: Sample variance stratum 1 -----------------------------------------
                        
                        uiOutput("select_var1_51c")
                      ),
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_51c == 'sd51'",
                        
                        # Input: Sample sd stratum 1 -----------------------------------------------
                        
                        uiOutput("select_sd1_51c")
                      )
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample size stratum 1 -----------------------------------------------
                      
                      uiOutput("select_n1_51c")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Population size stratum 1 -------------------------------------------
                      
                      uiOutput("select_N1_51c")
                    )
                  ),
                  
                  # Stratum 2 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample mean stratum 2 -----------------------------------------------
                      
                      uiOutput("select_ybar2_51c")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_51c == 'var51'",
                        
                        # Input: Sample variance stratum 2 -----------------------------------------
                        
                        uiOutput("select_var2_51c")
                      ),
                      
                      conditionalPanel(
                        
                        condition = "input.var_or_sd_51c == 'sd51'",
                        
                        # Input: Sample sd stratum 2 -----------------------------------------------
                        
                        uiOutput("select_sd2_51c")
                      )
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Sample size stratum 2 -----------------------------------------------
                      
                      uiOutput("select_n2_51c")
                    ),
                    
                    column(
                      
                      width = 3,
                      
                      # Input: Population size stratum 2 -------------------------------------------
                      
                      uiOutput("select_N2_51c")
                    )
                  ),
                  
                  # Stratum 3 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_51c >= 3",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 3 ---------------------------------------------
                        
                        uiOutput("select_ybar3_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'var51'",
                          
                          # Input: Sample variance stratum 3 ---------------------------------------
                          
                          uiOutput("select_var3_51c")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'sd51'",
                          
                          # Input: Sample sd stratum 3 ---------------------------------------------
                          
                          uiOutput("select_sd3_51c")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 3 ---------------------------------------------
                        
                        uiOutput("select_n3_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 3 -----------------------------------------
                        
                        uiOutput("select_N3_51c")
                      )
                    )
                  ),
                  
                  # Stratum 4 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_51c >= 4",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 4 ---------------------------------------------
                        
                        uiOutput("select_ybar4_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'var51'",
                          
                          # Input: Sample variance stratum 4 ---------------------------------------
                          
                          uiOutput("select_var4_51c")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'sd51'",
                          
                          # Input: Sample sd stratum 4 ---------------------------------------------
                          
                          uiOutput("select_sd4_51c")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 4 ---------------------------------------------
                        
                        uiOutput("select_n4_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 4 -----------------------------------------
                        
                        uiOutput("select_N4_51c")
                      )
                    )
                  ),
                  
                  # Stratum 5 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_51c >= 5",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 5 ---------------------------------------------
                        
                        uiOutput("select_ybar5_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'var51'",
                          
                          # Input: Sample variance stratum 5 ---------------------------------------
                          
                          uiOutput("select_var5_51c")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'sd51'",
                          
                          # Input: Sample sd stratum 5 ---------------------------------------------
                          
                          uiOutput("select_sd5_51c")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 5 ---------------------------------------------
                        
                        uiOutput("select_n5_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 5 -----------------------------------------
                        
                        uiOutput("select_N5_51c")
                      )
                    )
                  ),
                  
                  # Stratum 6 ----------------------------------------------------------------------
                  
                  fluidRow(
                    
                    conditionalPanel(
                      
                      condition = "input.num_strat_51c >= 6",
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample mean stratum 6 ---------------------------------------------
                        
                        uiOutput("select_ybar6_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'var51'",
                          
                          # Input: Sample variance stratum 6 ---------------------------------------
                          
                          uiOutput("select_var6_51c")
                        ),
                        
                        conditionalPanel(
                          
                          condition = "input.var_or_sd_51c == 'sd51'",
                          
                          # Input: Sample sd stratum 6 ---------------------------------------------
                          
                          uiOutput("select_sd6_51c")
                        )
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Sample size stratum 6 ---------------------------------------------
                        
                        uiOutput("select_n6_51c")
                      ),
                      
                      column(
                        
                        width = 3,
                        
                        # Input: Population size stratum 6 -----------------------------------------
                        
                        uiOutput("select_N6_51c")
                      )
                    )
                  )
                )
                
                
              )
            ),
            
            actionButton(
              
              inputId = "preview_data5_1",
              
              label = "Preview Data",
              
              width = "150px",
              
              style = "
              
              color: black; 
              font-weight: bold; 
              font-size: 11pt;
              background-color: #f4f4f4; 
              border: 3px solid black;
              margin-top: 15px;
              border-radius: 10px;
              "
            ),
            
            bsModal(
              
              id = "popup_preview_data5_1", 
              
              title = "Selected Data", 
              
              trigger = "preview_data5_1",
              
              size = "large",
              
              column(
                
                width = 12, 
                
                offset = 0,
                
                shinydashboard::box(
                  
                  title = NULL, 
                  
                  width = "100%", 
                  
                  status = "warning", 
                  
                  solidHeader = F, 
                  
                  collapsible = F,
                  
                  div(style = 'overflow-x: scroll',
                      
                      column(
                        
                        width = 12,
                        
                        DT::dataTableOutput("data_table51")
                      )
                  )
                  
                ) # End data preview box
                
              ) # End left column
              
            ) # Modal
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
                  
                  width = 4,
                  
                  uiOutput("output_type51")
                ),
                
                column(
                  
                  width = 3,
                  
                  fluidRow(
                    
                    uiOutput("checkrmoe51")
                  ),
                  
                  fluidRow(
                    
                    uiOutput("checkci51")
                  )
                ),
                
                column(
                  
                  width = 4,
                  
                  fluidRow(
                    
                    uiOutput("mult51")
                  ),
                  
                  fluidRow(
                    
                    uiOutput("digits51")
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
                       
                tableOutput('output_table51')
            )
              
          )  # End output box       
               
        ) # End column
        
      )
      
    ) # End right column
    
  ) # End page fluidRow
  
) # End of fluidPage 

# --------------------------------------------------------------------------------------------------
# END UI ch4app1 
# --------------------------------------------------------------------------------------------------

