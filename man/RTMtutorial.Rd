\name{RTMtutorial}
\alias{RTMtutorial}
\alias{RTMexercise}
\alias{RTMreader}
\alias{RTMtemplate}
\title{Reaction Transport Modelling: tutorials, exercises, extra readers, templates}
\usage{
RTMtutorial(x = c("?", "introduction", "why", "conceptual", "massbalance",     
               "Rmodels", "largescale", "chemical", "equilibrium", "enzymatic", 
               "partitioning", "ecology", "transportProcesses", "transportFluxes", 
               "transportPorous", "transportBoundaries", "transportR"), 
            output = c("tutorial", "RMD"))
    
RTMexercise(x = c("?", "introductionR", "conceptual", "massbalance_chemistry",     
               "massbalance_ecology", "carbonCycle", "ozone", "dissolutionSi",              
               "equilibriumNH3", "equilibriumHCO3", "equilibriumOMD", "detritus",           
               "npzd", "crops_weed", "covid", "virus", "bears_salmon",  
               "plant_coexistence", "hyacinth_algae", "aquaculture", 
               "estuaryAnoxia", "Pdiagenesis", "diagenesis"),               
            type = c("R", "massbalance", "linearmodels", "chemistry", 
               "biogeochemistry", "epidemiology", "ecology", 
               "individualbased", "reaction_transport"),            
            output = c("HTML", "PDF", "RMD", "WORD"))

RTMreader  (x = c("?", "events", "forcings", "observations", 
               "fitting", "visualisation", "pHprofiles", 
               "perturbation_I", "perturbation_II", 
               "interactive", "numericalR", "git_sharing_code"),
            output = c("HTML", "PDF", "RMD", "WORD"))      

RTMtemplate(x = c("?", "rtm0D", "rtm1D", "porous1D", "porous1D_extensive", 
                  "rtmEquilibrium", "npzd", "rmarkdown_small"))

}
\arguments{
  \item{x }{the name, or the identification number, of the tutorial, exercise or reader. If \code{x="?"} (the default), a list of tutorials, exercises or readers is displayed, including a short description.
  }
  \item{output }{ how the exercise or reader should be displayed. You need to have LaTeX installed if you want to generate PDF output. See note below for RTMtutorial.
  }
  \item{type }{ the type of the exercise; only used when \code{x="?"}.
  }
}

\description{
Tutorials start with a short video that introduces the theory behind a specific topic, followed by questions (mostly multiple-choice) and short exercises (to be solved using R) that can be used to test how well the theory explained in the video has been understood. Students should be able to complete most tutorials in 20-30 minutes, while the more challenging tutorials may take up to 45-60 minutes to complete. 

Exercises contain more complicated problems and tasks. Their aim is to deepen the understanding of the knowledge gained in the tutorial. Thus, each exercise should be solved after completing the corresponding tutorial. Students should be able to complete the tasks from each exercise in 2-4 hours.

Readers contain accessory material. They are not mandatory for the course, but they provide useful information that helps students expand their knowledge of modelling and programming in R. 

Templates are R Markdown files with a basic skeleton of a document that merges an R-code implementing a model with an explanatory text and results of the model. They provide a convenient way to start developing a model in R. Different templates are available for dynamic box models and 1D reaction-transport models. 

All material in this package should help students prepare for the exam.
}

\note{
RTMtutorial should best be run with \code{output = "tutorial"} (the default). 

However, for some operating systems or versions of Rstudio/R, this may not work properly. In this circumstances, the work-around is to open the tutorial in the editor of Rstudio as an Rmd file, and then press the button <Run Document>.

For instance, if this does not work:

RTMtutorial(1)

then try:

RTMtutorial(1, output="Rmd")

}

\details{
Tutorials, exercises, and readers are created on the fly. That is, they are stored in the RTM package as R markdown files (extension .Rmd) and need to be converted to the output format when called from the command line. This may require extra patience.

DO NOT try to create the reader "fitting", unless you have plenty of time!

Answers to all exercises are also included in the package. However, we did not include a public function to extract them. The private function RTManswer can be used to do so.
}

\examples{
\dontrun{
 RTMtutorial("largescale")
 RTMtutorial(2)
 RTMexercise("covid")
 RTMexercise(12, output="PDF")
 RTMtemplate(1)
}

RTMtutorial ("?")
RTMexercise ("?")
RTMexercise ("?", type="ecology")
RTMexercise ("?", type=c("biogeochemistry","reaction_transport"))
RTMreader   ("?")
RTMtemplate ("?")
}
