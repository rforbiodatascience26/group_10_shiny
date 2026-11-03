   library("shiny")
   source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  dna <- reactive({
    gene_dna(length = input$n_bases, base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  
  rna <- reactive({
    transcribe_dna(dna = dna())
  })

  output$dna <- renderText({
    dna()
  })

  output$rna <- renderText({
    rna()
  })
  
  output$protein <- renderText({
    translate_rna(rna = rna())
  })
}
