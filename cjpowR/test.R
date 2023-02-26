library(cjpowR)
library(data.table)
library(tictoc)

input <- vector("numeric")
input$power_single_n_calc_amcie = 0.8
input$delta3_single_n_calc_amcie = 0.05
input$alpha_single_n_calc_amcie = 0.05
input$levels1_single_n_calc_amcie = 2
input$levels2_single_n_calc_amcie = 2
input$p00_single_n_calc_amcie = 0.25
input$p01_single_n_calc_amcie  = 0.25


cjpowr_amcie(power = input$power_single_n_calc_amcie, 
delta3 = input$delta3_single_n_calc_amcie, 
alpha = input$alpha_single_n_calc_amcie, 
levels1 = input$levels1_single_n_calc_amcie, 
levels2 = input$levels2_single_n_calc_amcie, 
p00 = input$p00_single_n_calc_amcie, 
p10 = input$p00_single_n_calc_amcie, 
p01 = input$p01_single_n_calc_amcie, 
p11 = input$p01_single_n_calc_amcie)