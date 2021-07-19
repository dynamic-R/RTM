# RTM

<img src="man/figures/RTMlogo.png" width="100">

An R-package with teaching material for Reaction-Transport Modelling in **R**. The material is used in the course

- Reactive Transport Modeling in the Hydrosphere, taught at Utrecht University
- Environmental Modeling, taught at Ghent University

The package is created with the **learnr** package.

## Installation

Before installing the RTM package, make sure you have installed the following R-packages and their dependencies:

* *learnr, deSolve, rootSolve, ReacTran*;
* *devtools* (this one is required to be able to install the package from the github repository. 

To install the *RTM* package, type in the R-console:

```
devtools::install_github("dynamic-R/RTM", depend=TRUE)
```
Then, type ``require(RTM)`` to load the package in R.

## What can you do with the RTM package?

### Start a Tutorial

It is assumed that you use *Rstudio*. If you have installed the *RTM* package while running *Rstudio*, **restart** *Rstudio* and the tutorial will show up in the tab "Tutorial" (top-right panel of *Rstudio*). Select a tutorial and start

![](inst/exercises/introductionR/images/Rstudio_tutorial.png)

To see the list of all tutorials, type in the R-console

``
RTMtutorial("?")
``

To run a specific tutorial (e.g., "introduction"), type in the R-console

``
RTMtutorial("introduction")
``
or
``
RTMtutorial(1)
``

## Uninstall

To uninstall **RTM**, you can use the "Packages" tab in Rstudio. Locate the package and select the "x" button at the right margin.

To uninstall manually, use:

```
remove.packages("RTM", lib="~/R/win-library/4.1")
``` 

... given that the package was installed with default settings 
as a non-administrative user.


---
2021-07-14
