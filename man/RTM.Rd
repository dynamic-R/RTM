\name{RTM-package}
\alias{RTM}
\title{Reaction Transport Modelling - teaching material}
\description{
This package contains material for teaching reaction-transport modelling in R. The material is used in the course "Reaction Transport Modelling in the Hydrosphere" taught at Utrecht University.

Tutors: Lubos Polerecky and Karline Soetaert

The package contains tutorials, exercises, extra readers, and Rmd template files for writing reaction-transport models. 

Available functions: \link{RTMtutorial}, RTMexercise, RTMreader, RTMtemplate, RTManswer, RTMreport
}

\examples{
# To list all available tutorials:
RTMtutorial("?")

# To list all available exercises:
RTMexercise("?")

# To list available readers with extra material:
RTMreader("?")

# To list available templates:
RTMtemplate("?")

# To copy report templates to a destination_folder:
RTMreport(dest_folder = path_to_destination_folder)
}
