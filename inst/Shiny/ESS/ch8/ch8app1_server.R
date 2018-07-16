datasetInput5_1a <- reactive({
  req(input$type5_1, input$dataset)
  switch(input$dataset,
         "Data 8.1" = data8.1,
         "Data 8.2" = data8.2,
         "Data 8.6" = data8.6,
         "Data 8.8" = data8.8,
         "Data 8.9" = data8.9,
         "Data 8.10" = data8.10,
         "Data 8.11" = data8.11,
         "Data 8.13" = data8.13,
         "Data 8.14" = data8.14,
         "Data 8.16" = data8.16,
         "Data 8.17" = data8.17,
         "Data 8.18" = data8.18,
         "Data 8.19" = data8.19,
         "Data 8.20" = data8.20,
         "Data 8.23" = data8.23,
         "Data 8.24" = data8.24,
         "Data 8.36" = data8.36)
}) 

datasetInput5_1b <- reactive({
  req(input$type5_1, input$file1)
  read.csv(input$file1$datapath,
           header = input$header,
           sep = input$sep,
           quote = input$quote)
})

data <- reactive({
  req(datasetInput5_1a, datasetInput5_1b)
  if(input$type5_1 == "user_data") {datasetInput5_1b()}
  else{datasetInput5_1a()}
})

# Select the cluster totals ------------------------------------------------
output$select_y <- renderUI({
  
  selectInput(inputId = "y",
              label = h5("Column of Cluster Totals"),
              choices = names(data()))
})

# Select the cluster sizes -------------------------------------------------
output$select_m <- renderUI({
  
  selectInput(inputId = "m",
              label = h5("Column of Cluster Sizes"),
              choices = names(data()))
})

# Select the number of clusters --------------------------------------------
output$select_N <- renderUI({
  
  numericInput(inputId = "sampsize",
               label = h5("Total Number of Clusters"),
               value = (nrow(data()) + 1))
})

# Select the number of elements --------------------------------------------
output$ifM <- renderUI({
  checkboxInput(inputId = "ifM",
                label = h5("Total Elements"),
                value = FALSE)
})

# Select the number of elements --------------------------------------------
output$selectM <- renderUI({
  req(!is.null(input$ifM))
  numericInput(inputId = "selectM",
               label = h5("Enter Total:"),
               value = (as.numeric(sum(data()[[input$m]]) + 1)), 
               min = 0, max = Inf)
})

# Multiplier ---------------------------------------------------------------
output$mult <- renderUI({
  
  numericInput(inputId = "mult",
               label = h5("Multiplier"),
               value = 2, min = 0, max = Inf)
})

# Options ------------------------------------------------------------------
output$checkrmoe <- renderUI({
  
  checkboxInput(inputId = "checkrmoe",
                label = h5("RMoE"),
                value = FALSE
  )
})

output$checkci <- renderUI({
  
  checkboxInput(inputId = "checkci",
                label = h5("Interval"),
                value = TRUE)
})

# Preview data -------------------------------------------------------------
output$view <- DT::renderDataTable({
  DT::datatable(data(), rownames = F, style = 'bootstrap') %>% 
    DT::formatStyle(columns = 1:ncol(data()), fontSize = '12pt')
})

M_value <- reactive({
  if(input$ifM) {
    input$selectM
  }
  else{
    NULL
  }
  
})

# Cluster Means and Totals -------------------------------------------------
output$test <- function() {
  
  req(input$digits, data(), input$mult)
  if(input$ifM == F) {M <- NULL}
  else {
    req(M_value())
    M <- M_value()
  }
  
  out <- cluster_mt(
    y = data()[[input$y]],
    m = data()[[input$m]],
    N = input$sampsize,
    M = M,
    mult = input$mult,
    conf_int = input$checkci,
    rmoe = input$checkrmoe,
    data_frame = TRUE)
  
  out_num <- format(round(as.data.frame(out[2:ncol(out)]), input$digits), 
                    nsmall = input$digits, scientific = F, big.mark = ",")
  out <- dplyr::bind_cols(out[1], out_num) %>% 
    knitr::kable(format = "html", align = "r") %>%
    kableExtra::kable_styling(full_width = F, font_size = 18)
  out
}