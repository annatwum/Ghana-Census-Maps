library(shiny)

  ui=shinyUI(fluidPage(
    titlePanel("Ghana Census Maps"),
    sidebarLayout(
      sidebarPanel(
        h2("About project"),
        p("Maps were created using IPUMS sample data from Ghana's 2010 census"),
        p("R code: https://github.com/annatwum"),
        radioButtons("n", label = h4("Available Maps"),
                     choices = list("Electricity access" = 1, "Pipe water access" = 2),
                     selected = 1)
      ),
      mainPanel(
        imageOutput("Image")
      )
    )
    
    
    
  ))
  
  server=shinyServer(function(input, output, session) {
    # Send a  image, and don't delete the image after sending it
    output$Image <- renderImage({
      # When input$n is 3, filename is ./images/image3.jpeg
      filename <- normalizePath(file.path('./www',
                                          paste('image', input$n, '.png', sep='')))
      
      # Return a list containining the filename
      list(src =filename,width="800px",
           height="700px",align="center")
      
    }, deleteFile = FALSE)
  })

shinyApp(ui, server)


  
