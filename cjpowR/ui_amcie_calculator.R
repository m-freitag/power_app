list(
    wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
        radioButtons(
            "tbd_calc_amcie",
                tags$h4("I'm interested in calculating...", style = "text-align: left; margin-bottom: 20px;"),
            c(
                "Minimum Effective N" = "Effective N",
                "Power" = "Power"
            )
        ),
        tags$h4("Input Values", style="margin-top: 25px;margin-bottom: 1rem;"),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "n_single_p_calc_amcie",
                label = source(file = "desc/n_desc.R", local = TRUE)$value,
                min = 500,
                max = 100000,
                value = 10000,
                step = 100
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "power_single_n_calc_amcie",
                label = source(file = "desc/power_desc.R", local = TRUE)$value,
                min = 0,
                max = 1,
                value = 0.8,
                step = 0.1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "delta3_single_n_calc_amcie",
                label = source(file = "desc/delta3_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.05,
                step = 0.01
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "delta3_single_p_calc_amcie",
                label = source(file = "desc/delta3_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.05,
                step = 0.01
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "levels1_single_n_calc_amcie",
                label = source(file = "desc/levels1_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 2,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "levels1_single_p_calc_amcie",
                label = source(file = "desc/levels1_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 2,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "levels2_single_n_calc_amcie",
                label = source(file = "desc/levels2_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 2,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "levels2_single_p_calc_amcie",
                label = source(file = "desc/levels2_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 2,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "p00_single_n_calc_amcie",
                label = source(file = "desc/p00_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.25,
                step = 0.001
            ),
            tags$div(class="header",
            tags$p("\\(p_{10}\\)"),
            tags$p(
                tags$div(
                    class = "text-muted",
                    textOutput("selected_n_p00")
                )
                )
        )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "p00_single_p_calc_amcie",
                label = source(file = "desc/p00_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.25,
                step = 0.001
            ),
            tags$div(class="header",
            tags$p("\\(p_{10}\\)"),
            tags$p(
                tags$div(
                    class = "text-muted",
                    textOutput("selected_p_p00")
                )
                )
        )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "p01_single_n_calc_amcie",
                label = source(file = "desc/p01_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.25,
                step = 0.001
            ),
            tags$div(class="header",
            tags$p("\\(p_{11}\\)"),
            tags$p(
                tags$div(
                    class = "text-muted",
                    textOutput("selected_n_p01")
                )
                )
        )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "p01_single_p_calc_amcie",
                label = source(file = "desc/p01_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.25,
                step = 0.001
            ),
            tags$div(class="header",
            tags$p("\\(p_{11}\\)"),
            tags$p(
                tags$div(
                    class = "text-muted",
                    textOutput("selected_p_p01")
                )
                )
        )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N'",
            numericInput(
                "alpha_single_n_calc_amcie",
                label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.3,
                value = 0.05,
                step = 0.001
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power'",
            numericInput(
                "alpha_single_p_calc_amcie",
                label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.3,
                value = 0.05,
                step = 0.001
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Effective N' &&
                        input.p00_single_n_calc_amcie < input.p01_single_n_calc_amcie",
            tags$p(class = "text-danger", HTML(
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
        </svg>', "Note: More probability mass on p01 and p11 than on p00 and p01. This implies output is not a worst-case bound (but only marginally so). To obtain worst-case bounds, shift more mass to p00 and p01."
            ))
        ),
        conditionalPanel(
            condition = "input.tbd_calc_amcie == 'Power' &&
                        input.p00_single_p_calc_amcie < input.p01_single_p_calc_amcie",
            tags$p(class = "text-danger", HTML(
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
        </svg>', "Note: More probability mass on p01 and p11 than on p00 and p01. This implies output is not a worst-case bound (but only marginally so). To obtain worst-case bounds, shift more mass to p00 and p01."
            ))
        )
                
        )
)