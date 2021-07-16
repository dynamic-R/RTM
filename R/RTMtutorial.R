
openRmdFile <- function(file, type) {
  
  if (type == "RMD"){
    output_file <- tempfile(fileext = ".Rmd")
    file.copy(file, output_file)
    browseURL(output_file)
  }
  else if (type == "PDF")
    browseURL(rmarkdown::render(input = file, output_format = "pdf_document",
                                output_file=tempfile(fileext = ".pdf")))
  else if (type == "HTML")
    browseURL(rmarkdown::render(input = file, output_format = "html_document",
                                output_file=tempfile(fileext = ".html")))
  else if (type == "WORD")
    browseURL(rmarkdown::render(input = file, output_format = "word_document",
                                output_file=tempfile(fileext = ".doc")))
}



RTMtutorial <- function(x = c("introduction", "why", "conceptual", "massbalance", "Rmodels",
    "largescale","chemical", "equilibrium", "enzymatic", "partitioning", "ecology",
    "transportProcesses","transportFluxes", "transportPorous",
    "transportBoundaries", "transportR"), type = c("tutorial", "RMD")) {

  LL <- as.character(formals(RTMtutorial)$x[-1])
  type <- match.arg(toupper(type), choices=toupper(c("tutorial", "RMD")))
  
  if (x == "?") {
    tutorial <- data.frame(x=LL, description = c("About the course at Utrecht",
      "Why modelling is useful", "Making conceptual models",
      "Creating mass balance equations", 
      "Dynamic modelling in the R language",
      "Large-scale models (e.g. earth's C-cycle)",
      "Elementary chemical reactions", 
      "Equilibrium (reversible) chemical reactions", 
      "Enzymatic reactions",
      "Chemical reactions partitioning between phases", "Ecological reactions",
      "The general transport equation", "Advection and diffusion/dispersion",
      "Reaction transport in porous media", "Boundary conditions in transport models",
      "Modelling Reaction tranport in porous media in R"))
    return(tutorial)
  } else {
   if (is.character(x)){
     num <- pmatch(tolower(x), tolower(LL))
     Which <- LL[num]
   } else{
     num <-x
     Which <- LL[x]
   }
  x <- ifelse(num<10, paste("0",as.character(num),sep=""), as.character(num))
  if (type == "tutorial"){
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
    openRmdFile(file, "Rmd")
  }
  }
}


RTMexercise <- function(x = c("introductionR", "conceptual", "massbalance", "massbalance_ecology",
    "carbonCycle", "ozone", "dissolutionSi", "equilibriumNH3", "equilibriumHCO3",
    "equilibriumOMD", "detritus", "COVID", "virus", "npzd",  "plant_coexistence", 
    "crops_weed", "hyacinth_algae",
    "riverAnoxia", "Pdiagenesis", "diagenesis"), 
    type = c("HTML", "PDF", "RMD", "WORD")) {

  LL <- as.character(formals(RTMexercise)$x[-1])
  type <- match.arg(toupper(type), choices=c("HTML", "PDF", "RMD", "WORD"))

  if (x == "?") {
    exercise <- data.frame(x=LL, description = c("Learning R for modellers",
      "Translating problems into a conceptual scheme", 
      "Creating mass balance equations", 
      "Creating mass balance equations in ecology", 
      "An earth-system box model of the C-cycle",
      "Ozone dynamics in the troposphere", 
      "Dissolution kinetics of Si particles",
      "Equilibrium chemistry - ammonium/ammonia", 
      "Equilibrium chemistry - the carbonate system", 
      "Equilibrium chemistry - impact of mineralisation on pH", 
      "Bacterial decay of detritus (biogeochemistry)",
      "The COVID pandemic (population dynamics)", 
      "Virus dynamics in the ocean",
      "NPZD model (marine ecosystem model)",
      "Competition and coexistence of plants in grasslands",
      "Crops and weed competition (agriculture-economics)",
      "Competition between floating plants and algae in a lake",
      "Anoxia in an estuary (1-D reaction transport model)",    
      "Simple phosphorus diagenesis in marine sediments",
      "Complex diagenesis in marine sediments (C, N, O2, S)"
      ))
    return(exercise)
  } else {
   if (is.character(x))
     Which <- LL[pmatch(tolower(x), tolower(LL))]
   else
     Which <- LL[x]
   Which <- paste(Which, "/", Which,"_Q", sep="")

  # The files are stored in RMD format 
   RMD <- paste0(system.file('exercises', package = 'RTM'),"/",Which, ".Rmd", sep="")
   
   if (length(RMD) > 1) {
     for (file in RMD) openRmdFile(file, type)
   } else openRmdFile(RMD, type)
  }   
}

# A private function - to be used as RTM:::RTManswer
RTManswer <- function(x = c("introductionR", "conceptual", "massbalance",
    "carbonCycle", "ozone", "dissolutionSi", "equilibriumNH3", "equilibriumHCO3",
    "equilibriumOMD", "detritus", "COVID", "npzd", "crops_weed", 
    "estuaryAnoxia", "Pdiagenesis", "diagenesis"), 
    type = c("HTML", "PDF", "RMD", "WORD")) {

  LL <- as.character(formals(RTMexercise)$x[-1])
  type <- match.arg(toupper(type), choices=c("HTML", "PDF", "RMD", "WORD"))

  if (x == "?") {
    return(RTMexercise("?"))
  } else {
   if (is.character(x))
     Which <- LL[pmatch(tolower(x), tolower(LL))]
   else
     Which <- LL[x]
   Which <- paste(Which, "/", Which, sep="")  # THIS DIFFERS FROM RTMexercise

  # The files are stored in RMD format 
   RMD <- paste0(system.file('exercises', package = 'RTM'),"/",Which, ".Rmd", sep="")
   
   if (length(RMD) > 1) {
     for (file in RMD) openRmdFile(file, type)
   } else openRmdFile(RMD, type)
  }   
}

RTMreader <- function(x = c("events", "forcings", "observations",
    "fitting", "visualisation", "pHprofiles", 
    "perturbation_I", "perturbation_II",
    "interactive", "numericalR", "git_sharing_code"), 
    type = c("HTML", "PDF", "RMD", "WORD")) {

  LL <- as.character(formals(RTMreader)$x[-1])
  type <- match.arg(toupper(type), choices=c("HTML", "PDF", "RMD", "WORD"))
  
  if (x == "?") {
    goodies <- data.frame(x=LL, description = c(
      "Events in dynamic models developed in R",
      "Forcing functions based on data in models developed in R", 
      "Showing observed data alongside model results in R", 
      "Fitting a 1D reaction-transport model to data in R",
      "Visualising outputs from a 1D reaction-transport model in R", 
      "Estimating pH in a 1D reaction-transport model in R",
      "Response of systems to a perturbation from equilibrium - Part I", 
      "Response of systems to a perturbation from equilibrium - Part II", 
      "Interactive applications in R", 
      "Numerical methods used for reaction-transport modelling in R", 
      "Git, GitLab/Github and RStudio - sharing code with the world"
      ))
    return(goodies)
  } else {
   if (is.character(x))
     Which <- LL[pmatch(tolower(x), tolower(LL))]
   else
     Which <- LL[x]
#   Which <- paste("_", Which, sep="")
   
  # The files are stored in RMD format 
   RMD <- paste0(system.file('readers', package = 'RTM'),"/",Which, ".Rmd", sep="")
   
   if (length(RMD) > 1) {
     for (file in RMD) openRmdFile(file, type)
   } else openRmdFile(RMD, type)
  }   
}

RTMtemplate <- function(x = c("rtm0D", "rtm1D", "porous1D", "porous1D_extensive", 
                              "rtmEquilibrium", "npzd")) {
  
  LL <- as.character(formals(RTMtemplate)$x[-1])
  if (length(x) > 1) 
     stop("only one template can be opened at a time - select one (number inbetween 1,", length(LL), ")")
  if (x == "?") {
    template <- data.frame(x=LL, description = 
                             c("Template for dynamic model in 0D",
                               "Template for dynamic reaction-transport model in 1D",
                               "Template for dynamic reaction-transport model in 1D in porous media", 
                               "Template for dynamic reaction-transport model in 1D in porous media (with text)",
                               "Template for equilibrium chemical model",
                               "Template to be used for the NPZD exercise"))
    return(template)
  } else {
    if (is.character(x))
      Which <- LL[pmatch(tolower(x), tolower(LL))]
    else
      Which <- LL[x]
    
    file <- paste0(system.file('rmarkdown', package = 'RTM'),"/templates/",Which, "/skeleton/skeleton.Rmd", sep="")
    openRmdFile (file, type = "RMD")
      
  }
}
