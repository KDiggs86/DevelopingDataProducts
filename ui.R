library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("The Central Limit Theorem (CLT)"),
  sidebarPanel(
    withMathJax(),
    hr(),
    br(),
    helpText(strong('Step 1:'), 'Set the Size of Each Sample (bottom slider) to 40. Then use the Number of Samples slider to increase the number of samples used 
       to create the sampling distribution. Notice that as you increase the number of samples the histogram becomes
       more and more bell-shaped, the mean of the sampling distribution approaches the population mean of $3,980,446 and the standard deviation approaches
             \\(\\frac{\\sigma}{\\text{Number of Samples}}\\).'),
    sliderInput("samps2", "Number of Samples", min = 5, max = 10000, value = 10,
                step = 5),
    hr(),
    br(),
    helpText(strong('Step 2:'), 'Now set the Number of Samples (top slider) to a large number and use the slider below to increase the size of each sample.
       Notice that as the sample size increases the histrogram becomes more and more narrow. The standard deviation of the
       distribution is shrinking.'),
    sliderInput("sampsize2", "Size of Each Sample", min = 5, max = 200, value = 40,
                step = 5)
    #submitButton("Go!")
  ),
  mainPanel(
    withMathJax(),
    hr(),
    p('The goal of this app is to help students in an introductory statistics class understand
      the Central Limit Theorem. This theorem is one of the most important theorems in statistics
      yet is difficult to understand.', strong('Begin by reading the text below the histogram.')),
    hr(),
    h4('Mean of the sampling distribution of sample means'),
    verbatimTextOutput('mvmean'), 
    h4('Standard Deviation of the sampling distribution of sample means'),
    verbatimTextOutput('mvsdev'),
    h4('Stand. Dev. According to the CLT: \\(\\frac{\\sigma}{\\text{Number of Samples}}\\)'),
    verbatimTextOutput('calc'),
    plotOutput('newHist'),
    hr(),
    h3('The Central Limit Theorem:'),
    p('We create a', strong("sampling distribution of sample means", style = "color:blue"), 'by taking many many samples of the same size,
       finding the mean of each sample, and creating a new distribution in which each observation is the', em('mean'), 'of a sample.'),
    p(strong('Central Limit Theorem:', style = "color:blue"), 'Suppose we have a population with mean \\(\\mu\\) and standard deviation \\(\\sigma\\). If the sample size is large enough, then the sampling distribution
       of sample means is approximately normal (bell-shaped). Further, the mean of this sampling distribution is \\(\\mu\\)
       and the standard deviation is \\(\\frac{\\sigma}n\\), where \\(n\\) is the size of each sample.'),
    hr(),
    h3('This Application:'),
    p('In this app we start with the population of Major League Baseball salaries in 2014. The population mean salary is \\(\\mu=3,980,446\\) dollars and the population standard
       deviation is \\(\\sigma=5,155,339\\) dollars.'),
    p('In', strong('Step 1'), ' we draw many samples of the same size from this population. We then calculate the mean
      of each sample and use these means to create the histogram you see above. Play with the slider to increase the number
      of samples that we take. What happens as we increase the number of samples?'),
    p('In', strong('Step 2'), 'we set the number of samples to a large number (any number over 1000 will work) and see what happens when we change the 
      size of each sample. We still draw many samples of the same size, calculate the mean of each sample and use these means
      to create the histogram. Use the slider to increase the size of each sample. How does this change the shape of the histogram?'),
    hr()
  )
))

#div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
#p("span does the same thing as div, but it works with",
#span("groups of words", style = "color:blue"),
#"that appear inside a paragraph.")
