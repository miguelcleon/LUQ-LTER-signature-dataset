
# Load necessary libraries
library(shiny)
library(tidyverse)
library(ggplot2)
library(DT)
library(lubridate)
library(plotly)
library(EML)

# Set working directory
# setwd("C:/Users/ml1451/OneDrive - USNH/signature datasets/LUQ-LTER-signature-dataset/sigds/")
setwd("/mnt2/shinyapps/sigds/")
eml_file <- "knb-lter-luq.236.12.xml"
eml_data <- read_eml(eml_file)

# Extract dataset-level metadata
dataset_title <- eml_data$dataset$title
abstract_content <- eml_data$dataset$abstract

# Initialize an empty character vector to store abstract content
abstract_text <- character()

if (is.list(abstract_content)) {
  # Loop over each element in the abstract list
  for (element in abstract_content) {
    # Check if the element contains 'markdown' and add to abstract_text
    if (!is.null(element$markdown)) {
      abstract_text <- c(abstract_text, element$markdown)
    }
    # Check if the element contains 'para' and add to abstract_text
    if (!is.null(element$para)) {
      abstract_text <- c(abstract_text, element$para)
    }
    # If element is a character vector, add it directly
    if (is.character(element)) {
      abstract_text <- c(abstract_text, element)
    }
  }
} else if (is.character(abstract_content)) {
  # If abstract_content is a character vector, add it directly
  abstract_text <- abstract_content
}

# Combine the abstract text into a single string
dataset_abstract <- paste(abstract_text, collapse = "\n\n")

# Extract attribute-level metadata
attributes <- eml_get(eml_data, "attributeList")[[1]]$attribute
# Define UI

# Define UI
ui <- fluidPage(
  # Create a horizontal layout with the logo and title
  fluidRow(
    column(width = 2,
      tags$div(
        img(src = "LUQLTERLogo.jpg", height = "80px"),
        style = "padding: 10px;"
      )
    ),
    column(width = 10,
      h1("Luquillo LTER Signature Dataset Explorer", align = "left", style = "margin-top: 20px;")
    )
  ),
  # Add a horizontal line to separate the header from the rest of the app
  tags$hr(),

  # Create a tabset panel with three tabs: App, Help, Metadata
  tabsetPanel(
    tabPanel("App",
      # The main content of your app goes here
      sidebarLayout(
        sidebarPanel(
          # Your existing sidebar inputs
          radioButtons(
            inputId = "data_frequency",
            label = "Select data frequency:",
            choices = list("Daily" = "daily", "Monthly" = "monthly"),
            selected = "daily"
          ),
          uiOutput("variableSelect"),  # Updated variable selection
          checkboxInput("normalize", "Normalize values between 0 and 1", value = FALSE),
          actionButton("plotButton", "Plot the data"),
          downloadButton("downloadData", "Download Data")
        ),
        mainPanel(
          # Your existing main panel outputs
          h4("About the Dataset"),
          p("This application uses data from the ",
            a("Luquillo Long-Term Ecological Research (LTER) Signature Dataset",
              href = "https://portal.edirepository.org/nis/mapbrowse?scope=knb-lter-luq&identifier=236",
              target = "_blank"),
            ". The dataset contains long-term ecological measurements from the Luquillo Experimental Forest in Puerto Rico."
          ),
          verbatimTextOutput(outputId = "datasummary"),
          plotlyOutput(outputId = "plotme")
        )
      )
    ),
    tabPanel("Help",
      # Include the how_to_use_app.html file
      includeHTML("how_to_use_app.html")
    ),
    tabPanel("Dataset Metadata",
      # Display dataset-level metadata
      h2("Dataset Metadata"),
      verbatimTextOutput("datasetMetadata"),
      h2("Variables Metadata"),
      DTOutput("variablesMetadata")
    )
  )
)



# Define Server
server <- function(input, output, session) {

  # Load and preprocess data based on user's selection
  sigdata <- reactive({
    # Determine which file to load based on user's selection
    if (input$data_frequency == "daily") {
      data_file <- "./LUQ_signature_daily.csv"
      date_column <- "date"
    } else {
      data_file <- "./LUQ_signature_monthly.csv"
      date_column <- "month"
    }

    # Load data
    data <- read.csv(data_file, stringsAsFactors = FALSE)

    # If daily data, rename 'Date' column to 'date'
    if (input$data_frequency == "daily") {
      if ("Date" %in% names(data)) {
        names(data)[names(data) == "Date"] <- "date"
      } else {
        stop("Expected 'Date' column not found in the daily data.")
      }
    }

    # Check if the date column exists
    if (!date_column %in% names(data)) {
      stop(paste("Date column", date_column, "not found in the data. Available columns are:", paste(names(data), collapse = ", ")))
    }

    # Attempt to parse dates
    parsed_dates <- ymd(data[[date_column]], quiet = TRUE)

    # If parsing fails, try alternative formats
    if (all(is.na(parsed_dates))) {
      parsed_dates <- mdy(data[[date_column]], quiet = TRUE)
    }
    if (all(is.na(parsed_dates))) {
      parsed_dates <- dmy(data[[date_column]], quiet = TRUE)
    }
    if (all(is.na(parsed_dates))) {
      stop("Date parsing failed. Please check the date format in your data.")
    }

    # Assign the parsed dates to the data frame
    data$Date <- parsed_dates

    # Remove the original date column
    data <- data %>%
      select(-all_of(date_column)) %>%
      drop_na(Date)  # Remove rows with invalid dates if any

    # Replace zeros with NA
    data <- data %>%
      mutate(across(where(is.numeric), ~ na_if(., 0)))

    return(data)
  })

  # Parse the EML file
  eml_file <- "knb-lter-luq.236.12.xml"
  eml_data <- read_eml(eml_file)

  # Extract dataset-level metadata
  dataset_title <- eml_data$dataset$title
  dataset_abstract <- paste(unlist(eml_data$dataset$abstract$para), collapse = "\n")

  # Extract attribute-level metadata
  attributeList <- eml_get(eml_data, "attributeList")[[1]]$attribute

  # Create a data frame of attribute metadata
  attributes_df <- data.frame(
    Name = sapply(attributeList, function(attr) attr$attributeName),
    Definition = sapply(attributeList, function(attr) attr$attributeDefinition),
    Unit = sapply(attributeList, function(attr) {
      if (!is.null(attr$measurementScale$ratio$unit$standardUnit)) {
        attr$measurementScale$ratio$unit$standardUnit
      } else if (!is.null(attr$measurementScale$interval$unit$standardUnit)) {
        attr$measurementScale$interval$unit$standardUnit
      } else if (!is.null(attr$measurementScale$ratio$unit$customUnit)) {
        attr$measurementScale$ratio$unit$customUnit
      } else {
        NA
      }
    }),
    stringsAsFactors = FALSE
  )

  # Update SelectInput choices based on loaded data and include definitions
  output$variableSelect <- renderUI({
    data <- sigdata()

    # Identify numeric columns for selection
    numeric_cols <- names(data)[sapply(data, is.numeric) & names(data) != "Date"]

    # Get definitions for numeric columns
    definitions <- attributes_df$Definition[match(numeric_cols, attributes_df$Name)]

    # Create choices with definitions
    choices <- setNames(numeric_cols, paste0(numeric_cols, " - ", definitions))

    selectInput(
      inputId = "variables",
      label = "Pick one or more variables to plot",
      choices = choices,
      selected = NULL,
      multiple = TRUE
    )
  })

  # Reactive expression to subset and optionally normalize data
  subsigdata <- reactive({
    req(input$variables)  # Ensure at least one variable is selected
    data <- sigdata() %>% select(Date, all_of(input$variables))

    # Normalize if checkbox is selected
    if (input$normalize) {
      data <- data %>%
        mutate(across(all_of(input$variables),
                      ~ {
                        var_min <- min(., na.rm = TRUE)
                        var_max <- max(., na.rm = TRUE)
                        if (!is.na(var_max - var_min) && (var_max - var_min) != 0) {
                          (. - var_min) / (var_max - var_min)
                        } else {
                          NA_real_  # Assign NA if all values are the same or if var_max and var_min are NA
                        }
                      }
        ))
    }

    # Remove leading rows where all selected variables are NA
    # Get the data columns (excluding Date)
    data_columns <- setdiff(names(data), "Date")

    # Find the index of the first row where at least one data column is not NA
    first_non_na_row <- which(rowSums(!is.na(data[data_columns])) > 0)[1]

    # If such a row exists, remove the leading rows before it
    if (!is.na(first_non_na_row) && first_non_na_row > 1) {
      data <- data[first_non_na_row:nrow(data), ]
    }

    return(data)
  })

  # Render data summary
  output$datasummary <- renderPrint({
    req(input$variables)  # Ensure at least one variable is selected
    summary(subsigdata())
  })

  # Render plot when 'Plot the data' button is clicked
  observeEvent(input$plotButton, {
    output$plotme <- renderPlotly({
      data_to_plot <- subsigdata()

      # Ensure that 'Date' is present and correctly formatted
      validate(
        need("Date" %in% names(data_to_plot), "Date column is missing.")
      )

      # Reshape data for plotting multiple variables
      plot_data <- pivot_longer(data_to_plot, cols = -Date, names_to = "Variable", values_to = "Value")

      # Plotting selected variables
      p <- ggplot(plot_data, aes(x = Date, y = Value, color = Variable,
                                 text = paste("Variable:", Variable,
                                              "<br>Value:", round(Value, 2),
                                              "<br>Date:", Date))) +
        geom_point() +
        labs(y = "Values", color = "Variables") +
        xlab("Date") +
        theme_minimal() +
        theme(
          legend.title = element_text(size = 14),
          legend.text = element_text(size = 12),
          legend.key.size = unit(1.5, "lines")
        )

      # Convert ggplot to plotly object for interactivity
      ggplotly(p, tooltip = "text")
    })
  })
output$downloadData <- downloadHandler(
  filename = function() {
    paste0("data_", input$data_frequency, ".csv")
  },
  content = function(file) {
    withProgress(message = "Downloading data, please wait...", value = 0, {
      incProgress(0.5)  # Incremental progress update

      # Simulate a delay for demonstration purposes (remove in production)
      Sys.sleep(2)

      # Generate the data to download
      data_to_download <- subsigdata()

      # Now write the data to the file
      write.csv(data_to_download, file, row.names = FALSE)

      incProgress(1)  # Mark completion
    })
  }
)


  # Output dataset metadata in the "Dataset Metadata" tab
  output$datasetMetadata <- renderPrint({
    cat("Title:", dataset_title, "\n\n")
    cat("Acknowlodgement:\n", dataset_abstract)
  })

  # Output variables metadata table
  output$variablesMetadata <- renderDT({
    datatable(attributes_df, options = list(pageLength = 10))
  })
}
# Run the Shiny app
shinyApp(ui, server)