library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("AUCSS: Arthur's Ugly Credit Scoring Software"),
  
 
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    
    mainPanel(
      br(),
      br(),
      br(),
     
      
      column(3, selectInput("checking_status", "Checking Account Status:",
                            c("<0" = "<0",
                              "0<=X<200" = "0<=X<200",
                              ">=200" = ">=200",
                              "no checking" = "no checking"))),
      
      column(3, sliderInput("duration",
                            "Loan duration:",
                            min = 1,
                            max = 100,
                            value = 50)),
      
      column(3, selectInput("credit_history", "Credit History:",
                            c("no credits/all paid" = "no credits/all paid",
                              "all paid" = "all paid",
                              "existing paid" = "existing paid",
                              "delayed previously" = "delayed previously",
                              "critical/other existing credit" = "critical/other existing credit"))),
      
      column(3, selectInput("purpose", "Loan Purpose:",
                            c("new car"  = "new car",
                              "used car" = "used car",
                              "furniture/equipment" = "furniture/equipment",
                              "radio/tv" = "radio/tv",
                              "education" = "education",
                              "business" = "business",
                              "other" = "other"))),
      
      br(), br(),  br(),br(),  br(), br(), br(), br(),br(),
      
      
      column(3, sliderInput("credit_amount",
                            "Credit Amount:",
                            min = 300,
                            max = 10000,
                            value = 3000)),
      
      
      column(3, selectInput("savings_status", "Saving Status:",
                            c("<100"  = "<100",
                              "100<=X<500" = "100<=X<500",
                              "500<=X<1000" = "500<=X<1000",
                              ">=1000" = ">=1000",
                              "no known savings" = "no known savings"))),
      
      column(3, selectInput("employment", "Employment:",
                            c("unemployed"  = "unemployed",
                              "<1" = "<1",
                              "1<=X<4" = "1<=X<4",
                              "4<=X<7" = "4<=X<7",
                              ">=7" = ">=7"))),
      
      
      column(3, sliderInput("installment_commitment",
                            "Installment Commitment:",
                            min = 1,
                            max = 4,
                            value = 3)),
      
      br(), br(),  br(),br(),  br(), br(), br(), br(),br(),
      
      
      column(3, selectInput("personal_status", "Personal Status:",
                            c("male div/sep"  = "male div/sep",
                              "female div/dep/mar" = "female div/dep/mar",
                              "male single" = "male single",
                              "male mar/wid" = "male mar/wid",
                              "female single" = "female single"))),
      
      
      column(3, selectInput("other_parties", "Other Parties:",
                            c("none"  = "none",
                              "co applicant" = "co applicant",
                              "guarantor" = "guarantor"))),
      
      column(3, sliderInput("residence_since", "Residence Since",
                            min = 1,
                            max = 5,
                            value = 3)),
      
      column(3, selectInput("property_magnitude", "Property Magnitude:",
                            c("real estate"  = "real estate",
                              "life insurance" = "life insurance",
                              "car" = "car",
                              "no known property" = "no known property"))),

      
      br(), br(),  br(),br(),  br(), br(), br(), br(),br(),
      
      column(3, sliderInput("age",
                            "Age:",
                            min = 19,
                            max = 75,
                            value = 33)),
      
      column(3, selectInput("other_payment_plans", "Other Payment Plans:",
                            c("bank"  = "bank",
                              "stores" = "stores",
                              "none" = "none"))),
      
      column(3, selectInput("housing", "Housing:",
                            c("rent"  = "rent",
                              "own" = "own",
                              "for free" = "for free"))),
      
      column(3, sliderInput("existing_credits",
                            "Existing Credits:",
                            min = 1,
                            max = 4,
                            value = 1)),

      br(), br(),  br(),br(),  br(), br(), br(), br(),br(),

      
      column(3, selectInput("job", "Job:",
                            c("unemp/unskilled non res"  = "unemp/unskilled non res",
                              "unskilled resident" = "unskilled resident",
                              "high qualif/self emp/mgmt" = "high qualif/self emp/mgmt", 
                              "skilled"))),
          
      column(3, sliderInput("num_dependents",
                            "Number of Dependents:",
                            min = 1,
                            max = 2,
                            value = 1)),
      
      column(3, radioButtons("own_telephone", "Own Telephone:", choices = list("yes" = "yes", "none" = "none"))),
      
      
    column(3, radioButtons("foreign_worker", "Foreign Worker:", choices = list("yes" = "yes", "no" = "no"))),
            
      br(), br(),  br(),br(),  br(), br(), br(), br(),br(),
   
      submitButton("Classify the client"),
      h1(textOutput("classification") )

      
     
    ),
    
    # Show a plot of the generated distribution
    sidebarPanel(
      h3("Operator: Arthur Carvalho"),
      img(src="southparkme.jpg", contentType = 'image/jpg', height = 400, width = 400)     
    )
  )
))