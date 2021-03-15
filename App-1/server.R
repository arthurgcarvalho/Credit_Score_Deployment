library(shiny)
library(rpart)

#load model
tree      <- readRDS("tree.rds")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    
  prediction <- reactive({ 
  
          data.frame(CHECKING_STATUS        = input$checking_status,           
                     DURATION               = input$duration,       
                     CREDIT_HISTORY         = input$credit_history,          
                     PURPOSE                = input$purpose,    
                     CREDIT_AMOUNT          = input$credit_amount,      
                     SAVINGS_STATUS         = input$savings_status,    
                     EMPLOYMENT             = input$employment, 
                     INSTALLMENT_COMMITMENT = input$installment_commitment,
                     PERSONAL_STATUS        = input$personal_status,     
                     OTHER_PARTIES          = input$other_parties, 
                     RESIDENCE_SINCE        = input$residence_since, 
                     PROPERTY_MAGNITUDE     = input$property_magnitude,
                     AGE                    = input$age,           
                     OTHER_PAYMENT_PLANS    = input$other_payment_plans, 
                     HOUSING                = input$housing,           
                     EXISTING_CREDITS       = input$existing_credits,
                     JOB                    = input$job,         
                     NUM_DEPENDENTS         = input$num_dependents,      
                     OWN_TELEPHONE          = input$own_telephone,     
                     FOREIGN_WORKER         = input$foreign_worker)
    
    
  
  })
  
  
  
  output$classification <- renderText({
    
    data   <- prediction()
    result <- predict(tree, data)
    paste("Probability the client is bad:" , round(result[1],2), 
          "\nProbability the client is good:", round(result[2],2))
    })
  
  
})