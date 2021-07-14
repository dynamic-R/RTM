# RTM

<img src="man/figures/RTMlogo.png" width="100">

An R-package with teaching material for Reaction-Transport Modelling in **R**. The material is used in the course

- Reactive Transport Modelling in the Hydrosphere, taught at Utrecht University
- Environmental Modelling, taught at Ghent University

The package is created with the **learnr** package.

## Installation

```
devtools::install_github("dynamic-R/RTM", depend=TRUE)
```

## Start of a Tutorial

Close and **restart** RStudio (!) and the tutorial will show up
in the "Tutorial" tab. Select a tutorial and start ...

![](man/figures/tutorial_tab.png)

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
