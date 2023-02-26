list(
wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",selectInput(
    "tbd", 
    tags$div(
        class = "header", style = "text-align: left; margin-top: 10px; margin-bottom: 5px;",
        tags$h4("I'm interested in calculating...")
    ),
    c(
        "Minimum Effective N" = "Effective N", 
        "Power" = "Power",
        "Type S Error" = "Type S Error",
        "Type M Error" = "Type M Error"
    )
)),
wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
    tags$h4("Plot Layout", style="margin-top: -20px;margin-bottom: 1rem;"),
tags$div(class="header",
    tags$p("Y-Axis"),
    tags$p(
        tags$div(
            class = "text-muted",
            textOutput("selected_tbd")
        )
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N'",
    selectInput(
        "xaxis_n",
        "X-Axis",
        c(
            Amce = "amce",
            Power = "power",
            Alpha = "alpha"
        )
    ),
    selectInput(
        "byaxis_n",
        "By",
        c(
            Power = "power",
            Amce = "amce",
            Levels = "levels",
            Alpha = "alpha"
        )
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power'",
    selectInput(
        "xaxis_p",
        "X-Axis",
        c(
            Amce = "amce",
            "Effective N" = "n",
            Alpha = "alpha"
        )
    ),
    selectInput(
        "byaxis_p",
        "By",
        c(
            "Effective N" = "n",
            Amce = "amce",
            Levels = "levels",
            Alpha = "alpha"
        )
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error'",
    selectInput(
        "xaxis_s",
        "X-Axis",
        c(
            Amce = "amce",
            "Effective N" = "n",
            Alpha = "alpha"
        )
    ),
    selectInput(
        "byaxis_s",
        "By",
        c(
            "Effective N" = "n",
            Amce = "amce",
            Levels = "levels",
            Alpha = "alpha"
        )
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error'",
    selectInput(
        "xaxis_m",
        "X-Axis",
        c(
            Amce = "amce",
            "Effective N" = "n",
            Alpha = "alpha"
        )
    ),
    selectInput(
        "byaxis_m",
        "By",
        c(
            "Effective N" = "n",
            Amce = "amce",
            Levels = "levels",
            Alpha = "alpha"
        )
    )
)),
wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
    style = "text-align: left; margin-bottom: 25px;",
    tags$h4("Input Values", style="margin-top: -20px;margin-bottom: 1rem;"),                                        
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                    input.xaxis_p != input.byaxis_p &&
                    (input.xaxis_p == 'n' ||
                    input.byaxis_p == 'n')",
    sliderInput(
        "n_slide_p",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = c(2000, 20000),
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                    input.xaxis_s != input.byaxis_s &&
                    (input.xaxis_s == 'n' ||
                    input.byaxis_s == 'n')",
    sliderInput(
        "n_slide_s",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = c(2000, 20000),
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                    input.xaxis_m != input.byaxis_m &&
                    (input.xaxis_m == 'n' ||
                    input.byaxis_m == 'n')",
    sliderInput(
        "n_slide_m",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = c(2000, 20000),
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                    input.xaxis_p != input.byaxis_p &&
                    (input.xaxis_p != 'n' &&
                    input.byaxis_p != 'n')",
    numericInput(
        "n_single_p",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = 10000,
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                    input.xaxis_s != input.byaxis_s &&
                    (input.xaxis_s != 'n' &&
                    input.byaxis_s != 'n')",
    numericInput(
        "n_single_s",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = 10000,
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                    input.xaxis_m != input.byaxis_m &&
                    (input.xaxis_m != 'n' &&
                    input.byaxis_m != 'n')",
    numericInput(
        "n_single_m",
        label = source(file = "desc/n_desc.R", local = TRUE)$value,
        min = 500,
        max = 50000,
        value = 10000,
        step = 100
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n == 'power' ||
                 input.byaxis_n == 'power')",
    sliderInput( 
        "power_slide_n",
        label = source(file = "desc/power_desc.R", local = TRUE)$value,
        min = 0,
        max = 1,
        value = c(0.5, 0.8),
        step = 0.1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n != 'power' &&
                 input.byaxis_n != 'power')",
    numericInput(
        "power_single_n",
        label = source(file = "desc/power_desc.R", local = TRUE)$value,
        min = 0,
        max = 1,
        value = 0.8,
        step = 0.1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n == 'amce' ||
                 input.byaxis_n == 'amce')",
    sliderInput(
        "amce_slide_n",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = c(0.02, 0.1),
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p != input.byaxis_p &&
                 (input.xaxis_p == 'amce' ||
                 input.byaxis_p == 'amce')",
    sliderInput(
        "amce_slide_p",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = c(0.02, 0.1),
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s != input.byaxis_s &&
                 (input.xaxis_s == 'amce' ||
                 input.byaxis_s == 'amce')",
    sliderInput(
        "amce_slide_s",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = c(0.02, 0.1),
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m != input.byaxis_m &&
                 (input.xaxis_m == 'amce' ||
                 input.byaxis_m == 'amce')",
    sliderInput(
        "amce_slide_m",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = c(0.02, 0.1),
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n != 'amce' &&
                 input.byaxis_n != 'amce')",
    numericInput(
        "amce_single_n",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = 0.05,
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p != input.byaxis_p &&
                 (input.xaxis_p != 'amce' &&
                 input.byaxis_p != 'amce')",
    numericInput(
        "amce_single_p",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = 0.05,
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s != input.byaxis_s &&
                 (input.xaxis_s != 'amce' &&
                 input.byaxis_s != 'amce')",
    numericInput(
        "amce_single_s",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = 0.05,
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m != input.byaxis_m &&
                 (input.xaxis_m != 'amce' &&
                 input.byaxis_m != 'amce')",
    numericInput(
        "amce_single_m",
        label = source(file = "desc/amce_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.5,
        value = 0.05,
        step = 0.01
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.byaxis_n == 'levels'",
    sliderInput(
        "levels_slide_n",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = c(3, 5),
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.byaxis_p == 'levels'",
    sliderInput(
        "levels_slide_p",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = c(3, 5),
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.byaxis_s == 'levels'",
    sliderInput(
        "levels_slide_s",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = c(3, 5),
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.byaxis_m == 'levels'",
    sliderInput(
        "levels_slide_m",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = c(3, 5),
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 input.byaxis_n != 'levels'",
    numericInput(
        "levels_single_n",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = 3,
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p != input.byaxis_p &&
                 input.byaxis_p != 'levels'",
    numericInput(
        "levels_single_p",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = 3,
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s != input.byaxis_s &&
                 input.byaxis_s != 'levels'",
    numericInput(
        "levels_single_s",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = 3,
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m != input.byaxis_m &&
                 input.byaxis_m != 'levels'",
    numericInput(
        "levels_single_m",
        label = source(file = "desc/levels_desc.R", local = TRUE)$value,
        min = 2,
        max = 20,
        value = 3,
        step = 1
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n == 'alpha' ||
                 input.byaxis_n == 'alpha')",
    sliderInput(
        "alpha_slide_n",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = c(0.001, 0.05),
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p != input.byaxis_p &&
                 (input.xaxis_p == 'alpha' ||
                 input.byaxis_p == 'alpha')",
    sliderInput(
        "alpha_slide_p",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = c(0.001, 0.05),
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s != input.byaxis_s &&
                 (input.xaxis_s == 'alpha' ||
                 input.byaxis_s == 'alpha')",
    sliderInput(
        "alpha_slide_s",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = c(0.001, 0.05),
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m != input.byaxis_m &&
                 (input.xaxis_m == 'alpha' ||
                 input.byaxis_m == 'alpha')",
    sliderInput(
        "alpha_slide_m",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = c(0.001, 0.05),
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n != input.byaxis_n &&
                 (input.xaxis_n != 'alpha' &&
                 input.byaxis_n != 'alpha')",
    numericInput(
        "alpha_single_n",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = 0.05,
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p != input.byaxis_p &&
                 (input.xaxis_p != 'alpha' &&
                 input.byaxis_p != 'alpha')",
    numericInput(
        "alpha_single_p",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = 0.05,
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s != input.byaxis_s &&
                 (input.xaxis_s != 'alpha' &&
                 input.byaxis_s != 'alpha')",
    numericInput(
        "alpha_single_s",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = 0.05,
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m != input.byaxis_m &&
                 (input.xaxis_m != 'alpha' &&
                 input.byaxis_m != 'alpha')",
    numericInput(
        "alpha_single_m",
        label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
        min = 0,
        max = 0.2,
        value = 0.05,
        step = 0.001
    )
),
conditionalPanel(
    condition = "input.tbd == 'Effective N' &&
                 input.xaxis_n == input.byaxis_n",
    tags$p(class = "text-danger", HTML(
'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>', "The x-axis input und grouping input have to differ."
    ))
),
conditionalPanel(
    condition = "input.tbd == 'Power' &&
                 input.xaxis_p == input.byaxis_p",
    tags$p(class = "text-danger", HTML(
'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>', "The x-axis input und grouping input have to differ."
    ))
),
conditionalPanel(
    condition = "input.tbd == 'Type S Error' &&
                 input.xaxis_s == input.byaxis_s",
    tags$p(class = "text-danger", HTML(
'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>', "The x-axis input und grouping input have to differ."
    ))
),
conditionalPanel(
    condition = "input.tbd == 'Type M Error' &&
                 input.xaxis_m == input.byaxis_m",
    tags$p(class = "text-danger", HTML(
'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>', "The x-axis input und grouping input have to differ."
    ))
)
)
)
