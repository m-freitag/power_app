library(shiny)
library(bslib)
library(tidyverse)
library(here)
library(cjpowR)
library(plotly)
library(shinycssloaders)
library(stringr)
library(shinyWidgets)
library(shinydashboard)
library(colorspace)
library(purrr)
library(htmltools)

dir.create("~/.fonts")
file.copy("cjpowR/www/quicksand-v24-latin-regular.ttf", "~/.fonts")
system("fc-cache -f ~/.fonts")


cjpowr_theme <- bs_theme(
    version = 5,
    bg = "#f1ede8",
    fg = "#425664",
    primary = "#425664",
    secondary = "#425664",
    success = "#47935e",
    info = "#8acded",
    warning = "#ddcc77",
    danger = "#cc6677",
    base_font = font_google("Quicksand"),
    code_font = font_google("JetBrains Mono"),
    heading_font = font_google("Quicksand")
) %>%
    bs_add_rules(sass::sass_file("custom.scss"))

colorspace::sequential_hcl(n = 7, h = c(270, -40), c = c(35, 75, 35), l = c(12, 88), power = c(0.6, 1.1), register = "Custom-Palette")

plex <- theme_light() +
    theme(
        text = element_text(colour = "#425664", size = 12, family = "Quicksand"),
        plot.title = element_text(colour = "#425664"),
        plot.subtitle = element_text(colour = "#425664"),
        plot.background = element_rect(fill = "#f1ede8", color = "#f1ede8"),
        panel.background = element_rect(fill = "#f1ede8", color = "#f1ede8"),
        panel.border = element_blank(),
        axis.text = element_text(colour = "#425664", size = 12),
        axis.title = element_text(colour = "#425664", size = 12),
        axis.ticks = element_blank(),
        legend.key = element_rect(fill = "#f1ede8"),
        legend.background = element_rect(fill = "#f1ede8", color = "#f1ede8"),
        legend.title = element_blank(),
        plot.margin = unit(c(0, 0, 0, 3), "cm")
    )


ui <- navbarPage(
    title = div("", img(src = "cjpowR_hex.png", id = "simulation", height = "100px", width = "90px", style = "position: relative; margin: 0px 20px -55px 0px; display:right-align;")),
    theme = cjpowr_theme,
    windowTitle = "cjpowR",
    id = "nav",
    fluid = FALSE,
    collapsible = TRUE,
        # First Tab Panel  
        tabPanel("AMCE", withMathJax(), tags$div(class = "container", style= "margin-top: 40px;",
                tabsetPanel(id="tabs",
                    tabPanel("CalculatoR", 
                        fluidRow(
                            column(width = 4, style='padding:20px;',
                                source(file = "ui_amce_calculator.R", local = TRUE)$value
                            ),
                            column(
                                width = 4, style = "padding:20px;", wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
                                    infoBoxOutput("amce_calc"),
                                    conditionalPanel(
                                        condition = "input.tbd_calc == 'Power'",
                                        HTML("</br>"),
                                        infoBoxOutput("amce_calc_s"),
                                        HTML("</br>"),
                                        infoBoxOutput("amce_calc_m")
                                    )
                                )),
                                column(width = 4, style = "padding:20px;", wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
                                    tags$div(
                                        class = "header", style = "text-align: left; margin-top: 10px; margin-bottom: 5px;",
                                        tags$h4("Things to consider...")
                                    ),
                                    source(file = "desc/amce_calc_desc.R", local = TRUE)$value
                                ))
                        )
                    ),
                    tabPanel("Power Curves",
                    fluidRow(
                        column(width = 4, style='padding:20px;',
                            source(file = "ui_amce_curve.R", local = TRUE)$value
                        ),
                        column(width = 8, style = "padding:20px;", wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
                            conditionalPanel(condition = "input.tbd == 'Effective N'", 
                            tags$h4(style="margin-top: 0rem;", "Minimum Required Effective Sample Size Curves",
                            tags$link(rel = "stylesheet", type = "text/css", href = "font-awesome-4.7.0/css/font-awesome.css"),
                            HTML(
                                    '<div class="popover popover-right">
                                    <button type="button" class="btn btn-circle" style="border-top-width: 0px;padding-top: 0px;padding-bottom: 0px;border-bottom-width: 0px;margin-bottom: 30px;margin-left: -20px;">
                                    <span class="fa fa-info-circle"></span>&nbsp;
                                    </button>
                                    <div class="popover-container">
                                        <div class="card">
                                        <div class="card-header">
                                            Note
                                        </div>
                                        <div class="card-body">
                                        \\(N_\\text{effective}:=\\) the number of respondents  \\(\\times\\) the number of individually assessed profiles \\(\\times\\) the number of tasks.
                                        </div>
                                        </div>
                                    </div>
                                   </div>') 
                            )),
                            conditionalPanel(
                                condition = "input.tbd == 'Power'",
                                tags$h4(style = "margin-top: 0rem;", "Power Curves")
                            ),
                            conditionalPanel(
                                condition = "input.tbd == 'Type S Error'",
                                tags$h4(style = "margin-top: 0rem;", "Type S Error Curves")
                            ),
                            conditionalPanel(
                                condition = "input.tbd == 'Type M Error'",
                                tags$h4(style = "margin-top: 0rem;", "Type M Error Curves")
                            ),
                            shinycssloaders::withSpinner(plotlyOutput(outputId = "amce_plot", height = 500),
                                type = 3, color = "#425664", size = 1, color.background = "#f1ede8"
                            )
                        ))
                    )
                    )
                )    
        )),
        tabPanel("(Causal) Interactions", withMathJax(), tags$div(class = "container", style= "margin-top: 40px;",
                tabsetPanel(id="tabs",
                    tabPanel("CalculatoR", 
                        fluidRow(
                            column(width = 4, style='padding:20px;',
                                source(file = "ui_amcie_calculator.R", local = TRUE)$value
                            ),
                            column(
                                width = 4, style = "padding:20px;", wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
                                    infoBoxOutput("amcie_calc"),
                                    conditionalPanel(
                                        condition = "input.tbd_calc_amcie == 'Power'",
                                        HTML("</br>"),
                                        infoBoxOutput("amcie_calc_s"),
                                        HTML("</br>"),
                                        infoBoxOutput("amcie_calc_m")
                                    )
                                )),
                                column(width = 4, style = "padding:20px;", wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
                                    tags$div(
                                        class = "header", style = "text-align: left; margin-top: 10px; margin-bottom: 5px;",
                                        tags$h4("Things to consider...")
                                    ),
                                    source(file = "desc/amcie_calc_desc.R", local = TRUE)$value
                                ))
                        )
                    ),
                    tabPanel("Power Curves",
                    htmltools::includeMarkdown("desc/amcie_surv_curves.md")
                    )
                )    
        )),
        tabPanel(
            "About",
            fluidRow(
                column(
                    width = 2, style = "padding:20px;"
                ),
                column(width = 8, style = "padding:20px;", wellPanel(
                    tags$div(
                        class = "header", style = "text-align: center; margin-top: 10px; margin-bottom: 15px;",
                        tags$h4("About the App")
                    ),
                    HTML("<p> This shiny app provides a convenient user interface to the R package cjpowR which provides simple functions to calculate power, minimum required 
                    sample size, Type S and the expected Type M error for forced-choice conjoint experiments. The accompanying paper can be found here.
                    <br></br>
                    The app runs on the free shinyapps.io platform by RStudio and, thus, only has a limited runtime per month/users.
                    As all conditional inputs were scripted on the ui side and not within the server function, the online version of the app should run pretty smoothly.
                    If you encounter any performance issues, you can run the app locally from GitHub.
                    <br></br>
                    Please report any bugs or feature requests to the GitHub issues page.
                    <br></br>
                    Cite as:
                    <br></br>
                    Freitag, Markus and Julian Schuessler (2020). “cjpowR – A Priori Power Analyses for Conjoint Experiments,” R Package. </p>
                    ")
                )),
                column(
                    width = 2, style = "padding:20px;"
                )
            )
        ),
        tags$div(class = "container", tags$footer(HTML("<p class='pull-right'><small>&copy; Markus Freitag 2021.</small></p>"), align = "right"))
)
    

server <- function(input, output) {

    dat_amce_calc <- reactive({

    if (input$tbd_calc == "Effective N") {

    df_calc <- cjpowr_amce(power = input$power_single_n_calc, amce = input$amce_single_n_calc, alpha = input$alpha_single_n_calc, levels = input$levels_single_n_calc)

    } else if (input$tbd_calc == "Power") {
       
       df_calc <- cjpowr_amce(n = input$n_single_p_calc, amce = input$amce_single_p_calc, alpha = input$alpha_single_p_calc, levels = input$levels_single_p_calc)

    }
    })


    dat_amcie_calc <- reactive({

    if (input$tbd_calc_amcie == "Effective N") {

    df_calc <- cjpowr_amcie(power = input$power_single_n_calc_amcie, delta3 = input$delta3_single_n_calc_amcie, alpha = input$alpha_single_n_calc_amcie, levels1 = input$levels1_single_n_calc_amcie, levels2 = input$levels2_single_n_calc_amcie, p00 = input$p00_single_n_calc_amcie, p10 = input$p00_single_n_calc_amcie, p01 = input$p01_single_n_calc_amcie, p11 = input$p01_single_n_calc_amcie)

    } else if (input$tbd_calc_amcie == "Power") {
       
    df_calc <- cjpowr_amcie(n = input$n_single_p_calc_amcie,  delta3 = input$delta3_single_p_calc_amcie, alpha = input$alpha_single_p_calc_amcie, levels1 = input$levels1_single_p_calc_amcie, levels2 = input$levels2_single_p_calc_amcie, p00 = input$p00_single_p_calc_amcie, p10 = input$p00_single_p_calc_amcie, p01 = input$p01_single_p_calc_amcie, p11 = input$p01_single_p_calc_amcie)

    }
    })


    output$amce_calc <- renderInfoBox({

    if (input$tbd_calc == "Effective N") {
        dat <- dat_amce_calc()

        infoBox(
            "Minimum Required Effective Sample Size", paste(round(dat$n)),
            icon = tags$i(class = "fa fa-users")
        )
    } else if (input$tbd_calc == "Power") {

        dat <- dat_amce_calc()

        infoBox(
            "Power", paste(round(dat$power, 2)),
            icon = tags$i(class = "fa fa-plug")
        )
    }
    })

    output$amcie_calc <- renderInfoBox({

    if (input$tbd_calc_amcie == "Effective N") {
        dat_amcie <- dat_amcie_calc()

        infoBox(
            "Minimum Required Effective Sample Size", paste(round(dat_amcie$n)),
            icon = tags$i(class = "fa fa-users")
        )
    } else if (input$tbd_calc_amcie == "Power") {

        dat_amcie <- dat_amcie_calc()

        infoBox(
            "Power", paste(round(dat_amcie$power, 2)),
            icon = tags$i(class = "fa fa-plug")
        )
    }
    })

    
    output$amce_calc_s <- renderInfoBox({
          dat <- dat_amce_calc()

          infoBox(
              "Implied Type S Error", paste(signif(dat$type_s, 4)),
              icon = tags$i(class = "fa fa-times"),
          )
      
    })

    output$amce_calc_m <- renderInfoBox({
         dat <- dat_amce_calc()

         infoBox(
             "Implied Type M Error", paste(signif(dat$exp_typeM, 3)),
             icon = tags$i(class = "fa fa-times")
         )
     
    })

    output$amcie_calc_s <- renderInfoBox({
          dat_amcie <- dat_amcie_calc()

          infoBox(
              "Implied Type S Error", paste(signif(dat_amcie$type_s, 4)),
              icon = tags$i(class = "fa fa-times"),
          )
      
    })

    output$amcie_calc_m <- renderInfoBox({
         dat_amcie <- dat_amcie_calc()

         infoBox(
             "Implied Type M Error", paste(signif(dat_amcie$exp_typeM, 3)),
             icon = tags$i(class = "fa fa-times")
         )
     
    })


    output$selected_tbd <- renderText({
        paste(input$tbd)
    })

    output$selected_p_p00 <- renderText({
        paste(input$p00_single_p_calc_amcie)
    })

    output$selected_n_p00 <- renderText({
        paste(input$p00_single_n_calc_amcie)
    })

    output$selected_p_p01 <- renderText({
        paste(input$p01_single_p_calc_amcie)
    })

    output$selected_n_p01 <- renderText({
        paste(input$p01_single_n_calc_amcie)
    })

dat_amce_curve <- reactive({

    if (input$tbd == "Effective N" & input$xaxis_n != input$byaxis_n) {

        if (input$xaxis_n == "amce") {
            amce <- seq(from = input$amce_slide_n[1], to = input$amce_slide_n[2], length.out = 1000)
        } else if (input$byaxis_n == "amce") {
            amce <- seq(from = input$amce_slide_n[1], to = input$amce_slide_n[2], length.out = 5)
        } else {
            amce <- input$amce_single_n
        }

        if (input$xaxis_n == "power") {
            power <- seq(from = input$power_slide_n[1], to = input$power_slide_n[2], length.out = 1000)
        } else if (input$byaxis_n == "power") {
            power <- seq(from = input$power_slide_n[1], to = input$power_slide_n[2], length.out = 5)
        } else {
            power <- input$power_single_n
        }

        if (input$byaxis_n == "levels") {
            levels <- seq(from = input$levels_slide_n[1], to = input$levels_slide_n[2], by = 1)
        } else {
            levels <- input$levels_single_n
        }

        if (input$xaxis_n == "alpha") {
            alpha <- seq(from = input$alpha_slide_n[1], to = input$alpha_slide_n[2], length.out = 1000)
        } else if (input$byaxis_n == "alpha") {
            alpha <- seq(from = input$alpha_slide_n[1], to = input$alpha_slide_n[2], length.out = 5)
        } else {
            alpha <- input$alpha_single_n
        }

        d <- expand.grid(
            amce = amce, 
            power = power,
            alpha = alpha, 
            levels = levels,
            treat.prob = 0.5,
            sims = 0
            )

        df <- list2DF(do.call(cjpowr_amce, d))

    } else if (input$tbd == "Power" & input$xaxis_p != input$byaxis_p) {

        if (input$xaxis_p == "amce") {
            amce <- seq(from = input$amce_slide_p[1], to = input$amce_slide_p[2], length.out = 1000)
        } else if (input$byaxis_p == "amce") {
            amce <- seq(from = input$amce_slide_p[1], to = input$amce_slide_p[2], length.out = 5)
        } else {
            amce <- input$amce_single_p
        }

        if (input$xaxis_p == "n") {
            n <- seq(from = input$n_slide_p[1], to = input$n_slide_p[2], length.out = 1000)
        } else if (input$byaxis_p == "n") {
            n <- seq(from = input$n_slide_p[1], to = input$n_slide_p[2], length.out = 5)
        } else {
            n <- input$n_single_p
        }

        if (input$byaxis_p == "levels") {
            levels <- seq(from = input$levels_slide_p[1], to = input$levels_slide_p[2], by = 1)
        } else {
            levels <- input$levels_single_p
        }

        if (input$xaxis_p == "alpha") {
            alpha <- seq(from = input$alpha_slide_p[1], to = input$alpha_slide_p[2], length.out = 1000)
        } else if (input$byaxis_p == "alpha") {
            alpha <- seq(from = input$alpha_slide_p[1], to = input$alpha_slide_p[2], length.out = 5)
        } else {
            alpha <- input$alpha_single_p
        }

        d <- expand.grid(
            amce = amce, 
            n = n,
            alpha = alpha, 
            levels = levels,
            treat.prob = 0.5,
            sims = 0
            )

        df <- list2DF(do.call(cjpowr_amce, d))


    } else if (input$tbd == "Type S Error" & input$xaxis_s != input$byaxis_s) {

        if (input$xaxis_s == "amce") {
            amce <- seq(from = input$amce_slide_s[1], to = input$amce_slide_s[2], length.out = 1000)
        } else if (input$byaxis_s == "amce") {
            amce <- seq(from = input$amce_slide_s[1], to = input$amce_slide_s[2], length.out = 5)
        } else {
            amce <- input$amce_single_s
        }

        if (input$xaxis_s == "n") {
            n <- seq(from = input$n_slide_s[1], to = input$n_slide_s[2], length.out = 1000)
        } else if (input$byaxis_s == "n") {
            n <- seq(from = input$n_slide_s[1], to = input$n_slide_s[2], length.out = 5)
        } else {
            n <- input$n_single_s
        }

        if (input$byaxis_s == "levels") {
            levels <- seq(from = input$levels_slide_s[1], to = input$levels_slide_s[2], by = 1)
        } else {
            levels <- input$levels_single_s
        }

        if (input$xaxis_s == "alpha") {
            alpha <- seq(from = input$alpha_slide_s[1], to = input$alpha_slide_s[2], length.out = 1000)
        } else if (input$byaxis_s == "alpha") {
            alpha <- seq(from = input$alpha_slide_s[1], to = input$alpha_slide_s[2], length.out = 5)
        } else {
            alpha <- input$alpha_single_s
        }

        d <- expand.grid(
            amce = amce, 
            n = n,
            alpha = alpha, 
            levels = levels,
            treat.prob = 0.5,
            sims = 0
            )

        df <- list2DF(do.call(cjpowr_amce, d))


    } else if (input$tbd == "Type M Error" & input$xaxis_m != input$byaxis_m) {

        if (input$xaxis_m == "amce") {
            amce <- seq(from = input$amce_slide_m[1], to = input$amce_slide_m[2], length.out = 1000)
        } else if (input$byaxis_m == "amce") {
            amce <- seq(from = input$amce_slide_m[1], to = input$amce_slide_m[2], length.out = 5)
        } else {
            amce <- input$amce_single_m
        }

        if (input$xaxis_m == "n") {
            n <- seq(from = input$n_slide_m[1], to = input$n_slide_m[2], length.out = 1000)
        } else if (input$byaxis_m == "n") {
            n <- seq(from = input$n_slide_m[1], to = input$n_slide_m[2], length.out = 5)
        } else {
            n <- input$n_single_s
        }

        if (input$byaxis_m == "levels") {
            levels <- seq(from = input$levels_slide_m[1], to = input$levels_slide_m[2], by = 1)
        } else {
            levels <- input$levels_single_m
        }

        if (input$xaxis_m == "alpha") {
            alpha <- seq(from = input$alpha_slide_m[1], to = input$alpha_slide_m[2], length.out = 1000)
        } else if (input$byaxis_m == "alpha") {
            alpha <- seq(from = input$alpha_slide_m[1], to = input$alpha_slide_m[2], length.out = 5)
        } else {
            alpha <- input$alpha_single_m
        }

        d <- expand.grid(
            amce = amce, 
            n = n,
            alpha = alpha, 
            levels = levels,
            treat.prob = 0.5,
            sims = 1000
            )

        df <- list2DF(do.call(cjpowr_amce, d))


    }    
})

    output$amce_plot <- renderPlotly({

        if (input$tbd == "Effective N" & input$xaxis_n != input$byaxis_n) {

        
        suppressWarnings(ggplotly(
            ggplot(data = dat_amce_curve()) +
                geom_line(aes(x = eval(parse(text = input$xaxis_n)), 
                              y = n, 
                              color = fct_reorder(as.factor(eval(parse(text = input$byaxis_n))), n, .desc = TRUE),
                              group = 1,
                              text = paste0(
                                  "N: ", round(n),
                                  str_to_title(paste0("\n", input$xaxis_n, ": ")), round(eval(parse(text = input$xaxis_n)), digits = 3),
                                  str_to_title(paste0("\n", input$byaxis_n, ": ")), round(eval(parse(text = input$byaxis_n)), digits = 3)
                              )
                               )) + 
                plex + scale_color_discrete_sequential(palette = "Custom-Palette") +
                labs(
                    x = str_to_title(paste("\n", input$xaxis_n)),
                    y = ""
                ), tooltip = "text"
        )  %>% 
        add_annotations(
            text = str_to_title(paste(input$byaxis_n)), xref = "paper", yref = "paper",
            x = 1.02, xanchor = "left",
            y = 0.8, yanchor = "bottom", # Same y as legend below
            legendtitle = TRUE, showarrow = FALSE
        ) %>%
        layout(legend = list(y = 0.8, yanchor = "top")) %>%
        add_annotations(axistitle = TRUE, text = "Effective N", x = -0.05, xref = "paper", xanchor = "right", yanchor = "right", y = 0.5, yref = "paper", showarrow = FALSE) %>% 
        config(modeBarButtonsToRemove = list(
        "resetViews",
        "toggleSpikelines",
        "resetViewMapbox"
      ), displaylogo = FALSE))

        } else if (input$tbd == "Power" & input$xaxis_p != input$byaxis_p) {
            suppressWarnings(ggplotly(
                ggplot(data = dat_amce_curve()) +
                    geom_line(aes(
                        x = eval(parse(text = input$xaxis_p)),
                        y = power,
                        color = fct_reorder(as.factor(eval(parse(text = input$byaxis_p))), power, .desc = TRUE),
                        group = 1,
                        text = paste0(
                            "Power: ", round(power, 2),
                            str_to_title(paste0("\n", input$xaxis_p, ": ")), round(eval(parse(text = input$xaxis_p)), digits = 3),
                            str_to_title(paste0("\n", input$byaxis_p, ": ")), round(eval(parse(text = input$byaxis_p)), digits = 3)
                        )
                    )) +
                    plex +
                    scale_color_discrete_sequential(palette = "Custom-Palette") +
                    labs(
                        x = str_to_title(paste("\n", input$xaxis_p)),
                        y = ""
                    ),
                tooltip = "text"
            ) %>%
                add_annotations(
                    text = str_to_title(paste(input$byaxis_p)), xref = "paper", yref = "paper",
                    x = 1.02, xanchor = "left",
                    y = 0.8, yanchor = "bottom", # Same y as legend below
                    legendtitle = TRUE, showarrow = FALSE
                ) %>%
                layout(legend = list(y = 0.8, yanchor = "top")) %>%
                add_annotations(axistitle = TRUE, text = "Power", x = -0.05, xref = "paper", xanchor = "right", yanchor = "right", y = 0.5, yref = "paper", showarrow = FALSE) %>%
                config(modeBarButtonsToRemove = list(
                    "resetViews",
                    "toggleSpikelines",
                    "resetViewMapbox"
                ), displaylogo = FALSE))

        } else if (input$tbd == "Type S Error" & input$xaxis_s != input$byaxis_s) {
            
            suppressWarnings(ggplotly(
                ggplot(data = dat_amce_curve()) +
                    geom_line(aes(
                        x = eval(parse(text = input$xaxis_s)),
                        y = type_s,
                        color = fct_reorder(as.factor(eval(parse(text = input$byaxis_s))), type_s, .desc = TRUE),
                        group = 1,
                        text = paste0(
                            "Type S Error: ", round(type_s, 3),
                            str_to_title(paste0("\n", input$xaxis_s, ": ")), round(eval(parse(text = input$xaxis_s)), digits = 3),
                            str_to_title(paste0("\n", input$byaxis_s, ": ")), round(eval(parse(text = input$byaxis_s)), digits = 3)
                        )
                    )) +
                    plex +
                    scale_color_discrete_sequential(palette = "Custom-Palette") +
                    labs(
                        x = str_to_title(paste("\n", input$xaxis_s)),
                        y = ""
                    ),
                tooltip = "text"
            ) %>%
                add_annotations(
                    text = str_to_title(paste(input$byaxis_s)), xref = "paper", yref = "paper",
                    x = 1.02, xanchor = "left",
                    y = 0.8, yanchor = "bottom", # Same y as legend below
                    legendtitle = TRUE, showarrow = FALSE
                ) %>%
                layout(legend = list(y = 0.8, yanchor = "top")) %>%
                add_annotations(axistitle = TRUE, text = "Type S Error", x = -0.05, xref = "paper", xanchor = "right", yanchor = "right", y = 0.5, yref = "paper", showarrow = FALSE) %>%
                config(modeBarButtonsToRemove = list(
                    "resetViews",
                    "toggleSpikelines",
                    "resetViewMapbox"
                ), displaylogo = FALSE))

        } else if (input$tbd == "Type M Error" & input$xaxis_m != input$byaxis_m) {
            
            suppressWarnings(ggplotly(
                ggplot(data = dat_amce_curve()) +
                    geom_line(aes(
                        x = eval(parse(text = input$xaxis_m)),
                        y = exp_typeM,
                        color = fct_reorder(as.factor(eval(parse(text = input$byaxis_m))), exp_typeM, .desc = TRUE),
                        group = 1,
                        text = paste0(
                            "Type M Error: ", round(exp_typeM, 2),
                            str_to_title(paste0("\n", input$xaxis_m, ": ")), round(eval(parse(text = input$xaxis_m)), digits = 3),
                            str_to_title(paste0("\n", input$byaxis_m, ": ")), round(eval(parse(text = input$byaxis_m)), digits = 3)
                        )
                    )) +
                    plex +
                    scale_color_discrete_sequential(palette = "Custom-Palette") +
                    labs(
                        x = str_to_title(paste("\n", input$xaxis_m)),
                        y = ""
                    ),
                tooltip = "text"
            ) %>%
                add_annotations(
                    text = str_to_title(paste(input$byaxis_m)), xref = "paper", yref = "paper",
                    x = 1.02, xanchor = "left",
                    y = 0.8, yanchor = "bottom", # Same y as legend below
                    legendtitle = TRUE, showarrow = FALSE
                ) %>%
                layout(legend = list(y = 0.8, yanchor = "top")) %>%
                add_annotations(axistitle = TRUE, text = "Type M Error", x = -0.05, xref = "paper", xanchor = "right", yanchor = "right", y = 0.5, yref = "paper", showarrow = FALSE) %>%
                config(modeBarButtonsToRemove = list(
                    "resetViews",
                    "toggleSpikelines",
                    "resetViewMapbox"
                ), displaylogo = FALSE))

        }

    },
    )

}



shinyApp(ui, server)
