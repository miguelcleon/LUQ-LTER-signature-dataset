library(shiny)
library(tidyverse)
library(ggplot2)

# Define the UI
sigdata <- read.csv("./met_shrimp_birds_data_daily.csv")
sigdata <- sigdata %>% mutate(
  Date = as.Date(Date, format = "%Y-%m-%d"))
sigdata2 <-sigdata %>% pivot_longer(cols = c(-Date, -site), names_to= "variable",
                            values_to="value")

ui <- fluidPage(
  sidebarPanel(
    selectInput(inputId="ddvar1", label="pick an x variable",
                choices=colnames(sigdata), selected="Date"),
    selectInput(inputId="ddvar2", label="pick a second x variable",
                choices=colnames(sigdata), selected="rainfall mm"),
        selectInput(inputId="ddbird", label="pick a bird species",
                choices=c("None", unique(sigdata$bird_species_LFDP)))
  ),
  tags$h3("Daily signature dataset values"),
  tags$a(href="https://portal.edirepository.org/nis/home.jsp",
         "From the EDI data repository."),
  dataTableOutput(outputId="datasummary"),
  plotOutput(outputId = "plotme")
)

# Define the server
server <- function(input, output) {
  subsigdata <- reactive({
    sigdata[,c(input$ddvar1, input$ddvar2)]  # sigdata %>% select(input$ddvar1, input$ddvar2)# [,c(input$ddvar1, input$ddvar2)]
  })

  observe({
    if (input$ddbird != "None") {
      # sigdata2 <-  sigdata2[sigdata$bird_species_LFDP == input$ddbird,]
      sigdata <-  sigdata %>% filter(bird_species_LFDP == input$ddbird)
      # sigdata2 <-  sigdata2 %>% filter(bird_species_LFDP == input$ddbird)
    }
    subsigdata <-  sigdata[,c(input$ddvar1, input$ddvar2)]
    # sigdata2 <- sigdata2 %>% mutate_at(variable=='')
    subsig2 <- sigdata2 %>% filter(variable %in% c(input$ddvar1, input$ddvar2))

    print('selection')
    print(input$ddvar1)
    print(input$ddvar2)
    var1 <- input$ddvar1
    var2 <- input$ddvar2
    output$datasummary <- renderDataTable({
      summary(subsigdata())
    })
    output$plotme <- renderPlot({
      ggplot(subsig2, aes(subsig2, x=Date, y=value)) +
         geom_point(data = subsig2[subsig2$variable %in% c(var1,var2),], aes(x =Date, y=value, color=variable)) +
         # cale_color_manual(values = c(var1 = '#3399ff',var2 = 'chartreuse4'))  +
          xlab("Date")
    })
  })
}

shinyApp(ui, server)
