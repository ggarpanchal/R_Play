#    http://shiny.rstudio.com/
library(shiny)

ui <- fluidPage(
    h1("Jigar Panchal"),
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Choose a dataset:", 
                        choices = ls("package:datasets"),
                        selected = "pressure")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Str",
                         verbatimTextOutput("dump")
                ),
                tabPanel("Plot",
                         plotOutput("plot")
                ),
                tabPanel("Table",
                         tableOutput("table")
                )
                
            )
        )
    )
)

server <- function(input, output, session){
    output$dump <- renderPrint({
        dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
        str(dataset)
    })
    output$plot <- renderPlot({
        dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
        plot(dataset)
    })
    output$table <- renderTable({
        dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
        dataset
    })
}

shinyApp(ui = ui, server = server)
