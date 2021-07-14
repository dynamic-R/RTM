# RTM

<img src="man/figures/RTMlogo.png" width="100">

A package with teaching material for Reaction-Transport modelling in **R**.

The package is created with the **learnr** package.

## Installation

```
devtools::install_github("dynamic-R/RTM", depend=TRUE)
```

### Installation on older versions of R

Package installation from Github is sometimes strict, if installation is done on an older **R** version, but some packages were created with a newer version, e.g. installation of **learnr** 
built on **R** 4.0.5  on an older **R** version, e.g. 4.0.4.

If installation fails under such circumstances, use the following 
workaround, so that the (in this case unproblematic) warnings 
will not throw an error:

```
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
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
