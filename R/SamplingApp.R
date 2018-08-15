#' @title The Elementary Survey Sampling Shiny App
#' 
#' @author Eric Brist
#' 
#' @description This function runs the Elementary Survey Sampling Shiny app.
#' 
#' @param browser logical: Option to open the app in the default system browser. 
#' @param path string: Option to manually enter the directory path.
#' 
#' @usage 
#' runESS(browser = T)
#'
#' @return
#' NULL
#' 
#' @export
#'
#' @examples
#' # Runs the ESS Shiny app in the default system browser
#' runESS()
#' 
#' # Runs the ESS Shiny app in the RStudio IDE
#' runESS(browser = F)
#' 
runESS <- function(browser = T, path = NULL) {
  
  if(!is.null(path)) {
    
    appDir <- path
  }

  else {
    
    appDir <- system.file("Shiny", "ESS", package = "ShinyESS")
    
    if (appDir == "") {
      
      stop(
        
        c("Could not find directory. Try re-installing or manually enter directory path."), 
          
        call. = FALSE
      )
    }
  }
  
  shiny::runApp(appDir, display.mode = "normal", launch.browser = browser)
}
