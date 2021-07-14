## ----setup, include=FALSE-------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ---- message=FALSE-------------------------------------------------------------------------------
require(shiny)


## ---- message = FALSE-----------------------------------------------------------------------------
require(deSolve)


## -------------------------------------------------------------------------------------------------
state <- c(O = 0, NO = 1.3e8, NO2 = 5e11, O3 = 8e11)  # initial conditions

default.parms <- list(
  k3     = 1e-11,     # [/(mol/d)] 
  k2     = 1e10,      # [/d]
  k1a    = 1e-30,     # [/d] note: k1 = k1a + k1b*radiation
  k1b    = 1,         # [/(microEinst/m2/s)/d]
  sigma  = 1e11,      # [mol/d]           NO emission rate
  maxrad = 1200       # [microEinst/m2/s] maximal radiation
)

Ozone <- function(t, state, params) {
  with (as.list(c(state, params)), {

  radiation <- max(0, sin(t*2*pi))*maxrad    # radiation at time t (if time in days)

  # Rate expressions
  k1 <- k1a + k1b*radiation
  R1 <- k1*NO2
  R2 <- k2*O
  R3 <- k3*NO*O3
  
  # Mass balances [moles/day]
  dO   <-  R1 - R2
  dNO  <-  R1      - R3 + sigma
  dNO2 <- -R1      + R3
  dO3  <-       R2 - R3

  list(c(dO, dNO, dNO2, dO3), 
       radiation = radiation)
  })
}


## -------------------------------------------------------------------------------------------------
outtimes <- seq(from = 0, to = 5, length.out = 300)  # run for 5 days
Default  <- ode(y=state, parms=default.parms, func=Ozone, times=outtimes, method="vode")


## -------------------------------------------------------------------------------------------------
UI.O3 <- shinyUI(pageWithSidebar(      # Define UI (user interface)

  # Application title
  headerPanel("The ozone model"),

  sidebarPanel(
   sliderInput(inputId="k3", 
               label = "log(k3): rate constant of reaction 3 (NO+O3 -> NO2 + O2)",
               min = -13, max = -9, step = 0.1, value = log10(default.parms$k3)),
   sliderInput(inputId="k2", 
               label = "log(k2): rate constant of reaction 2 (O+O2 -> O3)",
               min = 8, max = 12, step = 0.1, value = log10(default.parms$k2)),
   sliderInput(inputId="k1b", 
               label = "k1b: light-dependency of reaction 1 (NO2 -> NO + O)",
               min = 0, max = 5, step = 0.01, value = default.parms$k1b),
   sliderInput(inputId="sigma", 
               label = "log(signa): NO emission rate", 
               min = 0, max = 12, step = 0.1, value = log10(default.parms$sigma)),
   sliderInput(inputId="maxrad", 
               label = "maximal radiation",
               min = 0, max = 5000, value = default.parms$maxrad),
   
   actionButton (inputId="resetButton",
                 label="Reset Parameters"),
    
   checkboxInput(inputId="defaultRun",
                 label=strong("Add default run"), value=TRUE),
   br()   # HTML break - note: ends without ','
  ),

  mainPanel(
      plotOutput("PlotOzone"))
))


## -------------------------------------------------------------------------------------------------
Server.O3 <- shinyServer(function(input, output, session) {

  # -------------------
  # the 'reset' button
  # -------------------
  observeEvent(input$resetButton, {
    updateNumericInput(session, "k3",     value = log10(default.parms$k3))
    updateNumericInput(session, "k2",     value = log10(default.parms$k2))
    updateNumericInput(session, "k1b",    value =       default.parms$k1b)
    updateNumericInput(session, "sigma",  value = log10(default.parms$sigma))
    updateNumericInput(session, "maxrad", value =       default.parms$maxrad)
  })

 # Get the model parameters, as defined in the UI 
  getparms <- reactive( {
    parms        <- default.parms 
    parms$k3     <- 10^input$k3
    parms$k2     <- 10^input$k2   
    parms$k1b    <- input$k1b     
    parms$sigma  <- 10^input$sigma  
    parms$maxrad <- input$maxrad
    parms
  })

  # -------------------
  # the 'Plot' tab
  # -------------------

  output$PlotOzone <- renderPlot({     # will be visible in the main panel

   parms <- getparms() # Model parameters, as defined in the UI
   out   <- ode(y=state, parms=parms, func=Ozone, times=outtimes, method="vode")

   if (input$defaultRun) {  # the check box is true
      plot (out, Default, lwd = 2, las = 1, lty = 1,
            cex.main = 1.5, cex.axis = 1.25, cex.lab = 1.25)
      plot.new()
      legend("topleft", legend = c("current", "default"), 
             cex = 1.5, col = 1:2, lty = 1)
    } else  
      plot (out, lwd = 2, las = 1, lty = 1,
            cex.main = 1.5, cex.axis = 1.25, cex.lab = 1.25)  
   })                             # end ouput$plot

})     # end of the definition of shinyServer


## -------------------------------------------------------------------------------------------------


