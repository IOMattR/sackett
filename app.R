library(psychmeta)
library(psych)
library(matlib)
library(shiny)


ui <- pageWithSidebar(
  headerPanel("Composite Validity Estimates According to Berry et al. (Under Review)"),
  
  sidebarPanel(
    selectInput("predictor",
                "Predictor:",
                c("Biodata" = "Biodata",
                  "Cognitive Ability" = "Cognitive_Ability",
                  "Conscientiousness" = "Conscientiousness",
                  "Structured Interview" = "Structured_Interview",
                  "Integrity" = "Integrity_Test",
                  "SJT" = "Situational_Judgement_Test"))
    ),
    
  mainPanel(
    h3(textOutput("caption"))
  )
  
  
  
  
)

server <- function(input, output) {
  correls <- matrix(c(1,
                      0.18,
                      0.54,
                      0.21,
                      0.25,
                      0.42,
                      0.38,
                      0.18,
                      1,
                      0.03,
                      0.18,
                      0.01,
                      0.29,
                      0.31,
                      0.54,
                      0.03,
                      1,
                      0.08,
                      0.28,
                      0.23,
                      0.19,
                      0.21,
                      0.18,
                      0.08,
                      1,
                      -0.02,
                      0.45,
                      0.42,
                      0.25,
                      0.01,
                      0.28,
                      -0.02,
                      1,
                      0.16,
                      0.31,
                      0.42,
                      0.29,
                      0.23,
                      0.45,
                      0.16,
                      1,
                      0.26,
                      0.38,
                      0.31,
                      0.19,
                      0.42,
                      0.31,
                      0.26,
                      1),
                    nrow = 7,
                    ncol = 7)
  
  correls <- as.data.frame(correls)
  colnames(correls) <- c("Biodata",
                         "Cognitive_Ability",
                         "Conscientiousness",
                         "Structured_Interview",
                         "Integrity_Test",
                         "Situational_Judgement_Test",
                         "Performance")
#  number <- reactive({
#    paste(input$predictor)
#  })
  
  
  
 output$caption <- renderText({correls[7, input$predictor]})
  
  #correctedWts <- inv(as.matrix(sackett[1:6, 1:6])) %*% as.matrix(sackett[1:6, 7])
  
  #sackettR <- composite_r_matrix(r_mat = as.matrix(sackett),
   #                              x_col = 1:6,
    #                             y_col = 7,
     #                            wt_vec_x = as.vector(correctedWts))
  
  
  #sackett <- read.csv("sackett.csv", header = TRUE, row.names = 1)
  
  
}


shinyApp(ui, server)




 


