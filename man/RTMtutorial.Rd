\name{RTMtutorial}
\alias{RTMtutorial}
\alias{RTMexercise}
\alias{RTManswer}
\alias{RTMreader}
\alias{RTMtemplate}
\alias{RTMreport}
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
               "estuaryAnoxia", "Pdiagenesis", "diagenesis",
               "evaporation", "O18exchange"),               
            type = c("R", "massbalance", "linearmodels", "chemistry", 
               "biogeochemistry", "epidemiology", "ecology", 
               "individualbased", "reaction_transport", "isotopes"),
            output = c("HTML", "PDF", "RMD", "WORD"))
            
RTManswer(x, output = c("HTML", "PDF", "RMD", "WORD"))

RTMreader(x = c("?", "events", "forcings", "observations", 
               "fitting", "visualisation", "pHprofiles", 
               "perturbation_I", "perturbation_II", 
               "interactive", "interactive2", "interactive_1D",
               "numericalR", "git_sharing_code"),
            output = c("HTML", "PDF", "RMD", "WORD"))

RTMtemplate(x = c("?", "rtm0D", "rtm1D", "porous1D", "porous1D_extensive", 
                  "rtmEquilibrium", "npzd", "rmarkdown_small"))
                  
RTMreport(dest_folder = path_to_destination_folder)

}

\arguments{
  \item{x }{the name, or the identification number, of the tutorial, exercise, or reader. If \code{x="?"} (the default), a list of tutorials, exercises, or readers is displayed, including a short description.
  }
  \item{output }{ format of the output in which the exercise or reader should be displayed (HTML by default). You need to have LaTeX installed if you want to generate PDF output. See note below for RTMtutorial.
  }
  \item{type }{ the type of the exercise; only used when \code{x="?"}.
  }
  \item{dest_folder }{ destination folder where the report template files will be copied.
  }
}

\description{
\code{Tutorials} start with a short video that introduces the theory behind a specific topic, followed by questions (mostly multiple-choice) and short exercises that can be used to test how well the theory explained in the video has been understood. Each tutorial can be completed in 20-30 minutes, although some of them are more challenging and may take up to 45-60 minutes to complete. 

\code{Exercises} contain more complicated problems and tasks. Their aim is to deepen the understanding of the knowledge gained in the tutorial. Thus, each exercise is linked to a particular tutorial (see "More exercises" at the end of each tutorial) and should be solved after completing that tutorial. It should be possible to complete the tasks from each exercise in 2-4 hours.

\code{Readers} contain accessory material. They are not mandatory for the course, but they provide useful information that helps students expand their knowledge of modelling and programming in R. For example, they explain how to visualize data, fit data, develop interactive applications, etc. 

\code{Templates} are R Markdown files containing a basic skeleton of a document that merges an R-code implementing a model with an explanatory text and results of the model. They provide a convenient way to start developing a model in R. Different templates are available for dynamic box models and 1D reaction-transport models. Templates that can be used for writing a report are also available.

\code{Answers}: Each exercise comes with a possible answer. You will achieve the best learning outcomes if you solve each exercise *on your own*. Thus, checking the answers too early is *not* recommended. However, if you feel that you are stuck, or if you want to compare your solution to the one developed by us, our solutions are provided and you are welcome to view them.

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
Tutorials, exercises, readers, and answers to exercises, are created "on the fly". That is, they are stored in the RTM package as R markdown files (extension .Rmd) and are converted to the output format from the R command line (see Usage). This conversion should typically take a few seconds.
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
 RTManswer("ozone")
}

RTMtutorial ("?")
RTMexercise ("?")
RTMexercise ("?", type="ecology")
RTMexercise ("?", type=c("biogeochemistry","reaction_transport"))
RTMreader   ("?")
RTMtemplate ("?")
RTManswer   ("?")
}