library(shiny)
library(dplyr)
library(ggplot2)
# Define the UI

ui <- fluidPage(
titlePanel("Time Series Plot and Summary Statistics"),
sidebarLayout(
sidebarPanel(
selectInput(inputId = "column", label = "Choose  column 1:", choices = c("rainfall_mm", "minDailyTempC_belowCanopy",
                                                                        "maxDailyTempC_belowCanopy", "rainfall_mm_nadp",
                                                                        "solarrad_kj_m2_nadp", "Cond_QP", "Cl_QP"),
             selected="rainfall_mm")),
mainPanel(
plotOutput("plot"),
actionButton("print", "Print Hello"),
verbatimTextOutput("test")
)
)
)
# Define the server

server <- function(input, output) {
  observeEvent(input$print, {
    print("Hello")
  })
# Read the data
# met_data_daily_withEVRainAndQSChem
  observe({
  data <- read.csv("./met_data_daily_withEVRainAndQSChem.csv")
# Filter the data by dataset and column
print(input$column)
print(summary(data))})
filtered_data <- reactive({data %>%
  select(Date, input$column)})
  # filter(column) %>%
# Plot the data
observe({
  print(summary(filtered_data))
output$plot <- renderPlot({
ggplot(filtered_data, aes(x = Date, y =paste0(input$column))) +
geom_line()
})
# Show the summary statistics
renderPrint({'hello'})
output$summary <- renderPrint({
summary(filtered_data)
})})
}
# Run the app

shinyApp(ui, server)