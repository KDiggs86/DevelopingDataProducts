library(shiny)
library(Lahman)
data("Salaries")
Salaries14 <- subset(Salaries, yearID==2014)
#x <<- rnorm(1000000)
meansVector <- function(a,b){
  a<- as.numeric(a)
  b <- as.numeric(b)
  v <- vector()
  for(i in 1:a){
    y<- sample(Salaries14$salary,b)
    m <- mean(y)
    v <- append(v,m)
  }
  v
}
shinyServer(
  function(input,output){
    mv <- reactive({meansVector(input$samps2,input$sampsize2)})
    output$samps <- renderText(input$samps)
    output$sampsize <- renderText(input$sampsize)
    output$newHist <- renderPlot({hist(mv(),xlab='Sample Means', main='Histogram of Sampling Distribution of Sample Means',
                                       xlim=c(1000000,7000000))})
    output$mvmean <- renderPrint(mean(mv()))
    output$mvsdev <- renderPrint(sd(mv()))
    output$calc <- renderPrint(sd(Salaries14$salary)/sqrt(input$sampsize2))
  })