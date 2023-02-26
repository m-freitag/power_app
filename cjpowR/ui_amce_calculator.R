list(
    wellPanel(style = "border: 0px solid rgba(66,86,100,0.125);",
        radioButtons(
            "tbd_calc",
                tags$h4("I'm interested in calculating...", style = "text-align: left; margin-bottom: 20px;"),
            c(
                "Minimum Effective N" = "Effective N",
                "Power" = "Power"
            )
        ),
        tags$h4("Input Values", style="margin-top: 25px;margin-bottom: 1rem;"),
        conditionalPanel(
            condition = "input.tbd_calc == 'Power'",
            numericInput(
                "n_single_p_calc",
                label = source(file = "desc/n_desc.R", local = TRUE)$value,
                min = 500,
                max = 100000,
                value = 10000,
                step = 100
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Effective N'",
            numericInput(
                "power_single_n_calc",
                label = source(file = "desc/power_desc.R", local = TRUE)$value,
                min = 0,
                max = 1,
                value = 0.8,
                step = 0.1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Effective N'",
            numericInput(
                "amce_single_n_calc",
                label = source(file = "desc/amce_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.05,
                step = 0.01
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Power'",
            numericInput(
                "amce_single_p_calc",
                label = source(file = "desc/amce_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.5,
                value = 0.05,
                step = 0.01
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Effective N'",
            numericInput(
                "levels_single_n_calc",
                label = source(file = "desc/levels_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 5,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Power'",
            numericInput(
                "levels_single_p_calc",
                label = source(file = "desc/levels_desc.R", local = TRUE)$value,
                min = 2,
                max = 30,
                value = 5,
                step = 1
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Effective N'",
            numericInput(
                "alpha_single_n_calc",
                label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.3,
                value = 0.05,
                step = 0.001
            )
        ),
        conditionalPanel(
            condition = "input.tbd_calc == 'Power'",
            numericInput(
                "alpha_single_p_calc",
                label = source(file = "desc/alpha_desc.R", local = TRUE)$value,
                min = 0,
                max = 0.3,
                value = 0.05,
                step = 0.001
            )
        )
                
        )
)