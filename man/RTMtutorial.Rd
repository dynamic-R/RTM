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
  \item{x }{the name, or the identification number, of the tutorial, exercise, or reader. If \code{x="?"} (the default), a list of tutorials, exercises, or readers is displayed, including a short description.
  }
  \item{output }{ format of the output in which the exercise or reader should be displayed. You need to have LaTeX installed if you want to generate PDF output. See note below for RTMtutorial.
  }
  \item{type }{ the type of the exercise; only used when \code{x="?"}.
  }
}

\description{
Tutorials start with a short video that introduces the theory behind a specific topic, followed by questions (mostly multiple-choice) and short exercises that can be used to test how well the theory explained in the video has been understood. Each tutorial can be completed in 20-30 minutes, although some of them are more challenging and may take up to 45-60 minutes to complete. 

Exercises contain more complicated problems and tasks. Their aim is to deepen the understanding of the knowledge gained in the tutorial. Thus, each exercise is linked to a particular tutorial (see "More exercises" at the end of each tutorial) and should be solved after completing that tutorial. It should be possible to complete the tasks from each exercise in 2-4 hours.

Readers contain accessory material. They are not mandatory for the course, but they provide useful information that helps students expand their knowledge of modelling and programming in R. 

Templates are R Markdown files containing a basic skeleton of a document that merges an R-code implementing a model with an explanatory text and results of the model. They provide a convenient way to start developing a model in R. Different templates are available for dynamic box models and 1D reaction-transport models. 

All material in this package is designed to help students prepare for the exam.
}

\note{
RTMtutorial should best be run with \code{output = "tutorial"} (the default). 

However, for some operating systems or versions of Rstudio/R, this may not work properly. In this circumstances, the work-around is to open the tutorial in the editor of Rstudio as an Rmd file, and then press the button <Run Document>.

For instance, if the following command does not work,

RTMtutorial(1)

try this:

RTMtutorial(1, output="Rmd")

}

\details{
Tutorials, exercises, and readers are created "on the fly". That is, they are stored in the RTM package as R markdown files (extension .Rmd) and are converted to the output format from the R command line (see Usage). This conversion should typically take a few seconds.

Answers to all exercises are also included in the RTM package. They can be generated using a private function RTManswer.
}

\examples{
\dontrun{
 RTMtutorial("largescale")
 RTMtutorial(2)
 RTMexercise("covid")
 RTMexercise(12, output="PDF")
 RTMreader("events")
 RTMreader(2, output="PDF")
 RTMtemplate(1)
}

RTMtutorial ("?")
RTMexercise ("?")
RTMexercise ("?", type="ecology")
RTMexercise ("?", type=c("biogeochemistry","reaction_transport"))
RTMreader   ("?")
RTMtemplate ("?")
}
