
openRmdFile <- function(file, output) {
  
  if (toupper(output) == "RMD"){
    output_file <- tempfile(fileext = ".Rmd")
    file.copy(file, output_file)
#    browseURL(output_file)
    file.edit(output_file)
  }
  else if (toupper(output) == "PDF")
    browseURL(rmarkdown::render(input = file, output_format = "pdf_document",
                                output_file=tempfile(fileext = ".pdf")))
  else if (toupper(output) == "HTML")
    browseURL(rmarkdown::render(input = file, output_format = "html_document",
                                output_file=tempfile(fileext = ".html")))
  else if (toupper(output) == "WORD")
    browseURL(rmarkdown::render(input = file, output_format = "word_document",
                                output_file=tempfile(fileext = ".doc")))
}


RTMtutorial <- function(x = c("?", 
                              "introduction", 
                              "why", 
                              "conceptual", 
                              "massbalance", 
                              "Rmodels",
                              "largescale", 
                              "chemical", 
                              "equilibrium", 
                              "enzymatic", 
                              "partitioning", 
                              "ecology",
                              "transportProcesses", 
                              "transportFluxes", 
                              "transportPorous",
                              "transportBoundaries", 
                              "transportR"), 
                        output = c("tutorial", "RMD")) {

  LL     <- as.character(formals(RTMtutorial)$x[-(1:2)])
  output <- match.arg(toupper(output), choices=toupper(c("tutorial", "RMD")))

  if (x[1] == "?") {
    tutorial <- data.frame(x=LL, description = 
    c("About the modelling course at Utrecht University",
      "Why is modelling useful?", 
      "Making conceptual models",
      "Creating mass balance equations", 
      "Dynamic modelling in the R language",
      "Large-scale models (e.g. System-Earth's carbon cycle)",
      "Elementary chemical reactions", 
      "Equilibrium (reversible) chemical reactions", 
      "Enzymatic reactions",
      "Partitioning between phases", 
      "Ecological interactions",
      "The general reaction-transport equation", 
      "Transport fluxes due to advection and diffusion/dispersion",
      "Reaction-transport in porous media", 
      "Boundary conditions in teaction-transport models",
      "Implementation of reaction-tranport models in R"))
    return(tutorial)
  } else {

    if (is.character(x)){
      num   <- pmatch(tolower(x), tolower(LL))[1]
      Which <- LL[num]
    } else {
      num   <- x
      Which <- LL[x]
    }
    x <- ifelse(num<10, paste("0", as.character(num), sep=""), as.character(num))
    if (output == "TUTORIAL"){
     Which <- paste(x, Which, sep="")
     if (length(Which) > 1)
      for (w in Which) 
       run_tutorial(w, package = "RTM")
    else
    run_tutorial(Which, package = "RTM")
  } else { # open the Rmd File
    if (length(Which) > 1) stop("Can open only one Rmd file at a time")
    dir <- paste(x, Which, sep="")
    file <- paste0(system.file('tutorials', package = 'RTM'),"/",dir, "/", Which, ".Rmd", sep="")
    openRmdFile(file, "RMD")
  }
  }
}

RTMexercise <- function(x = c("?",
    "introductionR", "conceptual", "massbalance_chemistry", 
    "massbalance_ecology", "carbonCycle", "ozone", 
    "dissolutionSi", "equilibriumNH3", "equilibriumHCO3",
    "equilibriumOMD", "detritus", "npzd",  "crops_weed", 
    "covid", "virus", "bears_salmon", "plant_coexistence", 
    "hyacinth_algae", "aquaculture", "riverAnoxia", 
    "Pdiagenesis", "diagenesis"), 
    type=c("massbalance", "linearmodels", "chemistry", 
           "biogeochemistry", "epidemiology", "ecology", 
           "individualbased", "reaction_transport"),
            output = c("HTML", "PDF", "RMD", "WORD"))
RTMexerciseFULL(x=x, type=type, output=output, sub="_Q")

# A private function - to be used as RTM:::RTManswer: prints question+answer
RTManswer <- function(x, output) 
  RTMexerciseFULL(x=x, output=output, sub="")

RTMexerciseFULL <- function(x = c("?",
                              "introductionR", 
                              "conceptual", 
                              "massbalance_chemistry", 
                              "massbalance_ecology",
                              "carbonCycle", 
                              "ozone", 
                              "dissolutionSi", 
                              "equilibriumNH3", 
                              "equilibriumHCO3",
                              "equilibriumOMD", 
                              "detritus",
                              "npzd",  
                              "crops_weed", 
                              "covid", 
                              "virus", 
                              "bears_salmon", 
                              "plant_coexistence", 
                              "hyacinth_algae", 
                              "aquaculture", 
                              "riverAnoxia", 
                              "Pdiagenesis", 
                              "diagenesis"), 
                            type=c("massbalance", "linearmodels", "chemistry", 
                            "biogeochemistry", "epidemiology", "ecology", 
                            "individualbased", "reaction_transport"),
                            output = c("HTML", "PDF", "RMD", "WORD"), sub="") {

  LL <- as.character(formals(RTMexercise)$x[-(1:2)])
  output <- match.arg(toupper(output), choices=c("HTML", "PDF", "RMD", "WORD"))
  subdirectory<- c("R", 
                  rep("massbalance", times=3),
                  "linearmodels", 
                  rep("chemistry", times=5),
                  rep("biogeochemistry", times=3),
                  rep("epidemiology", times=2),
                  rep("ecology", times=3),
                  "individualbased",
                  rep("reaction_transport", times=3))
    exercise <- data.frame(x=LL, description = 
    c("Introduction to R for modellers",
      "Translating problems into a conceptual diagram", 
      "Creating mass balance equations in chemistry", 
      "Creating mass balance equations in ecology", 
      "An Earth-system box model of the carbon cycle",
      "Ozone dynamics in the troposphere", 
      "Dissolution kinetics of Si particles",
      "Equilibrium chemistry - ammonium/ammonia", 
      "Equilibrium chemistry - the carbonate system", 
      "Equilibrium chemistry - impact of mineralisation on pH", 
      "Bacterial decay of detritus",
      "nutrients, phytoplankton, zooplankton, detritus",
      "Crops and weed competition for nutrients",
      "The COVID pandemic (population dynamics)", 
      "Virus dynamics in the ocean",
      "Foodweb model comprising bears, salmon and scavengers",
      "Competition and coexistence of plants in grasslands",
      "Competition between floating plants and algae",
      "Model of scallop aquaculture, including economics",
      "Anoxia in an estuary (1-D model)",    
      "Simple phosphorus diagenesis in marine sediments (1D)",
      "Complex diagenesis in marine sediments (C,N,O2,S)"
      ),type=subdirectory)
  if (x[1] == "?") {
      return(exercise[exercise$type %in% type,])
  } else {
   if (is.character(x)){
     num   <- pmatch(tolower(x), tolower(LL))[1]
     Which <- LL[num]
     Dir <- subdirectory[num]
   }else { # a number
     Which <- LL[x]
     Dir <- subdirectory[x]
   }
    Which <- paste(Dir, "/", Which, "/", Which, sub, sep="")

  # The files are stored in RMD format 
   RMD <- paste0(system.file('exercises', package = 'RTM'), "/", Which, ".Rmd", sep="")
   
   if (length(RMD) > 1) {
     for (file in RMD) openRmdFile(file, output)
   } else openRmdFile(RMD, output)
  }   
}

RTMreader <- function(x = c("?", "events", 
                            "forcings", 
                            "observations",
                            "fitting", 
                            "visualisation", 
                            "pHprofiles", 
                            "perturbation_I",
                            "perturbation_II",
                            "interactive", 
                            "numericalR", 
                            "git_sharing_code"), 
                      output = c("HTML", "PDF", "RMD", "WORD")) {

  LL <- as.character(formals(RTMreader)$x[-(1:2)])
  output <- match.arg(toupper(output), choices=c("HTML", "PDF", "RMD", "WORD"))
  
  if (x[1] == "?") {
    goodies <- data.frame(x=LL, description = c(
      "Events in dynamic models developed in R",
      "Forcing functions based on data in models developed in R", 
      "Showing observed data alongside model results in R", 
      "Fitting a 1D reaction-transport model to data in R",
      "Visualising outputs from a 1D reaction-transport model in R", 
      "Estimating pH in a 1D reaction-transport model in R",
      "Response of systems to a perturbation from equilibrium - Part I", 
      "Response of systems to a perturbation from equilibrium - Part II", 
      "Developing interactive applications in R", 
      "Numerical methods used for reaction-transport modelling in R", 
      "Sharing code with the world via Git in RStudio"
      ))
    return(goodies)
  } else {
   if (is.character(x))
     Which <- LL[pmatch(tolower(x), tolower(LL))[1]]
   else
     Which <- LL[x]
#   Which <- paste("_", Which, sep="")
   
  # The files are stored in RMD format 
   RMD <- paste0(system.file('readers', package = 'RTM'), "/", Which, ".Rmd", sep="")
   
   if (length(RMD) > 1) {
     for (file in RMD) openRmdFile(file, output)
   } else openRmdFile(RMD, output)
  }   
}



RTMtemplate <- function(x = c("?", "rtm0D", "rtm1D", "porous1D", "porous1D_extensive", 
                              "rtmEquilibrium", "npzd", "rmarkdown_small")) {
  
  LL <- as.character(formals(RTMtemplate)$x[-(1:2)])
  if (length(x) > 1) 
     stop("only one template can be opened at a time - select one (number between 1,", length(LL), ")")
  if (x[1] == "?") {
    template <- data.frame(x=LL, description = 
                             c("Template for models in 0D",
                               "Template for reaction-transport models in 1D",
                               "Template for reaction-transport models in porous media in 1D",
                               "Template for reaction-transport models in porous media in 1D (with text)",
                               "Template for local equilibrium chemistry model",
                               "Template to be used for the NPZD exercise",
                               "Template to be used for the introductionR exercise"))
    return(template)
  } else {
    if (is.character(x))
      Which <- LL[pmatch(tolower(x), tolower(LL))[1]]
    else
      Which <- LL[x]
    
    file <- paste0(system.file('rmarkdown', package = 'RTM'), "/templates/",
                   Which, "/skeleton/skeleton.Rmd", sep="")
    openRmdFile (file, output = "RMD")
      
  }
}
