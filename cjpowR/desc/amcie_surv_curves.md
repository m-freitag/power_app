</br>
As interaction effects are a bit more involved in terms of the parameters that need to be passed, the present version of this shiny app
does not provide a GUI for plotting interactive interaction effect plots. 

Users are hence referred to using the [{cjpowR}](https://github.com/m-freitag/cjpowR/tree/v1.0.2) R-package.

```
if(!require(devtools)) install.packages("devtools")
library(devtools)
devtools::install_github("m-freitag/cjpowR")
if(!require(plotly)) install.packages("plotly")
library(plotly)
```

Tweak the following code snippet to your needs in order to create interactive interaction plots:

```
library(cjpowR)
#Generating an interactive plot for type M error:

d <- expand.grid(
    delta3 = c(0.01, 0.02, 0.03, 0.05), 
    n = seq(from = 100, to = 50000, length.out = 1000), # set power power if minimum required effective sample size is of interest 
    delta0 = 0.5, 
    delta1 = 0,
    alpha = 0.05,
    levels1 = 2, 
    levels2 = 2,
    p00 = 0.25, p10 = 0.25, p01 = 0.25, p11 = 0.25,
    sims = 100000 # set to 0 if Type-M-Error is not of interest
    )

df <- list2DF(do.call(cjpowr_amcie, d))

plot_ly(df, x = ~n, y = ~exp_typeM, type = 'scatter', mode = 'lines', linetype = ~delta3) %>% # change according to your needs
 layout(
   xaxis = list(title = "Effective Sample Size",
                zeroline = F,
                hoverformat = '.0f'),
   yaxis = list(title = "Exaggeration Ratio",
                range = c(0,10),
                zeroline = F,
                hoverformat = '.2f'),
   legend=list(title=list(text='<b> AMCIE </b>')),
   hovermode = "x unified"
 )
```