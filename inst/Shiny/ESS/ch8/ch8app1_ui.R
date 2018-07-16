tabsetPanel(
  tabPanel("Select Data", fluid = TRUE,
           
           # Sidebar layout with input and output definitions --------------
           sidebarLayout(
             
             # Sidebar panel for inputs ------------------------------------
             sidebarPanel(
               
               # Input: Select the data source -----------------------------
               radioButtons("type5_1",
                            label = h5("Data Source"),
                            choices = c("Textbook Data" = "text_data",
                                        "User Data" = "user_data"),
                            selected = "text_data"),
               
               # Input: Select the data (conditional on data source --------
               conditionalPanel(
                 condition = "input.type5_1 == 'text_data'",
                 
                 selectInput(inputId = "dataset",
                             label = h5("Choose the Data"),
                             choices = c("Data 8.1", "Data 8.2", "Data 8.6",
                                         "Data 8.8", "Data 8.9", "Data 8.10",
                                         "Data 8.11", "Data 8.13", "Data 8.14",
                                         "Data 8.16", "Data 8.17", "Data 8.18",
                                         "Data 8.19", "Data 8.20", "Data 8.23",
                                         "Data 8.24", "Data 8.36")
                 )),
               
               # Input: Choose CSV File ------------------------------------
               conditionalPanel(
                 condition = "input.type5_1 == 'user_data'",
                 
                 fileInput("file1", "Choose CSV File",
                           multiple = TRUE,
                           accept = c("text/csv",
                                      "text/comma-separated-values,text/plain",
                                      ".csv")),
                 
                 # Input: Checkbox if file has header ----
                 checkboxInput("header", "Header", TRUE),
                 
                 # Input: Select separator ----
                 radioButtons("sep", "Separator",
                              choices = c(Comma = ",",
                                          Semicolon = ";",
                                          Tab = "\t"),
                              selected = ",")
               ),
               
               # Input: Selector for y -------------------------------------
               uiOutput("select_y"),
               
               # Input: Selector for m -------------------------------------
               uiOutput("select_m"),
               
               # Input: Selector for N -------------------------------------
               uiOutput("select_N")
             ),
             
             mainPanel(DT::dataTableOutput("view"), class = 'leftAlign')
           )
  ),
  
  tabPanel("Output", fluid = TRUE,
           sidebarLayout(
             sidebarPanel(
               
               # RMoE ------------------------------------------------------
               uiOutput("checkrmoe"),
               
               # Conf Int --------------------------------------------------
               uiOutput("checkci"),
               
               # Total number of observations ------------------------------
               uiOutput("ifM"),
               
               conditionalPanel(
                 condition = "input.ifM",
                 
                 uiOutput("selectM")
                 
               ),
               
               # Set digits ------------------------------------------------
               sliderInput(inputId = "digits",
                           label = h5("Number of Decimals"),
                           value = 2, min = 0, max = 10),
               
               # Multiplier ------------------------------------------------
               uiOutput("mult")
             ),
             
             
             
             # Main tab panel for displaying outputs -----------------------
             mainPanel(tableOutput("test"))
           ))
  
  
  
)