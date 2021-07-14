## ----setup, include=FALSE-------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ---- message=FALSE-------------------------------------------------------------------------------
require(shiny)


## ---- message = FALSE-----------------------------------------------------------------------------
require(deSolve)


## -------------------------------------------------------------------------------------------------
default.parms <- list(
 NV   = 8e6      , # [number/m3], density of spherical silica particles (N/V)
 kp   = 1        , # [m/yr],      precipitation rate constant (assumed)
 MW   = 60.08e-3 , # [kg/mol],    silica molar weight
 rho  = 2196     , # [kg/m3],     silica density
 Ceq  = 1        , # [mol/m3],    equilibrium concentration of dissolved Si
 Cini = 0        , # [mol/m3],    initial concentration of dissolved Si
 Rini = 0.0001     # [m]          initial particle radius 
)

DissolveSilica <- function(t, state, parms) {
  with (as.list(c(state, parms)), {
    
    k2  <- 4*pi*kp * NV^(1/3) * (MW/(4/3*pi*rho))^(2/3) # modified rate constant
    Cs  <- max(0, Cs)   
    
    # mass balance equations
    dC.dt  <- -k2 * Cs^(2/3) * (C-Ceq) # dissolved silica
    dCs.dt <-  k2 * Cs^(2/3) * (C-Ceq) # solid silica (particles)
    
    return(list(c(dC.dt, dCs.dt), 
           R = ( Cs/NV * MW/(4/3*pi*rho) )^(1/3),  # Particle radius
           Ctot = C+Cs))                           # Total Si
  })
}

InitialCondition.fun <- function(parms)  # initial concentrations
  with (as.list(parms), {
    Cs.ini <-  NV* 4/3*pi*Rini^3 * rho/MW
    return(c(C=Cini, Cs=Cs.ini))  # [mol/m3])
  }) 



## -------------------------------------------------------------------------------------------------
state  <- InitialCondition.fun(default.parms)  # initial conditions
times  <- seq(from=0, to=30, by=0.1)           # time in years
Default <- ode(y=state, times=times, func=DissolveSilica, parms=default.parms)


## -------------------------------------------------------------------------------------------------
UI.Si <- shinyUI(pageWithSidebar(      # Define UI (user interfae)

  # Application title
  headerPanel("Dissolution of spherical silica particles"),

  sidebarPanel(
   sliderInput(inputId="NV",
               label = "particle density (particles/m3)",
               min = 1e6, max = 1e8, step = 1e6, value = default.parms$NV),
   sliderInput(inputId="kp",
               label = "precipitation rate constant (m/yr)",
               min = 0.1, max = 2, step = 0.01, value = default.parms$kp),
   sliderInput(inputId="Ceq",
               label = "dissolved Si equilibrium concentration (mol/m3)",
               min = 0.1, max = 3, step = 0.01, value = default.parms$Ceq),
   sliderInput(inputId="Rini",
               label = "initial particle radius (m)",
               min = 1e-6, max = 0.001, step = 1e-6, value = default.parms$Rini),
   sliderInput(inputId="Cini", 
               label = "dissolved Si initial concentration (mol/m3)",
               min = 0, max = 10, step = 0.1, value = default.parms$Cini),
   
   actionButton (inputId="resetButton",
                 label="Reset Parameters"),
    
   checkboxInput(inputId="defaultRun",
                 label=strong("Add default run"), value=TRUE),
   br()   # HTML break - note: ends without ','
  ),

  mainPanel(
      plotOutput("PlotSi"))
))


## -------------------------------------------------------------------------------------------------
Server.Si <- shinyServer(function(input, output, session) {

  # -------------------
  # the 'reset' button
  # -------------------
  observeEvent(input$resetButton, {
    updateNumericInput(session, "NV",    value = default.parms$NV)
    updateNumericInput(session, "kp",    value = default.parms$kp)
    updateNumericInput(session, "Ceq",   value = default.parms$Ceq)
    updateNumericInput(session, "Rini",  value = default.parms$Rini)
    updateNumericInput(session, "Cini",  value = default.parms$Cini)
  })

 # Get the model parameters, as defined in the UI 
  getparms <- reactive( {
    parms        <- default.parms 
    parms$NV     <- input$NV
    parms$kp     <- input$kp   
    parms$Ceq    <- input$Ceq     
    parms$Cini   <- input$Cini  
    parms$Rini   <- input$Rini  
    parms
  })

  # -------------------
  # the 'Plot' tab
  # -------------------

  output$PlotSi <- renderPlot({     # will be visible in the main panel

   parms <- getparms()                    
   state <- InitialCondition.fun(parms)
   out   <- ode(y=state, parms=parms, func=DissolveSilica, times=times)

   if (input$defaultRun) {  # the check box is true
      plot (out, Default, xlab="time (yr)", 
            main=c("dissolved Si (molSi/m3)", "solid Si (molSi/m3)", 
                   "particle radius (m)", "total Si (molSi/m3)"),
            lwd = 2, las = 1, lty = 1,
            cex.main = 1.5, cex.axis = 1.25, cex.lab = 1.25)
      legend("right", legend = c("current", "default"), 
             cex = 1.5, col = 1:2, lty = 1)
    } else  
      plot (out, xlab="time (yr)", 
            main=c("dissolved Si (molSi/m3)", "solid Si (molSi/m3)", 
                   "particle radius (m)", "total Si (molSi/m3)"),
            lwd = 2, las = 1, lty = 1,
            cex.main = 1.5, cex.axis = 1.25, cex.lab = 1.25)  
   })                             # end ouput$plot

})     # end of the definition of shinyServer

