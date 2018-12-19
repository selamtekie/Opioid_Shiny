#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
server <- function(input, output, session) {
  
  output$plot <- renderPlotly({
    # specify some map projection/options
    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      lakecolor = toRGB('white')
    )
    plot_geo(overdoses_shiny, locationmode = 'USA-states') %>%
      add_trace(
        z = ~Deaths_Per_100K, locations = ~Abbrev,zmin = 0, zmax = 43,
        colors = 'Blues'
      ) %>%
      colorbar(title = "Death Rate") %>%
      layout(
        geo = g)
  })
  
  output$click <- renderPrint({
    d <- event_data("plotly_click")
    if (is.null(d)) "Click on a state to view overdose related deaths per 100k population" else d
  })
  
}
