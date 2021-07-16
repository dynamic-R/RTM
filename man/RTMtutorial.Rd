\name{RTMtutorial}
\alias{RTMtutorial}
\alias{RTMexercise}
\alias{RTMreader}
\alias{RTMtemplate}
\title{Reaction Transport Modelling Course: tutorials, exercises, templates and readers with accessory material}
\usage{
RTMtutorial (x = c("introduction", "why", "conceptual", "massbalance",     
     "Rmodels", "largescale", "chemical", "equilibrium", "enzymatic",    
     "partitioning", "ecology", "transportProcesses", "transportFluxes", 
     "transportPorous", "transportBoundaries", "transportR"), 
     type = c("tutorial", "RMD"))
    
RTMexercise(x = c("introductionR", "conceptual", "massbalance", 
    "massbalance_ecology", "carbonCycle", "ozone", "dissolutionSi", 
    "equilibriumNH3", "equilibriumHCO3", "equilibriumOMD", "detritus", 
    "bears_salmon", "COVID", "virus", "npzd",  "plant_coexistence", 
    "crops_weed", "hyacinth_algae", "aquaculture", 
    "riverAnoxia", "Pdiagenesis", "diagenesis"), 
     type = c("HTML", "PDF", "RMD", "WORD"))  

RTMreader (x = c("events", "forcings", "observations", 
      "fitting", "visualisation", "pHprofiles", 
      "perturbation_I", "perturbation_II", 
      "interactive", "numericalR", "git_sharing_code"),
      type = c("HTML", "PDF", "RMD", "WORD"))      

RTMtemplate(x = c("rtm0D", "rtm1D", "porous1D", "porous1D_extensive", 
      "rtmEquilibrium", "npzd"))
}
\arguments{
  \item{x }{the name or the number of the tutorial, exercise or reader. When x = "?", a list of tutorials, exercises or readers will be displayed, including a short description.
  }
  \item{type }{ how the exercise or reader should be displayed. When selecting PDF, you need to have LaTeX installed. See note for RTMtutorial.
  }
}

\description{
The tutorials contain a link to the videos that introduce the theory, followed by questions/quizzes (multiple choice) and small exercises to be written in R. They can be used to test how well the theory has been understood. They also serve in preparation for the exam.

The exercises are short tasks to be completed in 2 to 4 hours. Before making the exercises, students should have prepared the theory using the tutorials.

The readers contain accessory material. They is not mandatory, but provide an extension to the tutorials, and may help to prepare for the exam.
}
\note{
RTMtutorial should best be run with type = "tutorial" (the default). 

However, for some versions of Rstudio/R/operating systems this does not work properly. The solution is to open the tutorial as an Rmd file, and then to press the button <Run Document>.

For instance, if this does not work:

RTMtutorial(1)

then try:

RTMtutorial(1, type="Rmd")

}
\details{
The tutorials, readers and exercises are created on the fly, i.e. they are stored in the package as R markdown files (extension .Rmd), and still need to be converted, so you may need to have some patience!

DO NOT try to create the reader "fitting", unless you have plenty of time!

The answers to the exercises are also stored in the package, but we did not include a public function to extract them. However, you may use the private function RTManswer to do so.
}
\examples{
\dontrun{
 RTMtutorial("largescale")
 RTMtutorial(2)
 RTMexercise("COVID")
 RTMtemplate(1)
}

RTMtutorial ("?")
RTMexercise ("?")
RTMreader ("?")
RTMtemplate ("?")
}
